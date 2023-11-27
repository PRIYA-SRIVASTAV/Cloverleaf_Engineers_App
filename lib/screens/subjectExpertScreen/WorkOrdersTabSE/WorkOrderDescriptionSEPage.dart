import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/constant/prefsConstant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Services/ZegoLoginServices.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../controller/Get_Parts_List_Controller.dart';
import '../../../controller/Get_SE_Work_Order_List_Controller.dart';
import '../../../model/GetAddPartsListModel.dart';
import '../../../model/GetPartsModel.dart';
import '../../../model/SE_Work_order_model.dart';

class WorkOrderDescriptionSEpage extends StatefulWidget {
  var index;

  WorkOrderDescriptionSEpage({required this.index, super.key});

  @override
  State<WorkOrderDescriptionSEpage> createState() =>
      _WorkOrderDescriptionSEpageState();
}

class _WorkOrderDescriptionSEpageState
    extends State<WorkOrderDescriptionSEpage> {
  TextEditingController inviteeController = TextEditingController();
  String? selectedValue;
  String? dropdownvalue;
  String? dropdownvalueName;
  late GetSeWorkOrderListModel get_SE_work_order_status2;
  late GetPartsModel get_SE_parts_list_data;
  late GetAddPartsListModel get_SE_add_parts_list;
  bool is_status2_SE_work_list_load = false;
  bool is_load_SE_parts_list = false;
  bool is_load_SE_add_parts_list = false;

  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
    get_SE_parts_list_data_method();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (is_status2_SE_work_list_load) {
      settingDataForPostApiCall();
    }

    return DefaultTabController(
      length: 2,
      child: is_status2_SE_work_list_load
          ? SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  title: Text(
                    "Work Order # ${get_SE_work_order_status2.data?[widget.index].workId}",
                    style: dashboardStyle,
                  ),
                  leading: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      // Icon to represent the drawer
                      onPressed: () {
                        Navigator.pop(context); // Open the drawer
                      },
                    ),
                  ),
                  backgroundColor: appThemeColor,
                ),
                body: Padding(
                  padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
                  child: is_status2_SE_work_list_load
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 5.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(25.h),
                                ),
                                child: TabBar(
                                  indicator: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(25.h),
                                  ),
                                  labelColor: Colors.white,
                                  labelStyle: GoogleFonts.lato(
                                      fontSize: 9.5.sp,
                                      fontWeight: FontWeight.w600),
                                  unselectedLabelColor: Colors.grey,
                                  tabs: const [
                                    Tab(
                                      text: 'Order Description',
                                    ),
                                    Tab(
                                      text: 'Parts Used',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 70.h,
                                width: 100.w,
                                child: TabBarView(
                                  children: [
                                    if (is_status2_SE_work_list_load ==
                                        true) ...[
                                      get_SE_work_order_status2.data!.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CarouselSlider(
                                                  options: CarouselOptions(
                                                    height: 20.h,
                                                    autoPlay: true,
                                                    autoPlayInterval:
                                                        Duration(seconds: 5),
                                                    autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds: 800),
                                                    pauseAutoPlayOnTouch: true,
                                                    enlargeCenterPage: true,
                                                    enableInfiniteScroll: true,
                                                  ),
                                                  items: [
                                                    Container(
                                                      height: 20.h,
                                                      width: double.infinity,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      child: Image.asset(
                                                          "assets/images/asset_1.png"),
                                                    ),
                                                    Container(
                                                      height: 20.h,
                                                      width: double.infinity,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      child: Image.asset(
                                                          "assets/images/asset_2.webp"),
                                                    ),
                                                    Container(
                                                      height: 20.h,
                                                      width: double.infinity,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      child: Image.asset(
                                                          "assets/images/asset_3.jpg"),
                                                    ),
                                                    Container(
                                                      height: 20.h,
                                                      width: double.infinity,
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      child: Image.asset(
                                                          "assets/images/asset_4.jpg"),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 30.h,
                                                        width: 35.w,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Asset Name",
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  get_SE_work_order_status2
                                                                      .data![widget
                                                                          .index]
                                                                      .asset
                                                                      .toString(),
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Subject",
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  get_SE_work_order_status2
                                                                      .data![widget
                                                                          .index]
                                                                      .subject
                                                                      .toString(),
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Location",
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                  height: 0.5.h,
                                                                ),
                                                                Text(
                                                                  get_SE_work_order_status2
                                                                      .data![widget
                                                                          .index]
                                                                      .loc
                                                                      .toString(),
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                )
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  "Description",
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        0.5.h),
                                                                Text(
                                                                  get_SE_work_order_status2
                                                                      .data![widget
                                                                          .index]
                                                                      .desc
                                                                      .toString(),
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          10.sp,
                                                                      color: Colors
                                                                          .grey,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
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
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Status",
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 0.5.h,
                                                              ),
                                                              Text(
                                                                get_SE_work_order_status2
                                                                    .data![widget
                                                                        .index]
                                                                    .woStatus
                                                                    .toString(),
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: Colors
                                                                        .orange,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Priority",
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 0.5.h,
                                                              ),
                                                              Text(
                                                                get_SE_work_order_status2
                                                                    .data![widget
                                                                        .index]
                                                                    .priority
                                                                    .toString(),
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              )
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Category",
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              SizedBox(
                                                                height: 0.5.h,
                                                              ),
                                                              Text(
                                                                get_SE_work_order_status2
                                                                    .data![widget
                                                                        .index]
                                                                    .category
                                                                    .toString(),
                                                                style: GoogleFonts.lato(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Container(
                                                  height: 8.h,
                                                  width: 40.h,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Video/Voice Call to Engineer",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Row(
                                                            children: [
                                                              sendCallButton(
                                                                isVideoCall:
                                                                    false,
                                                                inviteeUsersIDTextCtrl:
                                                                    inviteeController,
                                                                onCallFinished:
                                                                    onSendCallInvitationFinished,
                                                              ),
                                                              sendCallButton(
                                                                isVideoCall:
                                                                    true,
                                                                inviteeUsersIDTextCtrl:
                                                                    inviteeController,
                                                                onCallFinished:
                                                                    onSendCallInvitationFinished,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Center(
                                              child: Text(
                                                  "${get_SE_work_order_status2.message.toString()}"),
                                            ),
                                    ] else ...[
                                      Center(
                                        child: CircularProgressIndicator(
                                          color: appThemeColor,
                                        ),
                                      )
                                    ],
                                    if (is_load_SE_add_parts_list == true) ...[
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w,
                                                  vertical: 1.h),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (get_SE_add_parts_list
                                                      .data!.isNotEmpty) ...[
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 8,
                                                            horizontal: 5),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                "Parts Id",
                                                                style: GoogleFonts.lato(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    12.sp),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Text(
                                                                "Parts Name",
                                                                style: GoogleFonts.lato(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                    fontSize:
                                                                    12.sp),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const ClampingScrollPhysics(),
                                                      itemCount:
                                                          get_SE_add_parts_list
                                                              .data?.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              i) {
                                                        return Card(
                                                          elevation: 3,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        2.h,
                                                                    horizontal:
                                                                        1.h),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Text(
                                                                    get_SE_add_parts_list
                                                                        .data![i]
                                                                        .partsId
                                                                        .toString(),
                                                                    style: GoogleFonts.rubik(
                                                                        fontSize:
                                                                            10.sp),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    get_SE_add_parts_list
                                                                        .data![i]
                                                                        .partsName
                                                                        .toString(),
                                                                    style: GoogleFonts.rubik(
                                                                        fontSize:
                                                                            10.sp),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ] else ...[
                                                    Container(
                                                      height: 55.h,
                                                      child: Center(
                                                        child: Text(
                                                            "${get_SE_add_parts_list.message.toString()}"),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ] else ...[
                                      Center(
                                        child: CircularProgressIndicator(
                                          color: appThemeColor,
                                        ),
                                      )
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(color: appThemeColor,),
                        ),
                ),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: appThemeColor,),
                ),
              ),
            ),
    );
  }

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_pending_controller_method(SE_Work_order_status2);
    get_SE_add_parts_list_method();
    inviteeController.text = get_SE_work_order_status2.data![widget.index].zegoUserId!;
    //  get_SE_work_order_status2.data[widget.index].zegoUserId;
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }

  void get_SE_add_parts_list_method() async {
    get_SE_add_parts_list = await Get_Add_Parts_list_controller()
        .Get_Add_SE_Parts_list_controller_method(
            get_SE_work_order_status2.data?[widget.index].workId.toString());
    setState(() {
      is_load_SE_add_parts_list = true;
    });
  }

  void get_SE_parts_list_data_method() async {
    get_SE_parts_list_data =
        await Get_Parts_List_Controller().Get_SE_Parts_List_Controller_method();
    setState(() {
      is_load_SE_parts_list = true;
    });
    print("Date time now==============> ${DateTime.now()}");
  }

  void settingDataForPostApiCall() {
    MyZegoConst.callWorkId = get_SE_work_order_status2.data![widget.index].workId.toString();
    MyZegoConst.ENg_Zego_id =
        get_SE_work_order_status2.data![widget.index].zegoUserId.toString();
    MyZegoConst.SE_Zego_id = currentUser.id.toString();
  }
}
