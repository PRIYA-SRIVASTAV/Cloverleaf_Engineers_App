import 'package:cloverleaf_project/core/apiCall.dart';

class Get_Dashboard_percentage_details_Controller{
  Get_Dashboard_percentage_details_Controller_method()async{
    var r = await ApiCalling().get_dashboard_data();
    print("DashBoard Data---> $r");
    return r;
  }
}