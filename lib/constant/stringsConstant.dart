/// WO_STATUS
// =========Engineer============
/// 2 => 'assign',//   assigned work order list by cluster
/// 3 => 'ongoing', // accept by engineer
/// 4 => 'accelerate',// by engineer
/// 7 => 'Completed', // completed by eng
/// 10 => 'Rejected' // rejected by engineer

// =========Subject expert=======
/// 5 => 'assign',// assigned work order list by cluster
/// 6 => 'ongoing',// accept by se
/// 8 => 'Rejected', // rejected by se


String skip = "Skip";
String dashboard = "Dashboard";
String workOrders = "Work Orders";
String Work_order_status1 ="2";
String Work_order_status2 ="3";
String Work_order_status3 ="4";
String Work_order_status4 ="7";
String Work_order_status5 ="10";
String SE_Work_order_status1 ="5";
String SE_Work_order_status2 ="6";
String SE_Work_order_status3 ="7";
String SE_Work_order_status4 ="8";
String User_is_active = "1";
String User_not_active  ="0";
String User_is_on_leave = "1";
String type = "mobile";

/// On boarding page content
//on Boarding first page.
String title1 = "Is machine breakdown situation \n    keeping you awake at night?";
String title2 = "India's first digital machine \n      servicing platform.";

//on Boarding Second page.
String title3 = "   Do you find it difficult to get\nengineers when your machine \n                   is down?";
String title4 = "Use our App and get instant \nsupport of skillful engineers,\n          online and onsite.";

//on Boarding Third page.
String title5 = "Is it challenging to get the right \n   spares at reasonable cost?";
String title6 = "Use our digital Market Place \nfor prompt supply of quality \n                      parts.";

//on Boarding Fourth page.
String title7 ="     Does it take too long to \ndiagnose the root cause of the \n                   problem?";
String title8 = "Take help of our Digital tool \nand expert panel for timely \n                resolution.";

class MyZegoConst{
  static const int appId = 1382134047;
  static const String appSign = "c0c0758fa12bcc6354425a65706a5651cf27b8cfc9ec35b4731f50e9fe85cb08";
  static String callDuration = "";
  static String callType = "";
  static String callWorkId = "";
  static String SE_Zego_id ="";
  static String ENg_Zego_id ="";
  static bool call_start_times = false;
}