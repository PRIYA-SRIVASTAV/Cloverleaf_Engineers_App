import 'package:cloverleaf_project/core/apiCall.dart';
import '../constant/prefsConstant.dart';
import '../utils/helperMethods.dart';

class get_SE_Call_logs_list_controller{
  get_SE_Call_logs_list_controller_method()async{
    var SE_unique_id;
    await getPref().then((value) {
      SE_unique_id = value.getString(KEYSEUNIQUEID);
    });
    var r = ApiCalling().get_SE_Call_logs_list(SE_unique_id);
    print("Get Call logs for SE---> $r");
    return r;
  }
}