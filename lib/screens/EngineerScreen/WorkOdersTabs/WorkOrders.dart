import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/controller/work_order_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';
import '../Drawer/customDrawer.dart';
import 'AssetDesc/AssetDescrptionPage.dart';
import 'WorkOrderDescription.dart';

class WorkOrders extends StatefulWidget {
  var TabIndex;

  WorkOrders({required this.TabIndex, super.key});

  @override
  State<WorkOrders> createState() => _WorkOrdersState();
}

class _WorkOrdersState extends State<WorkOrders> {
  TextEditingController CommentController = TextEditingController();
  late GetWorkOrderListModel get_work_order_status1;
  late GetWorkOrderListModel get_work_order_status2;
  late GetWorkOrderListModel get_work_order_status3;
  late GetWorkOrderListModel get_work_order_status4;
  bool is_status1_work_list_load = false;
  bool is_status2_work_list_load = false;
  bool is_status3_work_list_load = false;
  bool is_status4_work_list_load = false;

  @override
  void initState() {
    super.initState();
    get_work_order_status1_method();
    get_work_order_status2_method();
    get_work_order_status3_method();
    get_work_order_status4_method();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.TabIndex,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Work Orders",
            style: dashboardStyle,
          ),
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
        drawer: const AppDrawer(),
        backgroundColor: appThemeColor,
        body: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      labelStyle: GoogleFonts.lato(
                          fontSize: 9.5.sp, fontWeight: FontWeight.w600),
                      indicator: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(25.h),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          text: 'Work Orders',
                        ),
                        Tab(
                          text: 'Ongoing',
                        ),
                        Tab(
                          text: 'Accelerate',
                        ),
                        Tab(
                          text: 'Completed',
                        ),
                      ],
                    ),
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.h),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 66.h,
                    width: 100.w,
                    child: TabBarView(
                      children: [
                        if (is_status1_work_list_load == true) ...[
                          if (get_work_order_status1.data!.isNotEmpty) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: get_work_order_status1.data?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 3.h,
                                          width: 10.h,
                                          color: Colors.blue.withOpacity(0.3),
                                          child: Center(
                                            child: Text(
                                              "Work-id #${get_work_order_status1.data?[index].workId.toString()}",
                                              style: GoogleFonts.lato(
                                                  color: Colors.blue,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                //color: Colors.red,
                                                height: 27.h,
                                                width: 40.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Asset Name",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        Text(
                                                          "${get_work_order_status1.data?[index].asset.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status1.data?[index].subject.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status1.data?[index].loc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status1.data?[index].desc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                              // color: Colors.grey,
                                              height: 27.h,
                                              width: 30.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
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
                                                        "${get_work_order_status1.data?[index].woStatus.toString()}",
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
                                                        "${get_work_order_status1.data?[index].priority.toString()}",
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
                                                        "${get_work_order_status1.data?[index].category.toString()}",
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
                                                        "Assign Date",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        "${get_work_order_status1.data?[index].woStatusDate.toString()}",
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: 25.w,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Theme.of(context)
                                                              .primaryColor),
                                                ),
                                                onPressed: () async {
                                                  var Work_id;
                                                  await getPref().then((value) {
                                                    value.setString(
                                                        KEYWORKID,
                                                        get_work_order_status1
                                                            .data?[index].workId
                                                            .toString());
                                                  });
                                                  await getPref().then((value) {
                                                    Work_id = value
                                                        .getString(KEYWORKID);
                                                  });
                                                  print(
                                                      "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                                  update_wo_status_Controller()
                                                      .update_wo_status_accepted_Controller_method(
                                                          Work_id, context);
                                                  get_work_order_status1_method();
                                                },
                                                child: Text(
                                                  "Accept",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25.w,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.grey),
                                                ),
                                                onPressed: () async {
                                                  var Work_id;
                                                  await getPref().then((value) {
                                                    value.setString(
                                                        KEYWORKID,
                                                        get_work_order_status1
                                                            .data?[index].workId
                                                            .toString());
                                                  });
                                                  await getPref().then((value) {
                                                    Work_id = value
                                                        .getString(KEYWORKID);
                                                  });
                                                  debugPrint(
                                                      "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                                  await update_wo_status_Controller()
                                                      .update_wo_status_rejected_Controller_method(
                                                          Work_id, context);
                                                  get_work_order_status1_method();
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ] else ...[
                            Center(
                              child: Text(
                                "${get_work_order_status1.message.toString()}",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          ],
                        ] else ...[
                          Center(
                            child: CircularProgressIndicator(
                              color: appThemeColor,),
                          )
                        ],
                        if (is_status2_work_list_load == true) ...[
                          if (get_work_order_status2.data!.isNotEmpty) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: get_work_order_status2.data?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WorkOrderDescriptionPage(
                                                index: index),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 3.h,
                                            width: 10.h,
                                            color: Colors.blue.withOpacity(0.3),
                                            child: Center(
                                              child: Text(
                                                "Work-id #${get_work_order_status2.data?[index].workId.toString()}",
                                                style: GoogleFonts.lato(
                                                    color: Colors.blue,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 27.h,
                                                  width: 40.w,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        child: Column(
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
                                                              "${get_work_order_status2.data?[index].asset.toString()}",
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
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        AssetDescrptionPage()),
                                                          );
                                                        },
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Subject",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            "${get_work_order_status2.data?[index].subject.toString()}",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 10.sp,
                                                                color:
                                                                    Colors.grey,
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
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            "${get_work_order_status2.data?[index].loc.toString()}",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 10.sp,
                                                                color:
                                                                    Colors.grey,
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
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          SizedBox(
                                                            height: 0.5.h,
                                                          ),
                                                          Text(
                                                            "${get_work_order_status2.data?[index].desc.toString()}",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 10.sp,
                                                                color:
                                                                    Colors.grey,
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
                                                height: 27.h,
                                                width: 30.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Status",
                                                          style:
                                                              GoogleFonts.lato(
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
                                                          "${get_work_order_status2.data?[index].woStatus.toString()}",
                                                          style:
                                                              GoogleFonts.lato(
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
                                                          style:
                                                              GoogleFonts.lato(
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
                                                          "${get_work_order_status2.data?[index].priority.toString()}",
                                                          style:
                                                              GoogleFonts.lato(
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
                                                          style:
                                                              GoogleFonts.lato(
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
                                                          "${get_work_order_status2.data?[index].category.toString()}",
                                                          style:
                                                              GoogleFonts.lato(
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
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ] else ...[
                            Center(
                              child: Text(
                                "${get_work_order_status2.message.toString()}",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          ],
                        ] else ...[
                          Center(
                            child: CircularProgressIndicator(
                              color: appThemeColor,),
                          )
                        ],
                        if (is_status3_work_list_load == true) ...[
                          if (get_work_order_status3.data!.isNotEmpty) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: get_work_order_status3.data?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 3.h,
                                          width: 10.h,
                                          color: Colors.blue.withOpacity(0.3),
                                          child: Center(
                                            child: Text(
                                              "Work-id #${get_work_order_status3.data?[index].workId.toString()}",
                                              style: GoogleFonts.lato(
                                                  color: Colors.blue,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 27.h,
                                                width: 40.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Asset Name",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status3.data?[index].asset.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status3.data?[index].subject.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status3.data?[index].loc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status3.data?[index].desc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                              height: 27.h,
                                              width: 30.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        "${get_work_order_status3.data?[index].woStatus.toString()}",
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
                                                        "${get_work_order_status3.data?[index].priority.toString()}",
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
                                                        "${get_work_order_status3.data?[index].category.toString()}",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      )
                                                    ],
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty
                                                          .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                    ),
                                                    onPressed: () async {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Complete_WO_dialog(
                                                              context, index);
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "Complete",
                                                      style: TextStyle(
                                                          fontSize: 10.sp),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ] else ...[
                            Center(
                              child: Text(
                                "${get_work_order_status3.message.toString()}",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          ],
                        ] else ...[
                          Center(
                            child: CircularProgressIndicator(
                              color: appThemeColor,),
                          )
                        ],
                        if (is_status4_work_list_load == true) ...[
                          if (get_work_order_status4.data!.isNotEmpty) ...[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: get_work_order_status4.data?.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade200),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 3.h,
                                          width: 10.h,
                                          color: Colors.blue.withOpacity(0.3),
                                          child: Center(
                                            child: Text(
                                              "Work-id #${get_work_order_status4.data?[index].workId.toString()}",
                                              style: GoogleFonts.lato(
                                                  color: Colors.blue,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 27.h,
                                                width: 40.w,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Asset Name",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status4.data?[index].asset.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status4.data?[index].subject.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status4.data?[index].loc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        SizedBox(
                                                          height: 0.5.h,
                                                        ),
                                                        Text(
                                                          "${get_work_order_status4.data?[index].desc.toString()}",
                                                          style: GoogleFonts.lato(
                                                              fontSize: 10.sp,
                                                              color: Colors.grey,
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
                                              height: 27.h,
                                              width: 30.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                        "${get_work_order_status4.data?[index].woStatus.toString()}",
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
                                                        "${get_work_order_status4.data?[index].priority.toString()}",
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
                                                        "${get_work_order_status4.data?[index].category.toString()}",
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
                                                        "Complete Date",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                      SizedBox(
                                                        height: 0.5.h,
                                                      ),
                                                      Text(
                                                        "${get_work_order_status4.data?[index].woStatusDate.toString()}",
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
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ] else ...[
                            Center(
                              child: Text(
                                "${get_work_order_status4.message.toString()}",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          ],
                        ] else ...[
                          Center(
                            child: CircularProgressIndicator(
                              color: appThemeColor,),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void get_work_order_status1_method() async {
    get_work_order_status1 = await work_order_list_controller()
        .work_order_list_unaccepted_controller_method(Work_order_status1);
    setState(() {
      is_status1_work_list_load = true;
    });
  }

  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status2);
    setState(() {
      is_status2_work_list_load = true;
    });
  }

  void get_work_order_status3_method() async {
    get_work_order_status3 = await work_order_list_controller()
        .work_order_list_accelerated_controller_method(Work_order_status3);
    setState(() {
      is_status3_work_list_load = true;
    });
  }

  void get_work_order_status4_method() async {
    get_work_order_status4 = await work_order_list_controller()
        .work_order_list_completed_controller_method(Work_order_status4);
    setState(() {
      is_status4_work_list_load = true;
    });
  }

  Widget Complete_WO_dialog(context, index) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 32.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:3.h,left:3.h,right:3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirmation",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: appThemeColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormField(
                        controller: CommentController,
                        maxLength: 100,
                        decoration: InputDecoration(
                            counterText: "",
                            suffixIcon: Icon(Icons.note_alt),
                            border: UnderlineInputBorder(),
                            hintText: "Enter any comment"),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Are you sure you want to mark it as Complete?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h,top: 3.h),
                        child: Row(
                          children: [
                            TextButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Complete',
                                style: TextStyle(
                                    fontSize: 10.sp, color: appThemeColor),
                              ),
                              onPressed: () async {
                                var Work_id;
                                await getPref().then((value) {
                                  value.setString(
                                      KEYWORKID,
                                      get_work_order_status3
                                          .data?[index].workId
                                          .toString());
                                });
                                await getPref().then((value) {
                                  Work_id = value.getString(KEYWORKID);
                                });
                                await update_wo_status_Controller()
                                    .update_wo_status_completed_Controller_method(
                                        Work_id, context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        key: Key('closeIconKey'),
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
