import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/cupertino.dart';

class get_technician_summary_controller{
  get_technician_summary_controller_method(Work_id)async{
    var r = await ApiCalling().get_technician_summary(Work_id);
    debugPrint("get-technician-summary ---------------------> $r");
    return r;
  }
}