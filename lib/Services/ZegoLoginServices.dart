import 'dart:convert';
import 'dart:io' show Platform;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../constant/prefsConstant.dart';
import '../controller/Post_SE_Call_details_controller.dart';
import '../utils/helperWidget.dart';

ZegoUIKitPrebuiltCallController? callController;

/// local virtual login
Future<void> login({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID;
  currentUser.name = 'user_$userID';
}

/// local virtual logout
Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(cacheUserIDKey);
}

/// on user login
void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 1382134047 /*input your AppID*/,
    appSign:
        "c0c0758fa12bcc6354425a65706a5651cf27b8cfc9ec35b4731f50e9fe85cb08" /*input your AppSign*/,
    userID: currentUser.id,
    userName: currentUser.name,
    androidNotificationConfig: ZegoAndroidNotificationConfig(
      channelID: "ZegoUIKit",
      channelName: "Call Notifications",
      sound: "notification",
      //icon: "notification_icon",
    ),
    iOSNotificationConfig: ZegoIOSNotificationConfig(
      systemCallingIconName: 'CallKitIcon',
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      // config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);
      // config.onHangUpConfirmation = (BuildContext context) async {
      //   return await showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         backgroundColor: Colors.blue[900]!.withOpacity(0.9),
      //         title: const Text("This is your custom dialog",
      //             style: TextStyle(color: Colors.white70)),
      //         content: const Text(
      //             "You can customize this dialog however you like",
      //             style: TextStyle(color: Colors.white70)),
      //         actions: [
      //           ElevatedButton(
      //             child: const Text("Cancel",
      //                 style: TextStyle(color: Colors.white70)),
      //             onPressed: () => Navigator.of(context).pop(false),
      //           ),
      //           ElevatedButton(
      //               child: const Text("Exit"),
      //               onPressed: () async {
      //                 Navigator.pop(context);
      //
      //               }),
      //         ],
      //       );
      //     },
      //   );
      // };

      config.durationConfig.onDurationUpdate = (Duration duration) {
        MyZegoConst.callDuration = duration.inSeconds.toString();
      };
      config.onHangUp = () async{

        print("Call Durationsssss =====>>>${MyZegoConst.callDuration}");
     //   debugPrint(data.invitees.toString());
        debugPrint(data.invitees[0].id.toString());
        debugPrint(data.inviter?.id.toString());
       // debugPrint(data.inviter.toString());
        print("==callDuration========>${MyZegoConst.callDuration}");
      //  await Post_SE_Call_details_controller().Post_SE_Call_End_details_controller_method(data.invitees.toString(),data.inviter.toString(),MyZegoConst.callDuration);
      };
      config.onError = (ZegoUIKitError error) {
        debugPrint('onError:$error');
      };

      return config;
    },
  );
}

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}

Widget customAvatarBuilder(
  BuildContext context,
  Size size,
  ZegoUIKitUser? user,
  Map<String, dynamic> extraInfo,
) {
  return CachedNetworkImage(
    // imageUrl: 'https://robohash.org/${user?.id}.png',
    imageUrl: 'assets/images/cloverleaflogo.png',
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) {
      ZegoLoggerService.logInfo(
        '$user avatar url is invalid',
        tag: 'live audio',
        subTag: 'live page',
      );
      return ZegoAvatar(user: user, avatarSize: size);
    },
  );
}

Future<String> getUniqueUserId() async {
  String? deviceID;
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    final iosDeviceInfo = await deviceInfo.iosInfo;
    deviceID = iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    final androidDeviceInfo = await deviceInfo.androidInfo;
    deviceID = androidDeviceInfo.id; // unique ID on Android
  }

  if (deviceID != null && deviceID.length < 4) {
    if (Platform.isAndroid) {
      deviceID += '_android';
    } else if (Platform.isIOS) {
      deviceID += '_ios___';
    }
  }
  if (Platform.isAndroid) {
    deviceID ??= 'flutter_user_id_android';
  } else if (Platform.isIOS) {
    deviceID ??= 'flutter_user_id_ios';
  }

  final userID = md5
      .convert(utf8.encode(deviceID!))
      .toString()
      .replaceAll(RegExp(r'[^0-9]'), '');
  return userID.substring(userID.length - 6);
}

Widget sendCallButton({
  required bool isVideoCall,
  required TextEditingController inviteeUsersIDTextCtrl,
  void Function(String code, String message, List<String>)? onCallFinished,
}) {
  return ValueListenableBuilder<TextEditingValue>(
    valueListenable: inviteeUsersIDTextCtrl,
    builder: (context, inviteeUserID, _) {
      var invitees = getInvitesFromTextCtrl(inviteeUsersIDTextCtrl.text.trim());
      MyZegoConst.callType = isVideoCall ? "2" : "1";

      return ZegoSendCallInvitationButton(
        isVideoCall: isVideoCall,
        invitees: invitees,
        resourceID: "zego_cloud_resource_id",
        iconSize: const Size(40, 40),
        buttonSize: const Size(50, 50),
        onPressed: onCallFinished,
      );
    },
  );
}

List<ZegoUIKitUser> getInvitesFromTextCtrl(String textCtrlText) {
  List<ZegoUIKitUser> invitees = [];

  var inviteeIDs = textCtrlText.trim().replaceAll('，', '');
  inviteeIDs.split(",").forEach((inviteeUserID) {
    if (inviteeUserID.isEmpty) {
      return;
    }

    invitees.add(ZegoUIKitUser(
      id: inviteeUserID,
      name: 'user_$inviteeUserID',
    ));
  });

  return invitees;
}

void onSendCallInvitationFinished(
    String code, String message, List<String> errorInvitees) async {
  await callApi();

  if (errorInvitees.isNotEmpty) {
    String userIDs = "";
    for (int index = 0; index < errorInvitees.length; index++) {
      if (index >= 5) {
        userIDs += '... ';
        break;
      }

      var userID = errorInvitees.elementAt(index);
      userIDs += userID + ' ';
    }
    if (userIDs.isNotEmpty) {
      userIDs = userIDs.substring(0, userIDs.length - 1);
    }

    var message = 'User doesn\'t exist or is offline: $userIDs';
    if (code.isNotEmpty) {
      message += ', code: $code, message:$message';
    }
    customFlutterToast(message.toString());
  } else if (code.isNotEmpty) {
    customFlutterToast(
      'code: $code, message:$message',
    );
  }
}

callApi() async {
  print(await MyZegoConst.SE_Zego_id);
  print(await MyZegoConst.ENg_Zego_id);
  print(await MyZegoConst.callWorkId);
  print(await MyZegoConst.callType);
  print("Data=================================");
  await Post_SE_Call_details_controller().Post_SE_Call_Start_details_controller_method(MyZegoConst.SE_Zego_id, MyZegoConst.ENg_Zego_id, MyZegoConst.callWorkId, MyZegoConst.callType);
}
