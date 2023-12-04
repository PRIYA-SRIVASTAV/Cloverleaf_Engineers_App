import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/controller/update_wo_status_Controller.dart';
import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/material.dart';

import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../utils/helperWidget.dart';

class verify_otp_to_start_wo_controller{
  verify_otp_to_start_wo_controller_method(work_id,otp,context)async{
    if (otp.toString().isEmpty) {
      customFlutterToast("OTP can't be empty");
    } else if (otp.toString().length != 5) {
      customFlutterToast("Enter 5 digit OTP");
    } else {
      var r = await ApiCalling().verify_otp_to_start_wo(
          otp, work_id, start_button_type);
      if (r['status'].toString() == 'true') {
        customFlutterToast(r['message'].toString());
        update_wo_status_Controller().update_wo_status_Controller_method(work_id, context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomNavigationPage(
                  BottomIndex: 1,
                  SendTabIndex: 0,
                ),
          ),
        );
      }
      else{
        customFlutterToast(r['message'].toString());
      }
    }
  }
}