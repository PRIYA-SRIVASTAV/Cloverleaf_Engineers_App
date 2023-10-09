import 'package:cloverleaf_project/core/apiCall.dart';

class Get_Leave_calendar_controller{
  Get_Leave_calendar_controller_method()async{
    var r = ApiCalling().get_leave_calender();
    print("Get Leave Calender Data=========== $r");
    return r;
  }
}