import 'package:cloverleaf_project/core/apiCall.dart';

class Get_SE_Work_Order_List_Controller{
  SE_work_order_list_unaccepted_controller_method(SE_Work_Order_status1)async{
    var r = await ApiCalling().get_SE_Work_order_list_for_unaccepted(SE_Work_Order_status1);
    print("SE_unaccepted_work_order ====> $r");
    return r;
  }
  SE_work_order_list_pending_controller_method(SE_Work_Order_status2)async{
    var r = await ApiCalling().get_SE_Work_order_list_for_Pending(SE_Work_Order_status2);
    print("SE_pending_Work_order ====> $r");
    return r;
  }
  SE_work_order_list_Rejected_controller_method(SE_Work_Order_status3)async{
    var r = await ApiCalling().get_SE_Work_order_list_for_Rejected(SE_Work_Order_status3);
    print("SE_accelerated_Work_order ====> $r");
    return r;
  }
  SE_work_order_list_completed_controller_method(SE_Work_Order_status4)async{
    var r = await ApiCalling().get_SE_Work_order_list_for_Completed(SE_Work_Order_status4);
    print("SE_completed_work_order ====> $r");
    return r;
  }
}