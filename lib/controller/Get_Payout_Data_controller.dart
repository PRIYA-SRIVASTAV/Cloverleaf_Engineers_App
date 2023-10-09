import 'package:cloverleaf_project/core/apiCall.dart';

class Get_Payout_Data_controller{
  Get_Payout_Data_controller_method()async{
    var r = ApiCalling().get_Payout_data();
    print("Payout Data---> $r");
    return r;
  }
}