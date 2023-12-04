
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../assetsTab/assetsPage.dart';
import '../metersTab/metersPage.dart';
import '../workOrdersTab/workOrdersPage.dart';
import '../workRequestsTab/workRequestsPage.dart';

class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationPage(BottomIndex: null,);
  }
}

class BottomNavigationPage extends StatefulWidget {
  var BottomIndex;
  var SendTabIndex;
   BottomNavigationPage({required this.BottomIndex,this.SendTabIndex,super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _sellectedIndex =0;
  bool selectedTabs = true;

  void _onItemTapped(int index){
    setState(() {
      _sellectedIndex=index;
    });
  }

  @override
  void initState() {
    if(widget.BottomIndex!=null){
      _sellectedIndex=widget.BottomIndex;
    }else{
      _sellectedIndex=0;
    }
    if(widget.SendTabIndex==null){}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List _pages =[
      assetsPage(),
      workOrdersPage(),
      workRequestsPage(),
      metersPage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: appThemeColor,
        items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
            label: "Assets"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt_sharp),
            label: "Work Orders"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings_ethernet_outlined),
            label: "Work Requests"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.av_timer_rounded),
              label: "Meters"
          ),
        ],
        currentIndex: _sellectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle:
        TextStyle(fontWeight: FontWeight.bold,fontSize: 12.sp),
        iconSize: 15.sp,
        onTap: _onItemTapped,
        elevation: 5,
      ),
      body: _pages.elementAt(_sellectedIndex),
    );
  }
}

