import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class ApplyLeave extends StatefulWidget {
  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  Map<String, List> event = {
    "2023-10-09": [
      {"type": "Holiday", "notes": "Diwali"},
      {"type": "Attendance", "notes": "Present"}
    ],
    "2023-10-10": [
      {"type": "Attendance", "notes": "Absent"}
    ],
    "2023-10-13": [
      {"type": "Attendance", "notes": "Absent"}
    ],
    "2023-10-11": [
      {"type": "Attendance", "notes": "Present"}
    ]
  };

  loadPreviousEvents() {
    mySelectedEvents = event;
  }

  @override
  void initState() {
    loadPreviousEvents();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              color: Colors.red,
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
                        weekendDays: const [DateTime.saturday, DateTime.sunday],
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekendStyle: TextStyle(color: Colors.red),
                        ),
                        // Calendar Header Styling
                        headerStyle: HeaderStyle(
                          headerPadding: EdgeInsets.zero,
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: Colors.yellow,
                            size: 6.w,
                          ),
                          rightChevronIcon: Icon(
                            Icons.chevron_right,
                            color: Colors.greenAccent,
                            size: 6.w,
                          ),
                        ),
                        eventLoader: _listOfDayEvents,
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (BuildContext context, date, events) {
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
                                          color: dotColor(index, events)),
                                    ),
                                  );
                                });
                          },
                        ),

                        // /// for sat sunday holidays
                        // holidayPredicate: (day) {
                        //   return day.weekday >= 6;
                        // },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 1.5.w,
                                width: 1.5.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Text(
                                "Present",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 1.5.w,
                                width: 1.5.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Text(
                                "Absent",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 1.5.w,
                                width: 1.5.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orangeAccent),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const Text(
                                "Leave",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (_selectedDate != null) ...[
              ..._listOfDayEvents(_selectedDate!).map(
                (e) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                              const Text(
                                "Date",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                _selectedDate.toString().substring(0, 10),
                                style: GoogleFonts.lato(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
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
                                '${e['type']}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                '${e['notes']}',
                                style: TextStyle(
                                    color: e['notes'].toString() == "Present"
                                        ? Colors.green
                                        : e['notes'].toString() == "Absent"
                                            ? Colors.red
                                            : Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
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
    );
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
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
}
