import 'package:cloverleaf_project/controller/Get_SE_Dashboard_percentage_details_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_User_status_controller.dart';
import '../../../controller/is_update_active_controller.dart';
import '../../../model/GetSEDashbordDataModel.dart';
import '../../../model/GetUserStatusModel.dart';
import '../BottomNavigationPageSE.dart';
import '../DrawerSE/DrawerSE.dart';
import '../DrawerSE/SEpayoutPage.dart';

class DashboardSE extends StatefulWidget {
  const DashboardSE({super.key});

  @override
  State<DashboardSE> createState() => _DashboardSEState();
}

class _DashboardSEState extends State<DashboardSE> {
  final TextEditingController singleInviteeUserIDTextCtrl =
      TextEditingController();
  final TextEditingController groupInviteeUserIDsTextCtrl =
      TextEditingController();

  Map<String, double> dataMap = {};
  int key1 = 0;
  List<Color> colorList1 = [
    appThemeColor,
    Colors.orange,
    Colors.blue,
  ];
  bool is_load_SE_Dashboard_data = false;
  late GetSeDashbordDataModel get_SE_dashboard_data;
  late GetUserStatusModel Get_SE_status;
  bool online_offline_SE_status = false;
  bool is_load_SE_status = false;

  @override
  void initState() {
    Get_SE_Dashboard_data_method();
    Get_SE_status_method();
    super.initState();
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
            padding: const EdgeInsets.only(right: 15),
            child: is_load_SE_status
                ? FlutterSwitch(
                    width: 20.w,
                    height: 3.2.h,
                    valueFontSize: 14,
                    toggleSize: 20,
                    value: online_offline_SE_status,
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
      drawer: const AppDrawerSE(),
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
        child: is_load_SE_Dashboard_data
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: get_SE_dashboard_data.data!.compPerc!.isEmpty
                    ? Center(
                        child:
                            Text("${get_SE_dashboard_data.message.toString()}"),
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
                                  builder: (context) => BottomNavigationPageSE(
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
                                        "Completed Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        get_SE_dashboard_data.data!.completed
                                            .toString(),
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
                                  builder: (context) => BottomNavigationPageSE(
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
                                        "OnGoing Work Orders",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        get_SE_dashboard_data.data!.onging
                                            .toString(),
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
                                  builder: (context) => BottomNavigationPageSE(
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
                                        get_SE_dashboard_data.data!.assign
                                            .toString(),
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
                                  builder: (context) => SE_Payout_list(),
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
                                            get_SE_dashboard_data.data!.payout
                                                .toString(),
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
    setState(() {
      online_offline_SE_status = !online_offline_SE_status;
    });
    await is_update_active_controller()
        .is_update_SE_active_controller_method(online_offline_SE_status);
  }

  void Get_SE_status_method() async {
    Get_SE_status =
        await Get_User_status_controller().Get_SE_status_controller_method();
    setState(() {
      if (Get_SE_status.data.toString() == "1") {
        online_offline_SE_status = true;
        is_load_SE_status = true;
      } else {
        online_offline_SE_status = false;
        is_load_SE_status = true;
      }
    });
  }

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

  void Get_SE_Dashboard_data_method() async {
    get_SE_dashboard_data =
        await Get_SE_Dashboard_percentage_details_Controller()
            .Get_SE_Dashboard_percentage_details_Controller_method();
    dataMap = {
      'Completed': double.parse(get_SE_dashboard_data.data!.compPerc.toString()),
      'Pending':
          double.parse(get_SE_dashboard_data.data!.ongoingPerc.toString()),
      'UnAccepted':
          double.parse(get_SE_dashboard_data.data!.assignPerc.toString()),
    };

    if (mounted) {
      setState(() {
        is_load_SE_Dashboard_data = true;
      });
    }
  }
}
