import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../DrawerSE/DrawerSE.dart';
class CallLogsTab extends StatefulWidget {
  const CallLogsTab({super.key});

  @override
  State<CallLogsTab> createState() => _CallLogsTabState();
}

class _CallLogsTabState extends State<CallLogsTab> {
  List<CallLog> callLogs = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 4.w),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Text("Today"),
              SizedBox(height: 2.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  //final callLog = callLogs[index];
                  return Card(
                    child: ListTile(
                      title: Text("Priya Srivastav"),
                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("01 Nov 2023"),
                              SizedBox(width: 1.w,),
                              Text("1:08:23"),
                            ],
                          ),
                          Text("2m 22s")
                        ],
                      ),
                      trailing: Icon(
                        Icons.call
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h,),
              Text("Yesterday"),
              SizedBox(height: 2.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  //final callLog = callLogs[index];
                  return Card(
                    child: ListTile(
                      title: Text("Priya Srivastav"),
                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("01 Nov 2023"),
                              SizedBox(width: 1.w,),
                              Text("1:08:23"),
                            ],
                          ),
                          Text("2m 22s")
                        ],
                      ),
                      trailing: Icon(
                          Icons.video_call
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 2.h,),
              Text("Older"),
              SizedBox(height: 2.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  //final callLog = callLogs[index];
                  return Card(
                    child: ListTile(
                      title: Text("Priya Srivastav"),
                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("01 Nov 2023"),
                              SizedBox(width: 1.w,),
                              Text("1:08:23"),
                            ],
                          ),
                          Text("2m 22s")
                        ],
                      ),
                      trailing: Icon(
                          Icons.video_call
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CallLog {
  String callerName;
  String phoneNumber;
  DateTime callDateTime;
  Duration callDuration;

  CallLog({
    required this.callerName,
    required this.phoneNumber,
    required this.callDateTime,
    required this.callDuration,
  });
}

