import '../core/apiCall.dart';

class Get_SE_Dashboard_percentage_details_Controller{
  Get_SE_Dashboard_percentage_details_Controller_method()async{
    var r = await ApiCalling().get_SE_dashboard_data();
    print("SE DashBoard Data---> $r");
    return r;
  }
}