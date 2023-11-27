import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:cloverleaf_project/utils/helperWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_Leave_calendar_controller.dart';
import '../../../controller/Raise_Leave_Request_controller.dart';
import '../../../model/GetLeaveCalenderModel.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List<Datum>> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  final noteController = TextEditingController();
  var sendDate;
  bool on_leave_status = false;

  late GetLeaveCalendarModel get_Leave_calendar_data;

  bool is_load_Leave_calendar_data = false;

  @override
  void dispose() {
    super.dispose();
    noteController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    get_Leave_calendar_data_method();
  }

  loadPreviousEvents() {
    mySelectedEvents = get_Leave_calendar_data.data!;
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appThemeColor,
        centerTitle: true,
        title: Text(
          'Apply Leave',
          style: dashboardStyle,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: appThemeColor,
      body: is_load_Leave_calendar_data
          ? SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Container(
                  height: 90.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TableCalendar(
                                  focusedDay: _focusedDay,

                                  /// for selecting Dates
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDate, selectedDay)) {
                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDate = selectedDay;
                                        _focusedDay = focusedDay;
                                      });
                                    } else {}
                                  },
                                  selectedDayPredicate: (day) {
                                    return isSameDay(_selectedDate, day);
                                  },
                                  onPageChanged: (focusedDay) {
                                    // No need to call `setState()` here
                                    _focusedDay = focusedDay;
                                  },
                                  calendarStyle: CalendarStyle(
                                      // Weekend dates color (Sat & Sun Column)
                                      weekendTextStyle: const TextStyle(
                                        color: Colors.pinkAccent,
                                      ),
                                      // highlighted color for today
                                      todayDecoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      // highlighted color for selected day
                                      selectedDecoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      selectedTextStyle:
                                          const TextStyle(color: Colors.black)),
                                  calendarFormat: CalendarFormat.month,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  // height between the day row and 1st date row, default is 16.0
                                  daysOfWeekHeight: 50.0,
                                  // height between the date rows, default is 52.0
                                  rowHeight: 60.0,
                                  firstDay: DateTime.utc(2020, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  weekendDays: const [
                                    DateTime.saturday,
                                    DateTime.sunday
                                  ],
                                  daysOfWeekStyle: const DaysOfWeekStyle(
                                    weekendStyle:
                                        TextStyle(color: Colors.pinkAccent),
                                  ),
                                  // Calendar Header Styling
                                  headerStyle: HeaderStyle(
                                    headerPadding: EdgeInsets.zero,
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    titleTextStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Colors.blue,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.black,
                                      size: 6.w,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: 6.w,
                                    ),
                                  ),
                                  eventLoader: _listOfDayEvents,
                                  calendarBuilders: CalendarBuilders(
                                    markerBuilder:
                                        (BuildContext context, date, events) {
                                      if (events.isEmpty) return const SizedBox();
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: events.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(top: 6.h),
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                              height: 1.5.w,
                                              width: 1.5.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      appThemeColor /*dotColor(index, events)*/),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  // /// for sat sunday holidays
                                  // holidayPredicate: (day) {
                                  //   return day.weekday >= 6;
                                  // },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (_selectedDate != null) ...[
                        ..._listOfDayEvents(_selectedDate!).map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                         Text(
                                          "Date",
                                            style:  GoogleFonts.lato(
                                                color: Colors.blue.shade900,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          _selectedDate.toString().substring(0, 10),
                                          style: GoogleFonts.rubik(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'status',
                                          style:  GoogleFonts.lato(
                                              color: Colors.blue.shade900,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        customLeaveStatusWidget(e.leaveStatus.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Container(
                  height: 90.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                TableCalendar(
                                  focusedDay: _focusedDay,
                                  /// for selecting Dates
                                  onDaySelected: (selectedDay, focusedDay) {
                                    if (!isSameDay(_selectedDate, selectedDay)) {
                                      // Call `setState()` when updating the selected day
                                      setState(() {
                                        _selectedDate = selectedDay;
                                        _focusedDay = focusedDay;
                                      });
                                    } else {}
                                  },
                                  selectedDayPredicate: (day) {
                                    return isSameDay(_selectedDate, day);
                                  },
                                  onPageChanged: (focusedDay) {
                                    // No need to call `setState()` here
                                    _focusedDay = focusedDay;
                                  },
                                  calendarStyle: CalendarStyle(
                                      // Weekend dates color (Sat & Sun Column)
                                      weekendTextStyle: const TextStyle(
                                        color: Colors.pinkAccent,
                                      ),
                                      // highlighted color for today
                                      todayDecoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      // highlighted color for selected day
                                      selectedDecoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      selectedTextStyle:
                                          const TextStyle(color: Colors.black)),
                                  calendarFormat: CalendarFormat.month,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  // height between the day row and 1st date row, default is 16.0
                                  daysOfWeekHeight: 50.0,
                                  // height between the date rows, default is 52.0
                                  rowHeight: 60.0,
                                  firstDay: DateTime.utc(2020, 10, 16),
                                  lastDay: DateTime.utc(2030, 3, 14),
                                  weekendDays: const [
                                    DateTime.saturday,
                                    DateTime.sunday
                                  ],
                                  daysOfWeekStyle: const DaysOfWeekStyle(
                                    weekendStyle:
                                        TextStyle(color: Colors.pinkAccent),
                                  ),
                                  // Calendar Header Styling
                                  headerStyle: HeaderStyle(
                                    headerPadding: EdgeInsets.zero,
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    titleTextStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Colors.blue,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.black,
                                      size: 6.w,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.black,
                                      size: 6.w,
                                    ),
                                  ),
                                  // eventLoader: _listOfDayEvents,
                                  calendarBuilders: CalendarBuilders(
                                    markerBuilder:
                                        (BuildContext context, date, events) {
                                      if (events.isEmpty) return const SizedBox();
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: events.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(top: 6.h),
                                            padding: const EdgeInsets.all(2),
                                            child: Container(
                                              height: 1.5.w,
                                              width: 1.5.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      appThemeColor /*dotColor(index, events)*/),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  // /// for sat sunday holidays
                                  // holidayPredicate: (day) {
                                  //   return day.weekday >= 6;
                                  // },
                                ),
                                // SizedBox(
                                //   height: 1.h,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //   children: [
                                //     Column(
                                //       children: [
                                //         Container(
                                //           height: 1.5.w,
                                //           width: 1.5.w,
                                //           decoration: const BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               color: Colors.green),
                                //         ),
                                //         SizedBox(
                                //           height: 0.5.h,
                                //         ),
                                //         const Text(
                                //           "Present",
                                //           style: TextStyle(
                                //               color: Colors.grey,
                                //               fontSize: 12,
                                //               fontWeight: FontWeight.bold),
                                //         )
                                //       ],
                                //     ),
                                //     Column(
                                //       children: [
                                //         Container(
                                //           height: 1.5.w,
                                //           width: 1.5.w,
                                //           decoration: const BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               color: Colors.red),
                                //         ),
                                //         SizedBox(
                                //           height: 0.5.h,
                                //         ),
                                //         const Text(
                                //           "Absent",
                                //           style: TextStyle(
                                //               color: Colors.grey,
                                //               fontSize: 12,
                                //               fontWeight: FontWeight.bold),
                                //         )
                                //       ],
                                //     ),
                                //     Column(
                                //       children: [
                                //         Container(
                                //           height: 1.5.w,
                                //           width: 1.5.w,
                                //           decoration: const BoxDecoration(
                                //               shape: BoxShape.circle,
                                //               color: Colors.orangeAccent),
                                //         ),
                                //         SizedBox(
                                //           height: 0.5.h,
                                //         ),
                                //         const Text(
                                //           "Leave",
                                //           style: TextStyle(
                                //               color: Colors.grey,
                                //               fontSize: 12,
                                //               fontWeight: FontWeight.bold),
                                //         )
                                //       ],
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // if (_selectedDate != null) ...[
                      //   ..._listOfDayEvents(_selectedDate!).map(
                      //         (e) => Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 2.w),
                      //       child: Card(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(5)),
                      //         elevation: 1,
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 children: [
                      //                   const Text(
                      //                     "Date",
                      //                     style: TextStyle(
                      //                         color: Colors.grey,
                      //                         fontSize: 12,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 1.h,
                      //                   ),
                      //                   Text(
                      //                     _selectedDate.toString().substring(0, 10),
                      //                     style: GoogleFonts.lato(
                      //                         color: Colors.red,
                      //                         fontSize: 12,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                 ],
                      //               ),
                      //               SizedBox(
                      //                 width: 20.w,
                      //               ),
                      //               Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.center,
                      //                 children: [
                      //                   Text(
                      //                     '${e.isOnleave.toString()}',
                      //                     style: const TextStyle(
                      //                         color: Colors.grey,
                      //                         fontSize: 12,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 1.h,
                      //                   ),
                      //                   Text(
                      //                     '${e.notes.toString()}',
                      //                     style: TextStyle(
                      //                         color
                      //                             : Colors.black,
                      //                         fontSize: 12,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ],
                    ],
                  ),
                ),
              ),
            ),
      // SingleChildScrollView(
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Card(
      //                 color: Colors.white54,
      //                 elevation: 2,
      //                 child: TableCalendar(
      //                   firstDay: DateTime.utc(2010, 10, 16),
      //                   lastDay: DateTime.utc(2030, 3, 14),
      //                   focusedDay: _focusedDay,
      //                   calendarStyle: CalendarStyle(
      //                       weekendTextStyle: GoogleFonts.rubik(
      //                           color: Colors.pink,
      //                           fontWeight: FontWeight.w600)),
      //                   headerStyle: HeaderStyle(
      //                       formatButtonTextStyle: GoogleFonts.lato(
      //                           fontWeight: FontWeight.w600, fontSize: 12.sp),
      //                       titleTextStyle: GoogleFonts.lato(
      //                           fontSize: 14.sp, fontWeight: FontWeight.w600)),
      //                   daysOfWeekStyle: DaysOfWeekStyle(
      //                       weekendStyle: GoogleFonts.rubik(
      //                           color: Colors.pink,
      //                           fontWeight: FontWeight.w600)),
      //                   startingDayOfWeek: StartingDayOfWeek.monday,
      //                   daysOfWeekHeight: 5.h,
      //                   rowHeight: 5.h,
      //                   // holidayPredicate: (day) {
      //                   //   // Every 20th day of the month will be treated as a holiday
      //                   //   return day.weekday >= 6;
      //                   // },
      //                   calendarFormat: _calendarFormat,
      //                   onDaySelected: (selectedDay, focusedDay) {
      //                     if (!isSameDay(_selectedDate, selectedDay)) {
      //                       // Call `setState()` when updating the selected day
      //                       setState(() {
      //                         _selectedDate = selectedDay;
      //                         _focusedDay = focusedDay;
      //                       });
      //                       sendDate = _selectedDate;
      //                       print(sendDate);
      //                     } else {
      //                       sendDate = _selectedDate;
      //                       print(sendDate);
      //                     }
      //                   },
      //                   selectedDayPredicate: (day) {
      //                     return isSameDay(_selectedDate, day);
      //                   },
      //                   onFormatChanged: (format) {
      //                     if (_calendarFormat != format) {
      //                       // Call `setState()` when updating calendar format
      //                       setState(() {
      //                         _calendarFormat = format;
      //                       });
      //                     }
      //                   },
      //                   onPageChanged: (focusedDay) {
      //                     // No need to call `setState()` here
      //                     _focusedDay = focusedDay;
      //                   },
      //                   //eventLoader: _listOfDayEvents,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade900,
        onPressed: () => _showAddLeaveDailog(),
        //_showAddEventDialog(),
        label: Text(
          'Apply Leave',
          style: GoogleFonts.lato(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget customLeaveStatusWidget(leaveStatus) {
    if (leaveStatus == "1") {
      return Text("Pending",
        style:  GoogleFonts.lato(
            color: Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.bold),);
    } else if (leaveStatus == "2") {
      return Text("Approved",
        style:  GoogleFonts.lato(
          color: appThemeColor,
          fontSize: 12,
          fontWeight: FontWeight.bold),);
    } else {
      return Text("Rejected",
        style:  GoogleFonts.lato(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold),);
    }
  }

  Widget Yesterday_Call_Icon_Trailing_Widget(
      String callStatus, String callType) {
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

  Color dotColor(int index, events) {
    if (events[index]["type"] == "Attendance") {
      if (events[index]["notes"] == "Present") {
        return Colors.green;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.orange;
    }
  }

  _showAddLeaveDailog() async {
    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            title: Text(
              'Leave Request',
              style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: appThemeColor),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 15.h,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date : ${_selectedDate.toString() == "null" ? "" : _selectedDate.toString().substring(0, 10)}',
                  ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "On leave/On work",
                  //       style: GoogleFonts.lato(
                  //           fontSize: 12.sp, fontWeight: FontWeight.w600),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(right: 15),
                  //       child: FlutterSwitch(
                  //         width: 18.w,
                  //         height: 3.2.h,
                  //         valueFontSize: 14,
                  //         toggleSize: 20,
                  //         value: on_leave_status,
                  //         activeColor: Colors.green,
                  //         activeTextColor: Colors.white,
                  //         activeTextFontWeight: FontWeight.w400,
                  //         activeText: "leave",
                  //         inactiveText: "work",
                  //         inactiveColor: Colors.orange,
                  //         inactiveTextColor: Colors.white,
                  //         inactiveTextFontWeight: FontWeight.w400,
                  //         borderRadius: 30,
                  //         padding: 4,
                  //         showOnOff: true,
                  //         onToggle: (val) {
                  //           setState(
                  //             () {
                  //               on_leave_status = !on_leave_status;
                  //             },
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Reason",
                    style: GoogleFonts.lato(
                        fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  TextFormField(
                    onTap: () {},
                    decoration: InputDecoration(
                      hintText: "Enter Reason",
                      hintStyle: GoogleFonts.lato(fontSize: 12.sp),
                      suffixIcon: Icon(Icons.note_alt_outlined),
                    ),
                    controller: noteController,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  if (_selectedDate.toString() != "null") {
                    if (noteController.text.isNotEmpty) {
                      await Raise_Leave_Request_controller()
                          .Raise_Leave_Request_with_on_leave_controller_method(
                              noteController.text,
                              _selectedDate.toString().substring(0, 10),
                              context);
                      noteController.clear();
                      get_Leave_calendar_data_method();
                    } else {
                      customFlutterToast("Please Enter Note");
                    }
                  } else {
                    customFlutterToast("Please Select Date ");
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }

  void get_Leave_calendar_data_method() async {
    get_Leave_calendar_data = await Get_Leave_calendar_controller()
        .Get_Leave_calendar_controller_method();
    if (get_Leave_calendar_data.status.toString() == "true") {
      loadPreviousEvents();
      print(get_Leave_calendar_data.data);
      setState(
        () {
          is_load_Leave_calendar_data = true;
        },
      );
    }
  }
}
