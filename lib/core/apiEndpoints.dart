var baseUrl = "https://clickcloud.in/cloverleaf/public/api";
class ApiEndpoints {
  /// post apis
  static String Login_url = "$baseUrl/login";
  static String Update_profile_url = "$baseUrl/user-update";
  static String Upadate_is_active_url = "$baseUrl/update-is-active";
  static String update_wo_status_url = "$baseUrl/update-wo-status";
  static String raise_leave_url = "$baseUrl/post-calender";
  static String post_location_url = "$baseUrl/update-location";
  static String post_work_parts_url = "$baseUrl/post-work-parts";
  static String post_work_reason_url = "$baseUrl/post-work-reason";
  static String post_FCM_Token = "$baseUrl/send-fcm";

  /// get apis
  static String Work_order_List_Url = "$baseUrl/work-list?wo_status=";
  static String Profile_detail_Url = "$baseUrl/user-details/";
  static String get_parts_Url = "$baseUrl/parts";
  static String get_user_status_Url = "$baseUrl/get-user-status";
  static String get_leave_calender_Url = "$baseUrl/get-calender";
  static String get_dashboard_data_Url = "$baseUrl/get-user-pie-detail";
  static String get_payout_data_Url = "$baseUrl/get-payout";
  static String get_Add_Parts_list_Url = "$baseUrl/get-parts/";
}
