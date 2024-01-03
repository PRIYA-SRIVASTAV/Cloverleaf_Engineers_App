import 'dart:developer';
import 'package:flutter/material.dart';
import '../constant/stringsConstant.dart';
import '../core/apiCall.dart';
import '../screens/subjectExpertScreen/BottomNavigationPageSE.dart';
import '../utils/helperWidget.dart';

class SE_update_wo_status_Controller{
  SE_update_wo_status_accepted_Controller_method(work_id,context)async{
    var r = await ApiCalling().SE_update_wo_status(work_id,SE_Work_order_status2);
    log("SE_update_wo_status accepted $r");
    if (r['status'].toString()=="true") {
      customFlutterToast(r["message"].toString());
     // update_wo_status_Controller().update_wo_status_completed_Controller_method(work_id, context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>BottomNavigationPageSE(BottomIndex:1,SendTabIndex:1),
        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
  SE_update_wo_status_Rejected_Controller_method(work_id,context)async{
    var r = await ApiCalling().SE_update_wo_status(work_id,SE_Work_order_status4);
    log("SE_update_wo_status Rejected $r");
    if (r['status'].toString()=="true") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>BottomNavigationPageSE(BottomIndex:1,SendTabIndex:0),
        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
}