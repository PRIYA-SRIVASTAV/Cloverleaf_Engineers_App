var baseUrl = "https://clickcloud.in/cloverleaf123/public/api";
class ApiEndpoints {
  //Api's for Engineer
  /// post apis
  static String Login_url = "$baseUrl/login";
  static String Update_profile_url = "$baseUrl/update-engineer-profile";
  static String Upadate_is_active_url = "$baseUrl/update-is-active";
  static String Eng_update_wo_status_url = "$baseUrl/update-wo-status";
  static String raise_leave_url = "$baseUrl/post-calender";
  static String post_location_url = "$baseUrl/update-location";
  static String post_work_parts_url = "$baseUrl/post-work-parts";
  static String post_work_reason_url = "$baseUrl/update-wo-status";
  static String post_FCM_Token = "$baseUrl/send-fcm";

  /// get apis
  static String Work_order_List_Url = "$baseUrl/work-list?wo_status=";
  static String Profile_detail_Url = "$baseUrl/engineer-profile-data";
  static String get_parts_Url = "$baseUrl/parts";
  static String get_user_status_Url = "$baseUrl/get-user-status";
  static String get_leave_calender_Url = "$baseUrl/get-calender";
  static String get_dashboard_data_Url = "$baseUrl/get-user-pie-detail";
  static String get_payout_by_month_Url = "$baseUrl/get-payout-by-month";
  static String get_payout_by_month2_Url = "$baseUrl/get-payout-list?";
  static String get_payout_by_month3_Url = "$baseUrl/get-payout-detail?payout_id=";
  static String get_Add_Parts_list_Url = "$baseUrl/get-parts/";

//============================== Api's for Subject Expert =============================================================

/// post apis
  static String SE_update_wo_status_url = "$baseUrl/update-se-status";
  static String SE_Update_profile_url = "$baseUrl/update-engineer-profile";
  static String SE_post_call_start = "$baseUrl/call-start";
  static String SE_post_call_end = "$baseUrl/call-end";

  /// get apis
  static String SE_Work_order_List_Url = "$baseUrl/sub-ex-work-list?wo_status=";
  static String SE_Profile_detail_Url = "$baseUrl/engineer-profile-data";
  static String SE_Dashboard_data_Url = "$baseUrl/subject-expert-dashboard";
  static String SE_payout_list_Url = "$baseUrl/se-payout-list";
  static String SE_get_payout_detail_Url = "$baseUrl/get-payout-detail?payout_id=";
  static String get_SE_status_Url = "$baseUrl/get-user-status";
  static String get_SE_Call_logs_Url = "$baseUrl/call-log-list/";



}
