import 'package:cloverleaf_project/core/apiCall.dart';

class Get_SE_Payout_Data_controller{
  Get_SE_Payout_Data_controller_method()async{
    var r = ApiCalling().SE_payout_list();
    print("SE_Payout_list---------------------> $r");
    return r;
  }
}