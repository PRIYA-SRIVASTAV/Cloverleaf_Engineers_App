import '../core/apiCall.dart';

class Get_Parts_List_Controller{
  Get_Parts_List_Controller_method(work_id)async{
    var r = await ApiCalling().get_Parts_list(work_id);
    print("Eng PARTS LIST $r");
    return r;
  }
}