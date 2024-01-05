import 'package:cloverleaf_project/controller/Get_Dashboard_percentage%20Details_Controller.dart';
import 'package:cloverleaf_project/controller/Get_User_status_controller.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/BottomNavigationPage.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/Drawer/test_payroll_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Post_current_location_controller.dart';
import '../../../controller/is_update_active_controller.dart';
import '../../../model/GetDashboardDataModel.dart';
import '../../../model/GetUserStatusModel.dart';
import '../Drawer/customDrawer.dart';

class dashBoardPage extends StatefulWidget {
  dashBoardPage({super.key});

  @override
  State<dashBoardPage> createState() => _dashBoardPageState();
}

class _dashBoardPageState extends State<dashBoardPage> {
  bool online_offline_status = false;
  bool is_load_user_status = false;
  bool is_load_Dashboard_data = false;
  late GetUserStatusModel get_user_status_data;
  late GetDashboardDataModel get_dashboard_data;
  Map<String, double> dataMap = {};
  late bool serviceEnabled;
  late LocationPermission permission;
  double? lat;
  double? long;
  String address = "";
  Future<Position>? data;

  Future<Position> _determinePosition() async {
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        permission = await Geolocator.requestPermission();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      permission = await Geolocator.requestPermission();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() async {
    data = _determinePosition();
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      address = placemarks[0].street! + " " + placemarks[0].country!;
    });

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }

  int key1 = 0;

  Widget pieChartsOne(context) {
    return PieChart(
      key: ValueKey(key1),
      dataMap: dataMap,
      initialAngleInDegree: 0,
      animationDuration: const Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: 8.h,
      ringStrokeWidth: 10.h,
      colorList: colorList1,
      chartLegendSpacing: 10.h,
      chartValuesOptions: ChartValuesOptions(
          showChartValuesOutside: true,
          // showChartValuesInPercentage: true,
          //showChartValueBackground: true,
          showChartValues: true,
          chartValueStyle: chartValueStyle),
      //centerText: 'Task Status',
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        // legendPosition: LegendPosition.right,
        legendTextStyle: legendTextStyle,
      ),
    );
  }

  List<Color> colorList1 = [
    appThemeColor,
    Colors.orange,
    Colors.blue,
    Colors.grey
  ];

  String _selectedLanguage = 'English';
  @override
  void initState() {
    super.initState();
    Get_User_status_method();
    Get_Dashboard_data_method();
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: is_load_user_status
                ? FlutterSwitch(
                    width: 20.w,
                    height: 3.2.h,
                    valueFontSize: 14,
                    toggleSize: 20,
                    value: online_offline_status,
                    activeColor: Colors.lightGreen,
                    activeTextColor: Colors.white,
                    activeTextFontWeight: FontWeight.w400,
                    activeText: "online",
                    inactiveText: "offline",
                    inactiveColor: Colors.grey,
                    inactiveTextColor: Colors.white,
                    inactiveTextFontWeight: FontWeight.w400,
                    borderRadius: 30,
                    padding: 4,
                    showOnOff: true,
                    onToggle: (val) {
                      tapButton();
                    },
                  )
                : SizedBox(
                    height: 1.h,
                    width: 8.h,
                    child: Center(
                      child: Text(
                        "Loading...",
                        style: GoogleFonts.lato(),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h,right: 2.h),
            child: InkWell(
              onTap: () {
                _showLanguageMenu(context);
              },
              child: Column(
                children: [
                  Icon(
                    Icons.translate_sharp,
                    size: 18.sp,
                  ),
                  Text('$_selectedLanguage',style: GoogleFonts.lato(
                    fontSize: 10.sp
                  ),),
                ],
              ),
            ),
          )
        ],
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
      drawer: const AppDrawer(),
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
        child: is_load_Dashboard_data
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: get_dashboard_data.data!.compPerc!.isEmpty
                    ? Center(
                        child: Text("${get_dashboard_data.message.toString()}"),
                      )
                    : ListView(
                        children: [
                          Container(
                            height: 28.h,
                            width: double.infinity,
                            child: Card(
                              shape: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Summary",
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.w),
                                    child: pieChartsOne(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigationPage(
                                      BottomIndex: 1, SendTabIndex: 3),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Card(
                                shape: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Completed Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${get_dashboard_data.data!.completed}",
                                        style: GoogleFonts.rubik(
                                            fontSize: 16.sp,
                                            color: appThemeColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigationPage(
                                      BottomIndex: 1, SendTabIndex: 1),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Ongoing Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${get_dashboard_data.data!.ongoing}",
                                        style: GoogleFonts.rubik(
                                            fontSize: 16.sp,
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigationPage(
                                      BottomIndex: 1, SendTabIndex: 2),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Card(
                                shape: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade200),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Accelerated Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${get_dashboard_data.data!.accelerate}",
                                        style: GoogleFonts.rubik(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavigationPage(
                                      BottomIndex: 1, SendTabIndex: 0),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Unaccepted Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "${get_dashboard_data.data!.assign}",
                                        style: GoogleFonts.rubik(
                                            fontSize: 16.sp,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Eng_Payout_list(),
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 8.h,
                              width: double.infinity,
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Payouts",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.currency_rupee_sharp,
                                            size: 16.sp,
                                          ),
                                          Text(
                                            "${get_dashboard_data.data!.payout.toString()}",
                                            style: GoogleFonts.rubik(
                                                fontSize: 16.sp,
                                                color: appThemeColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              )
            : Center(
                child: Text(
                  "Work order not assign yet !!!",
                  style: GoogleFonts.lato(color: Colors.red),
                ),
              ),
      ),
    );
  }

  void tapButton() async {
    if (online_offline_status == false) {
      await getLatLong();
      await data?.then((value) {
        print("value $value");
        lat = value.latitude;
        long = value.longitude;

        getAddress(value.latitude, value.longitude);
      }).catchError((error) {
        print("Error $error");
      });
      if (lat == null) {
        setState(() {
          online_offline_status = false;
          Fluttertoast.showToast(
              msg: "Please turn on location !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.sp);
        });
      } else {
        setState(() {
          online_offline_status = true;
        });
        await is_update_active_controller()
            .is_update_ENG_active_controller_method(online_offline_status);
        await Post_current_location_controller()
            .Post_current_location_controller_method(lat, long, address);
      }
    } else {
      setState(() {
        online_offline_status = false;
      });
      await is_update_active_controller()
          .is_update_ENG_active_controller_method(online_offline_status);
    }
  }

  void Get_User_status_method() async {
    get_user_status_data =
        await Get_User_status_controller().Get_User_status_controller_method();
    if (get_user_status_data.data.toString() == "1") {
      online_offline_status = true;
      is_load_user_status = true;
    } else {
      online_offline_status = false;
      is_load_user_status = true;
    }
    // setState(() {
    //   if (get_user_status_data.data.toString() == "1") {
    //     online_offline_status = true;
    //     is_load_user_status = true;
    //   } else {
    //     online_offline_status = false;
    //     is_load_user_status = true;
    //   }
    // });
  }

  void Get_Dashboard_data_method() async {
    get_dashboard_data = await Get_Dashboard_percentage_details_Controller()
        .Get_Dashboard_percentage_details_Controller_method();
    Map<String, double> percentage = {
      'Completed': double.parse(get_dashboard_data.data!.compPerc.toString()),
      'Pending': double.parse(get_dashboard_data.data!.pendingPerc.toString()),
      'UnAccepted':
          double.parse(get_dashboard_data.data!.unassignPerc.toString()),
      'Accelerated': double.parse(get_dashboard_data.data!.accPerc.toString()),
    };
    dataMap = percentage;
    is_load_Dashboard_data = true;
    // setState(() {
    //   is_load_Dashboard_data = true;
    // });
  }

  void _showLanguageMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100.h, 13.h, 0, 0),
      items: [
        PopupMenuItem(
          child: Text('English',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'English',
        ),
        PopupMenuItem(
          child: Text('हिंदी',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'हिंदी',
        ),
        PopupMenuItem(
          child: Text('chinese',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'chinese',
        ),
        PopupMenuItem(
          child: Text('Bengali',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'Bengali',
        ),
        PopupMenuItem(
          child: Text('Tamil',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'Tamil',
        ),
        PopupMenuItem(
          child: Text('Spanish',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'Spanish',
        ),
        PopupMenuItem(
          child: Text('French',style: GoogleFonts.lato(fontSize: 10.sp),),
          value: 'French',
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedLanguage = value;
        });
      }
    });
  }
}
