import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/WorkOrderModel.dart';

class woDetailsAfterAccept extends StatefulWidget {
  var Tab_index1;

  woDetailsAfterAccept({required this.Tab_index1, super.key});

  @override
  State<woDetailsAfterAccept> createState() => _woDetailsAfterAcceptState();
}

class _woDetailsAfterAcceptState extends State<woDetailsAfterAccept> {
  TextEditingController ReasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  bool is_status1_work_list_load = false;
  late GetWorkOrderListModel get_work_order_status1;

  @override
  void initState() {
    super.initState();
    get_work_order_status1_method();
  }

  @override
  Widget build(BuildContext context) {
    return is_status1_work_list_load
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Work Order # ${get_work_order_status1.data![widget.Tab_index1].workId.toString()}",
                style: dashboardStyle,
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              backgroundColor: appThemeColor,
            ),
            backgroundColor: appThemeColor,
            body: Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Container(
                height: 90.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 3.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        get_work_order_status1.data!.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 20.h,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 5),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      pauseAutoPlayOnTouch: true,
                                      enlargeCenterPage: true,
                                      enableInfiniteScroll: true,
                                    ),
                                    items: [
                                      Container(
                                        height: 20.h,
                                        width: double.infinity,
                                        color: Colors.grey.withOpacity(0.3),
                                        child: Image.asset(
                                            "assets/images/asset_1.png"),
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: double.infinity,
                                        color: Colors.grey.withOpacity(0.3),
                                        child: Image.asset(
                                            "assets/images/asset_2.webp"),
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: double.infinity,
                                        color: Colors.grey.withOpacity(0.3),
                                        child: Image.asset(
                                            "assets/images/asset_3.jpg"),
                                      ),
                                      Container(
                                        height: 20.h,
                                        width: double.infinity,
                                        color: Colors.grey.withOpacity(0.3),
                                        child: Image.asset(
                                            "assets/images/asset_4.jpg"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 30.h,
                                            width: 35.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Asset Name",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Text(
                                                      "${get_work_order_status1.data![widget.Tab_index1].asset.toString()}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Subject",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Text(
                                                      "${get_work_order_status1.data![widget.Tab_index1].subject.toString()}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Location",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Text(
                                                      "${get_work_order_status1.data![widget.Tab_index1].loc.toString()}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Description",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    Text(
                                                      "${get_work_order_status1.data![widget.Tab_index1].desc.toString()}",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 20.h,
                                          width: 30.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Status",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  Text(
                                                    "${get_work_order_status1.data![widget.Tab_index1].woStatus.toString()}",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 10.sp,
                                                        color: Colors.orange,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Priority",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  Text(
                                                    "${get_work_order_status1.data![widget.Tab_index1].priority.toString()}",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 10.sp,
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Category",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 0.5.h,
                                                  ),
                                                  Text(
                                                    "${get_work_order_status1.data![widget.Tab_index1].category.toString()}",
                                                    style: GoogleFonts.lato(
                                                        fontSize: 10.sp,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: Text(
                                    "${get_work_order_status1.message.toString()}"),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu), // Icon to represent the drawer
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer
                  },
                ),
              ),
              backgroundColor: appThemeColor,
            ),
            backgroundColor: appThemeColor,
            body: Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Container(
                height: 80.h,
              ),
            ),
          );
  }

  void get_work_order_status1_method() async {
    get_work_order_status1 = await work_order_list_controller()
        .work_order_list_unaccepted_controller_method(Work_order_status1);
    // get_add_parts_list_method();
    setState(() {
      is_status1_work_list_load = true;
    });
  }
}
