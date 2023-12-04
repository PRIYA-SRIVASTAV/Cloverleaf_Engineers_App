import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:cloverleaf_project/utils/helperWidget.dart';

class send_otp_to_start_wo_controller {
  send_otp_to_start_wo_controller_method(work_id) async {
    var r = await ApiCalling().send_otp_to_start_wo(work_id, start_button_type);
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
    }
  }
}
