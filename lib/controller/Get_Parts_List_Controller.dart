import '../core/apiCall.dart';

class Get_Parts_List_Controller{
  Get_Parts_List_Controller_method()async{
    var r = await ApiCalling().get_Parts_list();
    print("PARTS LIST $r");
    return r;
  }
}