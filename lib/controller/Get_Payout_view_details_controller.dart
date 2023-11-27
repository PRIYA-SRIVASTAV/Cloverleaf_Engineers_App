import '../core/apiCall.dart';

class get_payout_view_Details_controller{
  get_payout_view_Details_controller_method(month,year)async{
    var r = ApiCalling().eng_get_view_details_payout_list(month,year);
    print("eng_get_view_details_payout_list---------------------> $r");
    return r;
  }
}