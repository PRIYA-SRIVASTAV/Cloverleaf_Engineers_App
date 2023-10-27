import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../WorkOrdersTabSE/VideoCallPage.dart';

class SEdashboardPage extends StatefulWidget {
  const SEdashboardPage({super.key});

  @override
  State<SEdashboardPage> createState() => _SEdashboardPageState();
}

class _SEdashboardPageState extends State<SEdashboardPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  Widget CallNowViaVideoAudio(context) {
    return Dialog(
      child: Container(
        height: 20.h,
        child: Stack(
          // alignment: Alignment.topRight,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => VideoCallPage(callID: "1")
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.video_call,
                            size: 34.sp,
                            color: appThemeColor,
                          ),
                          Text("Video call")
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.call,
                            size: 34.sp,
                            color: appThemeColor,
                          ),
                          Text("Voice call")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 2,
              top: 2,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    key: Key('closeIconKey'),
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ScheduleCall(context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return Dialog(
          child: Container(
            height: 40.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      children: [
                        Text(
                          "Schedule Call",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: appThemeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            hintText: 'YYYY-MM-DD',
                            hintStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.grey),
                            suffixIcon: InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100),
                                  helpText: "CHOOSE SCHEDULE DATE",
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: appThemeColor,
                                          onPrimary: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors
                                                .green, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                  DateFormat('yyyy-MM-dd')
                                      .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    dateController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                              child: Icon(
                                Icons.calendar_month,
                                color: appThemeColor,
                              ),
                            ),
                            //border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          controller: timeController,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                _showTimePicker();
                              },
                              child: Icon(Icons.alarm, color: appThemeColor),
                            ),
                            hintText: "HH:MM",
                            hintStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          maxLength: 50,
                          //controller: country,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.edit_note_sharp,
                                color: appThemeColor),
                            hintText: "Comments",
                            hintStyle:
                            TextStyle(fontSize: 10.sp, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 35.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor:
                              MaterialStateProperty.all(appThemeColor),
                            ),
                            onPressed: () {},
                            child: Text("Save"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        key: Key('closeIconKey'),
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          dashboard,
          style: dashboardStyle,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: appThemeColor,
      ),
      //drawer: const AppDrawer(),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: 15,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 40.h,
                child: Card(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 3.h,
                          width: 10.h,
                          color: Colors.blue.withOpacity(0.3),
                          child: Center(
                            child: Text(
                              "#Work-id",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                //color: Colors.red,
                                height: 27.h,
                                width: 40.w,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Asset Name",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "***",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Subject",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "***",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Description",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "***",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Engineer name",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "***",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.grey,
                              height: 20.h,
                              width: 30.w,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "***",
                                        style: TextStyle(
                                            fontSize: 12.sp, color: Colors.red),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Priority",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "***",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.orange),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Category",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "***",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 35.w,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CallNowViaVideoAudio(context);
                                    },
                                  );
                                  // var Work_id;
                                  // await getPref().then((value) {
                                  //   value.setString(
                                  //       KEYWORKID,
                                  //       get_work_order_status1
                                  //           .data[index].workId
                                  //           .toString());
                                  // });
                                  // await getPref().then((value) {
                                  //   Work_id = value
                                  //       .getString(KEYWORKID);
                                  // });
                                  // print(
                                  //     "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                  // update_wo_status_Controller()
                                  //     .update_wo_status_accepted_Controller_method(
                                  //     Work_id, context);
                                  // get_work_order_status1_method();
                                },
                                child: Text(
                                  "Call Now",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 35.w,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                                ),
                                onPressed: () async {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ScheduleCall(context);
                                    },
                                  );
                                  // var Work_id;
                                  // await getPref().then((value) {
                                  //   value.setString(
                                  //       KEYWORKID,
                                  //       get_work_order_status1
                                  //           .data[index].workId
                                  //           .toString());
                                  // });
                                  // await getPref().then((value) {
                                  //   Work_id = value
                                  //       .getString(KEYWORKID);
                                  // });
                                  // debugPrint(
                                  //     "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                  // await update_wo_status_Controller()
                                  //     .update_wo_status_rejected_Controller_method(
                                  //     Work_id, context);
                                  // get_work_order_status1_method();
                                },
                                child: Text(
                                  "Schedule Now",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
