// import 'package:daacoworks/Constants/colorConstants.dart';
// import 'package:daacoworks/Screens/assetsTab/assetsPage.dart';
// import 'package:daacoworks/Screens/metersTab/metersPage.dart';
// import 'package:daacoworks/Screens/workOrdersTab/workOrdersPage.dart';
// import 'package:daacoworks/Screens/workRequestsTab/workRequestsPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../partScreenTab/partsViewScreen.dart';
import 'bottomNavigationBar.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget circularImage() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/AdminDp.png'),
      radius: 30,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50.h,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      circularImage(),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "Admin",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 20.sp,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Assets",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavigationPage(BottomIndex: 0)),
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(Icons.note_add_sharp,
                            size: 20.sp, color: Colors.black54),
                        SizedBox(width: 2.w),
                        Text(
                          "Work Orders",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavigationPage(BottomIndex: 1)),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.record_voice_over_rounded,
                          size: 20.sp,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Work Requests",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigationPage(BottomIndex: 2)),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_ethernet_sharp,
                          size: 20.sp,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Parts",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => partViewScreen()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.speed,
                          size: 20.sp,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Meters",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>BottomNavigationPage(BottomIndex: 3)),
                      );
                    },
                  ),
                  // const Divider(
                  //   color: Colors.grey,
                  //   thickness: 2,
                  // ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  Container(
                    width: 100.w,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: appThemeColor,
                            // shape:StadiumBorder(),
                            side: BorderSide.none,
                        ),
                        child: Text("Log Out")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
