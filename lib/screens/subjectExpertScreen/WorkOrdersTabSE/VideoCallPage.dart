import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../../../constant/prefsConstant.dart';
import '../../../utils/helperMethods.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key, required this.callID});

  final String callID;

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  String SEID = "";
  String SEName = "";

  @override
  void initState() {
    getPref().then((value) {
      if (mounted) {
        setState(() {
          SEID = value.getString(KEYENGUNIQUEID);
          SEName = value.getString(KEYUSERNAME);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: MyZegoConst.appId,
        // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: MyZegoConst.appSign,
        // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: SEID,
        userName: SEName,
        callID: widget.callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
      ),
    );
  }
}
