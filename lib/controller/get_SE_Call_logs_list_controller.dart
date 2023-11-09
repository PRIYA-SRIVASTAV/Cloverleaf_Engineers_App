import 'package:cloverleaf_project/core/apiCall.dart';

import '../constant/prefsConstant.dart';

class get_SE_Call_logs_list_controller{
  get_SE_Call_logs_list_controller_method()async{
    var r = ApiCalling().get_SE_Call_logs_list(currentUser.id.toString());
    print("Get Call logs for SE---> $r");
    return r;
  }
}