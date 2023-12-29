import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/cupertino.dart';

class get_escalate_data_controller{
  get_escalate_data_controller_method(Work_id)async{
    var r = await ApiCalling().get_SE_escalate_data(Work_id);
    debugPrint("get_escalate_data ---------------------> $r");
    return r ;
  }
}