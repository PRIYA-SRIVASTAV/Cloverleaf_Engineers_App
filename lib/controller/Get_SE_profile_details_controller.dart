import '../core/apiCall.dart';

class Get_SE_profile_details_controller{
  get_profile_details_controller_method() async{
    var r = await ApiCalling().get_SE_Profile_Details();
    print("get SE profile details $r");
    return r;
  }
}