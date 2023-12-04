import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/core/apiCall.dart';
import '../utils/helperWidget.dart';

class send_otp_to_complete_wo_controller{
  send_otp_to_complete_wo_controller_method(work_id)async{
    var r = await ApiCalling().send_otp_to_complete_wo(work_id, completed_button_type);
    if(r['status'].toString() == 'true'){
      customFlutterToast(r['message'].toString());
    }
  }
}