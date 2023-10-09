import '../core/apiCall.dart';

class get_profile_details_controller{
  get_profile_details_controller_method() async{
    var r = await ApiCalling().get_Profile_Details();
    print("get profile details $r");
    return r;
  }
}