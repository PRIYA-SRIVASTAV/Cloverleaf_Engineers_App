import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import 'CallLogsTab/CallLogsTab.dart';
import 'DashboardTab/DashboardSETab.dart';
import 'WorkOrdersTabSE/WorkOdersTabSE.dart';

class MainClassSE extends StatefulWidget {
  const MainClassSE({super.key});

  @override
  State<MainClassSE> createState() => _MainClassSEState();
}

class _MainClassSEState extends State<MainClassSE> {
  @override
  // void initState() {
  //   AwesomeNotifications().actionStream.listen(
  //         (event) async {
  //       if (event.buttonKeyPressed == "REJECT") {
  //         debugPrint("Work Order rejected");
  //         AudioNotificationPlayStop(0);
  //       } else if (event.buttonKeyPressed == "ACCEPT") {
  //         debugPrint("Work Order Accepted");
  //         AudioNotificationPlayStop(0);
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (_) => BottomNavigationPageSE(BottomIndex: 1,SendTabIndex: 1,)));
  //       } else {
  //         debugPrint("Clicked on notification");
  //         AudioNotificationPlayStop(0);
  //       }
  //     },
  //   );
  //   super.initState();
  // }

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
      CallLogsTab(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: appThemeColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note_alt_outlined),
              label: 'Work Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Call Logs',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
          iconSize: 15.sp,
          onTap: _onItemTapped,
          elevation: 5),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
