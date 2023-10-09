import '../core/apiCall.dart';

class work_order_list_controller{
  work_order_list_unaccepted_controller_method(unaccepted_work_order)async{
    var r = await ApiCalling().get_Work_order_list_for_unaccepted(unaccepted_work_order);
    print("unaccepted_work_order $r");
    return r;
  }
  work_order_list_pending_controller_method(pending_work_order)async{
    var r = await ApiCalling().get_Work_order_list_for_pending(pending_work_order);
    print("pending_Work_order $r");
    return r;
  }
  work_order_list_accelerated_controller_method(accelerated_work_order)async{
    var r = await ApiCalling().get_Work_order_list_for_accelerated(accelerated_work_order);
    print("accelerated_Work_order $r");
    return r;
  }
  work_order_list_completed_controller_method(completed_work_order)async{
    var r = await ApiCalling().get_Work_order_list_for_completed(completed_work_order);
    print("completed_work_order $r");
    return r;
  }
}