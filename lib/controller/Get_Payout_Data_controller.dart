import 'package:cloverleaf_project/core/apiCall.dart';

class Get_Eng_Payout_Data_controller{
  Get_Payout_Data_controller_method()async{
    var r = ApiCalling().eng_get_payout_by_month_list();
    print("eng_get_payout_by_month_list---------------------> $r");
    return r;
  }
}