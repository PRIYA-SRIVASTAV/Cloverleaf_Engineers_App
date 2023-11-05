import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:cloverleaf_project/utils/helperWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
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
    mySelectedEvents = get_Leave_calendar_data.data;
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
        backgroundColor: appThemeColor,
        centerTitle: true,
        title: const Text('Leave Calendar'),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: is_load_Leave_calendar_data
          ? SingleChildScrollView(
              child: Column(
                children: [
                  get_Leave_calendar_data.data.isNotEmpty
                      ? TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDate, selectedDay)) {
                              // Call `setState()` when updating the selected day
                              setState(() {
                                _selectedDate = selectedDay;
                                _focusedDay = focusedDay;
                              });
                              sendDate = _selectedDate;
                              print(sendDate);
                            } else {
                              sendDate = _selectedDate;
                              print(sendDate);
                            }
                          },
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDate, day);
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              // Call `setState()` when updating calendar format
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                          eventLoader: _listOfDayEvents,
                        )
                      : Center(
                          child: Text(
                              "${get_Leave_calendar_data.message.toString()}"),
                        ),
                  //  ..._listOfDayEvents(_selectedDate!).map(
                  //        (e) => ListTile(
                  //      leading: const Icon(
                  //        Icons.done,
                  //        color: Colors.teal,
                  //      ),
                  //      title: Padding(
                  //        padding: const EdgeInsets.only(bottom: 8.0),
                  //        child: Text('Leave Title:   ${e['is_onleave']}'),
                  //      ),
                  //      //subtitle: Text('Description:   ${myEvents['eventDescp']}'),
                  //    ),
                  // ),
                ],
              ),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDate, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDate = selectedDay;
                          _focusedDay = focusedDay;
                        });
                        sendDate = _selectedDate;
                        print(sendDate);
                      } else {
                        sendDate = _selectedDate;
                        print(sendDate);
                      }
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDate, day);
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                    //eventLoader: _listOfDayEvents,
                  ),
                ],
              ),
          ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: appThemeColor,
        onPressed: () => _showAddLeaveDailog(),
        //_showAddEventDialog(),
        label: const Text('Raise leave request'),
      ),
    );
  }

  _showAddLeaveDailog() async {
    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return AlertDialog(
          title: const Text(
            'Leave Request',
            textAlign: TextAlign.center,
          ),
          content: Container(
            height: 18.h,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${sendDate.toString() == "null" ? "" : sendDate.toString().substring(0, 10)}',
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                      "On leave/On work",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: FlutterSwitch(
                        width: 18.w,
                        height: 3.2.h,
                        valueFontSize: 14,
                        toggleSize: 20,
                        value: on_leave_status,
                        activeColor: Colors.green,
                        activeTextColor: Colors.white,
                        activeTextFontWeight: FontWeight.w400,
                        activeText: "leave",
                        inactiveText: "work",
                        inactiveColor: Colors.orange,
                        inactiveTextColor: Colors.white,
                        inactiveTextFontWeight: FontWeight.w400,
                        borderRadius: 30,
                        padding: 4,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            on_leave_status = !on_leave_status;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Note",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextFormField(
                  onTap: () {},
                  decoration: const InputDecoration(
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
                  if (sendDate.toString() != "null") {
                    if (noteController.text.isNotEmpty) {
                      await Raise_Leave_Request_controller()
                          .Raise_Leave_Request_with_on_leave_controller_method(
                              on_leave_status,
                              noteController.text,
                              sendDate.toString().substring(0, 10),
                              context);
                      noteController.clear();
                      get_Leave_calendar_data_method();
                    } else {
                      customFlutterToast("Please Enter Note");
                    }
                  } else {
                    customFlutterToast("Please Select Date ");
                  }
                })
          ],
        );
      }),
    );
  }

  void get_Leave_calendar_data_method() async {
    get_Leave_calendar_data = await Get_Leave_calendar_controller()
        .Get_Leave_calendar_controller_method();
    if (get_Leave_calendar_data.status.toString() == "true") {
      loadPreviousEvents();
      print(get_Leave_calendar_data.data);
      setState(() {
        is_load_Leave_calendar_data = true;
      });
    }
  }
}
