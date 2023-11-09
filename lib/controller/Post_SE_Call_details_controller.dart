import 'package:cloverleaf_project/core/apiCall.dart';

class Post_SE_Call_details_controller {
  Post_SE_Call_Start_details_controller_method(subj_expert_id,eng_id,workorder_id,call_type)async{
    var r = await ApiCalling().Post_SE_Call_start(subj_expert_id, eng_id,workorder_id, call_type);
    if(r['status'].toString()=='true'){
      print("=============> Call logs inserted");
    }
  }
  Post_SE_Call_End_details_controller_method(subj_expert_id,eng_id,call_duration)async{
    var r = await ApiCalling().Post_SE_Call_End(subj_expert_id, eng_id, call_duration);
    if(r['status'].toString()=='true'){
      print("=============> Call logs inserted");
    }
  }
  
}