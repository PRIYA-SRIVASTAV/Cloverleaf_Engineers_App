import 'package:cloverleaf_project/controller/get_SE_Call_logs_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../model/GetSECallLogsModel.dart';
import '../DrawerSE/DrawerSE.dart';

class CallLogsTab extends StatefulWidget {
  const CallLogsTab({super.key});

  @override
  State<CallLogsTab> createState() => _CallLogsTabState();
}

class _CallLogsTabState extends State<CallLogsTab> {
  late GetSeCallLogsList get_call_log_list;
  bool is_load_call_logs_list = false;

  @override
  void initState() {
    get_call_log_list_method();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Call History",
          style: dashboardStyle,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Icon to represent the drawer
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
        backgroundColor: appThemeColor,
      ),
      drawer: const AppDrawerSE(),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: is_load_call_logs_list
              ? ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    Text(
                      "Today",
                      style: GoogleFonts.lato(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: get_call_log_list.data!.today!.length,
                      itemBuilder: (context, index) {
                        //final callLog = callLogs[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              get_call_log_list.data!.today![index].engName
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Work Order Id - #${get_call_log_list.data!.today![index].workorderId.toString()}",
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      get_call_log_list.data!.today![index].date
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      get_call_log_list.data!.today![index].time
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  get_call_log_list.data!.today![index].duration
                                              .toString() ==
                                          "null"
                                      ? ""
                                      : get_call_log_list
                                          .data!.today![index].duration
                                          .toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            trailing: Today_Call_Icon_Trailing_Widget(
                                get_call_log_list.data!.today![index].callStatus
                                    .toString(),
                                get_call_log_list.data!.today![index].callType
                                    .toString()),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Yesterday",
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: get_call_log_list.data!.yesterday!.length,
                      itemBuilder: (context, index) {
                        //final callLog = callLogs[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              get_call_log_list.data!.yesterday![index].engName
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Work Order Id - #${get_call_log_list.data!.yesterday![index].workorderId.toString()}",
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      get_call_log_list
                                          .data!.yesterday![index].date
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      get_call_log_list
                                          .data!.yesterday![index].time
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  get_call_log_list
                                              .data!.yesterday![index].duration
                                              .toString() ==
                                          "null"
                                      ? ""
                                      : get_call_log_list
                                          .data!.yesterday![index].duration
                                          .toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            trailing: Yesterday_Call_Icon_Trailing_Widget(
                                get_call_log_list
                                    .data!.yesterday![index].callStatus
                                    .toString(), get_call_log_list
                                .data!.yesterday![index].callType
                                .toString()),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Older",
                      style: GoogleFonts.lato(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        //final callLog = callLogs[index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              "Riya"
                                  .toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Work Order Id - #11",
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2-10-2023",
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      "1:20:34",
                                      style: GoogleFonts.lato(
                                          fontSize: 10.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  "8m",
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            trailing: Icon(Icons.call_missed),
                            /* Older_Call_Icon_Trailing_Widget(
                              get_call_log_list.data!.older![index].callStatus
                                  .toString(),
                              get_call_log_list.data!.older![index].callType
                                  .toString(),
                            ),*/
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget Today_Call_Icon_Trailing_Widget(String callStatus, String callType) {
    if (callStatus == "1") {
      if (callType == "1") {
        return Icon(
          Icons.phone_missed,
          color: Colors.red,
        );
      } else {
        return Icon(
          Icons.missed_video_call_outlined,
          color: Colors.red,
        );
      }
    } else if (callStatus == "2") {
      if (callType == "1") {
        return Row(
          children: [
            Icon(
              Icons.phone_missed,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      } else {
        return Row(
          children: [
            Icon(
              Icons.missed_video_call,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      }
    } else {
      if (callType == "1") {
        return Icon(
          Icons.call,
          color: appThemeColor,
        );
      } else {
        return Icon(
          Icons.video_call_outlined,
          color: appThemeColor,
        );
      }
    }
  }

  Widget Yesterday_Call_Icon_Trailing_Widget(String callStatus, String callType) {
    if (callStatus == "1") {
      if (callType == "1") {
        return Icon(
          Icons.phone_missed,
          color: Colors.red,
        );
      } else {
        return Icon(
          Icons.missed_video_call_outlined,
          color: Colors.red,
        );
      }
    } else if (callStatus == "2") {
      if (callType == "1") {
        return Row(
          children: [
            Icon(
              Icons.phone_missed,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      } else {
        return Row(
          children: [
            Icon(
              Icons.missed_video_call,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      }
    } else {
      if (callType == "1") {
        return Icon(
          Icons.call,
          color: appThemeColor,
        );
      } else {
        return Icon(
          Icons.video_call_outlined,
          color: appThemeColor,
        );
      }
    }
  }

  Widget Older_Call_Icon_Trailing_Widget(String callStatus, String callType) {
    if (callStatus == "1") {
      if (callType == "1") {
        return Icon(
          Icons.phone_missed,
          color: Colors.red,
        );
      } else {
        return Icon(
          Icons.missed_video_call_outlined,
          color: Colors.red,
        );
      }
    } else if (callStatus == "2") {
      if (callType == "1") {
        return Row(
          children: [
            Icon(
              Icons.phone_missed,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      } else {
        return Row(
          children: [
            Icon(
              Icons.missed_video_call,
              color: Colors.grey,
            ),
            Text("Rejected"),
          ],
        );
      }
    } else {
      if (callType == "1") {
        return Icon(
          Icons.call,
          color: appThemeColor,
        );
      } else {
        return Icon(
          Icons.video_call_outlined,
          color: appThemeColor,
        );
      }
    }
  }

  void get_call_log_list_method() async {
    get_call_log_list = await get_SE_Call_logs_list_controller()
        .get_SE_Call_logs_list_controller_method();
    if (mounted) {
      setState(() {
        is_load_call_logs_list = true;
      });
    }
  }
}
