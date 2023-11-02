import 'package:cloverleaf_project/core/apiCall.dart';

class Get_Add_Parts_list_controller{
  Get_Add_Parts_list_controller_method(Work_id)async{
    var r = await ApiCalling().get_Add_Parts_list(Work_id);
    print("Add Parts list---> $r");
    return r;
  }
  Get_Add_SE_Parts_list_controller_method(Work_id)async{
    var r = await ApiCalling().get_Add_SE_Parts_list(Work_id);
    print("Add Parts list---> $r");
    return r;
  }
}