import 'dart:developer';
import 'package:cloverleaf_project/utils/helperWidget.dart';
import '../core/apiCall.dart';

class is_update_active_controller {
  is_update_active_controller_method(val) async {
    var r = await ApiCalling().is_Update_active(val==true?"1":"0");
    log("user active or not $r");
    if (r["status"].toString() == "true") {
      customFlutterToast(r['message'].toString());
    }
  }

}
