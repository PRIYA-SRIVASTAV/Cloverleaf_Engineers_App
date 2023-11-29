import 'dart:developer';
import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:flutter/material.dart';
import '../core/apiCall.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../utils/helperWidget.dart';

class update_wo_status_Controller{
  update_wo_status_accepted_Controller_method(work_id,context)async{
    var r = await ApiCalling().update_wo_status(work_id,Work_order_status2);
    log("update_wo_status accepted $r");
    if (r['status'].toString()=="true") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>BottomNavigationPage(BottomIndex:1,SendTabIndex:0),
        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
  update_wo_status_rejected_Controller_method(work_id,context)async{
    var r = await ApiCalling().update_wo_status(work_id,Work_order_status5);
    log("update_wo_status rejected $r");
    if (r['status'].toString()=="false") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>BottomNavigationPage(BottomIndex:1,SendTabIndex:0),

        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
  update_wo_status_completed_Controller_method(work_id,context)async{
    var r = await ApiCalling().update_wo_status(work_id,Work_order_status4);
    log("update_wo_status completed $r");
    if (r['status'].toString()=="true") {
      customFlutterToast(r["message"].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>BottomNavigationPage(BottomIndex:1,SendTabIndex:3),
        ),
      );
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
}