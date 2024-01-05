import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import 'CallLogsTab/seCallLogsTab.dart';
import 'DashboardTab/DashboardSETab.dart';
import 'WorkOrdersTabSE/WorkOdersTabSE.dart';

class MainClassSE extends StatefulWidget {
  const MainClassSE({super.key});

  @override
  State<MainClassSE> createState() => _MainClassSEState();
}

class _MainClassSEState extends State<MainClassSE> {
  @override
  @override
  void initState() {
    AwesomeNotifications().actionStream.listen(
          (event) async {
        debugPrint("Clicked==SE====${event.buttonKeyPressed}");
        if (event.buttonKeyPressed == "REJECT") {
          debugPrint("Work Order SE rejected");
        } else if (event.buttonKeyPressed == "ACCEPT") {
          debugPrint("Work Order SE Accepted");
          // update_wo_status_Controller()
          //     .update_wo_status_accepted_Controller_method(Work_id, context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BottomNavigationPageSE(
                BottomIndex: 1,
                SendTabIndex: 0,
              ),
            ),
          );
        } else {
          debugPrint("Clicked on notification SE");
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationPageSE();
  }
}

class BottomNavigationPageSE extends StatefulWidget {
  var BottomIndex;
  var SendTabIndex;

  BottomNavigationPageSE({this.BottomIndex, this.SendTabIndex, super.key});

  @override
  State<BottomNavigationPageSE> createState() => _BottomNavigationPageSEState();
}

class _BottomNavigationPageSEState extends State<BottomNavigationPageSE> {
  int _selectedIndex = 0;
  bool selectedTabs = true;

  void _onItemTapped(int index) {
    setState( () {
        _selectedIndex = index;
      },
    );
  }

  @override
  void initState() {
    if (widget.BottomIndex != null) {
      _selectedIndex = widget.BottomIndex;
    } else {
      _selectedIndex = 0;
    }
    if (widget.SendTabIndex == null) {}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List _pages = [
      DashboardSE(),
      WorkOrderSE(TabIndex: widget.SendTabIndex == null ? 0 : widget.SendTabIndex,),
      seCallLogsTab(),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: appThemeColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined,size: 16.sp,),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note_alt_outlined,size: 16.sp,),
                label: 'Work Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.support_agent,size: 16.sp,),
                label: 'Call Logs',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            selectedLabelStyle: GoogleFonts.lato(fontSize: 12.sp,fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.lato(fontSize: 10.sp),
            iconSize: 15.sp,
            onTap: _onItemTapped,
            elevation: 5),
        body: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
