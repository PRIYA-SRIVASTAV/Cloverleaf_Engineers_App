import '../constant/prefsConstant.dart';
import '../core/apiCall.dart';
import '../utils/helperMethods.dart';

class get_Eng_Call_logs_list_controller{
  get_Eng_Call_logs_list_controller_method()async{
    var Eng_unique_id;
    await getPref().then((value) {
      Eng_unique_id = value.getString(KEYENGUNIQUEID);
    });
    var r = ApiCalling().get_Eng_Call_logs_list(Eng_unique_id);
    print("Get Call logs for SE---> $r");
    return r;
  }
}