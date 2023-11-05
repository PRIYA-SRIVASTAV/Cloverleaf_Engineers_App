import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import '../../utils/helperMethods.dart';
import 'DashboardTab/dashBoardPage.dart';
import 'SupportTab/Support.dart';
import 'WorkOdersTabs/WorkOrders.dart';


class MainClassEng extends StatefulWidget {
  const MainClassEng({super.key});

  @override
  State<MainClassEng> createState() => _MainClassEngState();
}

class _MainClassEngState extends State<MainClassEng> {
  // @override
  // void initState() {
  //   AwesomeNotifications().actionStream.listen(
  //     (event) async {
  //       if (event.buttonKeyPressed == "REJECT") {
  //         debugPrint("Work Order rejected");
  //         AudioNotificationPlayStop(0);
  //       } else if (event.buttonKeyPressed == "ACCEPT") {
  //         debugPrint("Work Order Accepted");
  //         AudioNotificationPlayStop(0);
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (_) => BottomNavigationPage(BottomIndex: 1,SendTabIndex: 1,)));
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
        TabIndex: widget.SendTabIndex == null ? 0 : widget.SendTabIndex,
      ),
      SupportPage(),
    ];
    return Scaffold(
      bottomNavigationBar:
      BottomNavigationBar(
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
              label: 'Support',
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
