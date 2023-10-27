import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
  String EngID = "";
  String EngName = "";

  @override
  void initState() {
    getPref().then((value) {
      if (mounted) {
        setState(() {
          EngID = value.getString(KEYENGID);
          EngName = value.getString(KEYENGNAME);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 90.w,
      child: ZegoUIKitPrebuiltCall(
        appID: MyZegoConst.appId,
        // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: MyZegoConst.appSign,
        // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: EngID,
        userName: EngName,
        callID: widget.callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
      ),
    );
  }
}
