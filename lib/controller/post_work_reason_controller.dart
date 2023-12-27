import 'package:flutter/material.dart';
import '../constant/stringsConstant.dart';
import '../core/apiCall.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../utils/helperWidget.dart';

class post_work_reason_controller {
  post_work_reason_controller_method(work_id, reason,escalate_img,escalate_file, context) async {
    var r = await ApiCalling().post_work_reason(work_id, reason,escalate_img,escalate_file,Work_order_status3);
    return r ;
  }
}
