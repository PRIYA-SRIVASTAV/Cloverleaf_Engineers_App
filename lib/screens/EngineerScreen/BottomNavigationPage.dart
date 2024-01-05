import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/EngCallLogsTab/callLogsPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import 'DashboardTab/dashBoardPage.dart';
import 'WorkOdersTabs/WorkOrders.dart';

class MainClassEng extends StatefulWidget {
  const MainClassEng({super.key});

  @override
  State<MainClassEng> createState() => _MainClassEngState();
}

class _MainClassEngState extends State<MainClassEng> {
  @override
  void initState() {
    AwesomeNotifications().actionStream.listen(
      (event) async {
        debugPrint("Clicked======${event.buttonKeyPressed}");
        if (event.buttonKeyPressed == "REJECT") {
          debugPrint("Work Order rejected");
        } else if (event.buttonKeyPressed == "ACCEPT") {
          debugPrint("Work Order Accepted");
          // update_wo_status_Controller()
          //     .update_wo_status_accepted_Controller_method(Work_id, context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BottomNavigationPage(
                BottomIndex: 1,
                SendTabIndex: 0,
              ),
            ),
          );
        } else {
          debugPrint("Clicked on notification");
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationPage();
  }
}

class BottomNavigationPage extends StatefulWidget {
  var BottomIndex;
  var SendTabIndex;

  BottomNavigationPage({this.BottomIndex, this.SendTabIndex, super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  bool selectedTabs = true;

  void _onItemTapped(int index) {
    setState(
      () {
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
      dashBoardPage(),
      WorkOrders(
          TabIndex: widget.SendTabIndex == null ? 0 : widget.SendTabIndex),
      callLogsPage(),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: appThemeColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  size: 16.sp,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_alt_outlined,
                  size: 16.sp,
                ),
                label: 'Work Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call_outlined,
                  size: 16.sp,
                ),
                label: 'Call Logs',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            selectedLabelStyle:
                GoogleFonts.lato(fontSize: 12.sp, fontWeight: FontWeight.w600),
            unselectedLabelStyle: GoogleFonts.lato(fontSize: 10.sp),
            iconSize: 15.sp,
            onTap: _onItemTapped,
            elevation: 5),
        body: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
