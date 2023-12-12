import '../core/apiCall.dart';

class Get_SE_get_transaction_list_controller{
  Get_SE_get_transaction_list_controller_method(Payout_id)async{
    var r = ApiCalling().SE_get_transaction_list(Payout_id);
    print("SE_get_view_details_payout_list---------------------> $r");
    return r;
  }
}