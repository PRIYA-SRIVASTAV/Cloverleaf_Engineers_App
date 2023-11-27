import 'package:flutter/material.dart';
import '../constant/stringsConstant.dart';
import '../core/apiCall.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../utils/helperWidget.dart';

class post_work_reason_controller {
  post_work_reason_controller_method(work_id, reason, context) async {
    var r = await ApiCalling().post_work_reason(work_id, reason,Work_order_status3);
    print("Post work reason=======> $r");
    if (r['status'].toString() == "true") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BottomNavigationPage(BottomIndex: 1, SendTabIndex: 2),
        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
}
