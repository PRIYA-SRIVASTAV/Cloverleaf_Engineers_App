import '../core/apiCall.dart';

class Get_User_status_controller{
  Get_User_status_controller_method()async{
    var r = await ApiCalling().get_User_status();
    print("User Status $r");
    return r;
  }
}