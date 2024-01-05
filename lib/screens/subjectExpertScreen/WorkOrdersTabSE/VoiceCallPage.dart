import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../utils/helperMethods.dart';

class VoiceCallPage extends StatefulWidget {
  const VoiceCallPage({super.key, required this.callID});
  final String callID;
  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
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
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
      ),
    );
  }
}
