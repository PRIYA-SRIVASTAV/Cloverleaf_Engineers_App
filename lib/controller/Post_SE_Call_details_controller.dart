import 'package:cloverleaf_project/core/apiCall.dart';

import '../constant/prefsConstant.dart';
import '../utils/helperMethods.dart';

class Post_SE_Call_details_controller {
  Post_SE_Call_Start_details_controller_method(
      subj_expert_id, eng_id, workorder_id, call_type) async {
    var pref = await getPref();
    var type;
    if (pref.getString(KEYENGTOKEN) != null) {
      type = "eng";
    } else {
      type = "se";
    };
    var r = await ApiCalling()
        .Post_SE_Call_start(subj_expert_id, eng_id, workorder_id, call_type,type);
    if (r['status'].toString() == 'true') {
      print("=============> Call logs inserted");
    }
  }

  Post_SE_Call_End_details_controller_method(
      subj_expert_id, eng_id, call_duration) async {
    var pref = await getPref();
    var type;
    if (pref.getString(KEYENGTOKEN) != null) {
      type = "eng";
    } else {
      type = "se";
    };
    var r = await ApiCalling().Post_SE_Call_End(subj_expert_id, eng_id, call_duration,type);
    if (r['status'].toString() == 'true') {
      print("=============> Call logs inserted at the call end");
    }
  }
}
