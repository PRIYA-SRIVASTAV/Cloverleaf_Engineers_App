import 'package:cloverleaf_project/core/apiCall.dart';

class get_Work_order_details_controller{
  get_Work_order_details_controller_method(Work_id)async{
    var r = await ApiCalling().get_Work_order_details(Work_id);
    print("Work_order_description Page");
    return r;
  }
}