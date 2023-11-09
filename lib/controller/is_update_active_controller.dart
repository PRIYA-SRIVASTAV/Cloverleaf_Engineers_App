import 'dart:developer';
import 'package:cloverleaf_project/utils/helperWidget.dart';
import '../core/apiCall.dart';

class is_update_active_controller {
  is_update_ENG_active_controller_method(val) async {
    var r = await ApiCalling().is_Update_ENG_active(val==true?"1":"0");
    log("Eng active or not $r");
    if (r["status"].toString() == "true") {
      customFlutterToast(r['message'].toString());
    }
  }
  is_update_SE_active_controller_method(val) async {
    var r = await ApiCalling().is_Update_SE_active(val==true?"1":"0");
    log("SE active or not $r");
    if (r["status"].toString() == "true") {
      customFlutterToast(r['message'].toString());
    }
  }
}
