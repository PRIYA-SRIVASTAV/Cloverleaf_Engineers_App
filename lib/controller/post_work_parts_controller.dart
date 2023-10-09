import 'package:flutter/material.dart';

import '../core/apiCall.dart';
import '../utils/helperWidget.dart';

class post_work_parts_controller{
 Future post_work_parts_controller_method(work_id,parts_id,parts_name,context)async{
    var r = await ApiCalling().post_work_parts(work_id, parts_id, parts_name);
    if (r['status'].toString()=="true") {
      Navigator.pop(context);
      customFlutterToast(r["message"].toString());
    } else {
      customFlutterToast(r["message"].toString());
    }
  }
}