import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/material.dart';
import '../utils/helperWidget.dart';

class Raise_Leave_Request_controller{
  Raise_Leave_Request_with_on_leave_controller_method(is_on_leave , notes ,date, context)async{
    var r = await ApiCalling().Raise_leave_request(is_on_leave==true?"1":"0",notes,date);
    print("leave request with on leave---------------$r");
    if (r["status"].toString() == "true") {
      customFlutterToast(r['message'].toString());
      Navigator.pop(context);
    }
  }
}