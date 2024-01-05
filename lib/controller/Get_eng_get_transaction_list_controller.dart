import '../core/apiCall.dart';

class Get_eng_get_transaction_list_controller{
  Get_eng_get_transaction_list_controller_method(Payout_id)async{
    var r = ApiCalling().eng_get_transaction_list(Payout_id);
    print("eng_get_view_details_payout_list---------------------> $r");
    return r;
  }
}