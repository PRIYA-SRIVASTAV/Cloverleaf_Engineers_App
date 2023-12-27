import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/controller/verify_otp_to_start_wo_controller.dart';
import 'package:cloverleaf_project/controller/work_order_list_controller.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/WorkOdersTabs/WOinfoAfterAccept.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/send_otp_to_complete_wo_controller.dart';
import '../../../controller/send_otp_to_start_wo_controller.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../controller/verify_otp_to_complete_wo_controller.dart';
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
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpController;

  TextEditingController CommentController = TextEditingController();
  late GetWorkOrderListModel get_work_order_status1;
  late GetWorkOrderListModel get_work_order_status2;
  late GetWorkOrderListModel get_work_order_status3;
  late GetWorkOrderListModel get_work_order_status4;
  bool is_status1_work_list_load = false;
  bool is_status2_work_list_load = false;
  bool is_status3_work_list_load = false;
  bool is_status4_work_list_load = false;
  bool CalledApi = false;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _otpController = List.generate(6, (index) => TextEditingController());
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
                                                          style:
                                                              GoogleFonts.lato(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        Text(
                                                          "${get_work_order_status1.data?[index].asset.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Subject",
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
                                                          "${get_work_order_status1.data?[index].subject.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Location",
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
                                                          "${get_work_order_status1.data?[index].loc.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Description",
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
                                                          "${get_work_order_status1.data?[index].desc.toString()}",
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
                                            ),
                                            Container(
                                              // color: Colors.grey,
                                              height: 27.h,
                                              width: 30.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                                                        "${get_work_order_status1.data?[index].woStatus.toString()}",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.orange,
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                        "Assign Date",
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
                                                        "${get_work_order_status1.data?[index].woStatusDate.toString()}",
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
                                          ],
                                        ),
                                        if (get_work_order_status1
                                                .data![index].woStatusKey
                                                .toString() ==
                                            "2") ...[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 25.w,
                                                child: ElevatedButton(
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
                                                    var Work_id;
                                                    await getPref()
                                                        .then((value) {
                                                      value.setString(
                                                          KEYWORKID,
                                                          get_work_order_status1
                                                              .data?[index]
                                                              .workId
                                                              .toString());
                                                    });
                                                    await getPref()
                                                        .then((value) {
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
                                                            .all(Colors.grey),
                                                  ),
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Reject_WO_dialog(context, index);
                                                      },
                                                    );
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
                                          ),
                                        ] else ...[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 2.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 25.w,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
                                                              .all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Colors.blue
                                                                  .shade900),
                                                    ),
                                                    onPressed: () async {
                                                      send_otp_to_start_wo_controller().send_otp_to_start_wo_controller_method(get_work_order_status1.data![index].workId.toString());
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return wo_start_OTP_dialog(
                                                              context,index);
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "Start",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  child: Icon(
                                                    Icons.info_outline,
                                                    color: Colors.blue.shade900,
                                                    size: 26.sp,
                                                  ),
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => woDetailsAfterAccept(Tab_index1:index)),
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
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
                              color: appThemeColor,
                            ),
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
                                            WorkOrderDescriptionPage(Work_id: get_work_order_status2.data?[index].workId,
                                              list_index: index,),
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
                              color: appThemeColor,
                            ),
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
                                                          "${get_work_order_status3.data?[index].asset.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Subject",
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
                                                          "${get_work_order_status3.data?[index].subject.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Location",
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
                                                          "${get_work_order_status3.data?[index].loc.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Description",
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
                                                          "${get_work_order_status3.data?[index].desc.toString()}",
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
                                                        "${get_work_order_status3.data?[index].woStatus.toString()}",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.orange,
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                                FontWeight
                                                                    .w600),
                                                      )
                                                    ],
                                                  ),
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStateProperty
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
                                                      send_otp_to_complete_wo_controller()
                                                          .send_otp_to_complete_wo_controller_method(
                                                          get_work_order_status3
                                                              .data![index]
                                                              .workId
                                                              .toString());
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return complete_OTP_dialog2(
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
                              color: appThemeColor,
                            ),
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
                                                          "${get_work_order_status4.data?[index].asset.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Subject",
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
                                                          "${get_work_order_status4.data?[index].subject.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Location",
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
                                                          "${get_work_order_status4.data?[index].loc.toString()}",
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
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Description",
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
                                                          "${get_work_order_status4.data?[index].desc.toString()}",
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
                                                        "${get_work_order_status4.data?[index].woStatus.toString()}",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Colors.orange,
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
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
                                                        "Complete Date",
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
                                                        "${get_work_order_status4.data?[index].woStatusDate.toString()}",
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
                              color: appThemeColor,
                            ),
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
        .work_order_list_pending_controller_method(Work_order_status6);
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
                  padding: EdgeInsets.only(top: 3.h, left: 3.h, right: 3.h),
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
                        padding: EdgeInsets.only(left: 12.h, top: 3.h),
                        child: Row(
                          children: [
                            TextButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
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
                                      get_work_order_status3.data?[index].workId
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

  Widget Reject_WO_dialog(context, index) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 32.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.h, left: 3.h, right: 3.h),
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
                        cursorColor: appThemeColor,
                        controller: CommentController,
                        maxLength: 100,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: appThemeColor,
                                    width: 0.25.h),
                            ),
                            counterText: "",
                            suffixIcon: Icon(Icons.note_alt),
                            hintText: "Enter any comment"),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Are you sure you want to mark it as Reject?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.h, top: 3.h),
                        child: Row(
                          children: [
                            TextButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Reject',
                                style: TextStyle(
                                    fontSize: 10.sp, color: appThemeColor),
                              ),
                              onPressed: () async {
                                var Work_id;
                                await getPref()
                                    .then((value) {
                                  value.setString(
                                      KEYWORKID,
                                      get_work_order_status1
                                          .data?[index]
                                          .workId
                                          .toString());
                                });
                                await getPref()
                                    .then((value) {
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

  Widget wo_start_OTP_dialog(context,index) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OTP Verification",
                          style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              color: appThemeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "For confirmation please verify the otp send to the Client's Email.",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            5,
                            (index) {
                              return SizedBox(
                                width: 12.w,
                                height: 12.w,
                                child: TextField(
                                  cursorColor: appThemeColor,
                                  controller: _otpController[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1 && index < 5) {
                                      _focusNodes[index + 1].requestFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      _focusNodes[index - 1].requestFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp),
                                  decoration: InputDecoration(
                                      counterText: '',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appThemeColor,
                                              width: 0.25.h))),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 25.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    CalledApi == true;
                                  });
                                  var otp = _otpController[0].text.toString() +
                                      _otpController[1].text.toString() +
                                      _otpController[2].text.toString() +
                                      _otpController[3].text.toString() +
                                      _otpController[4].text.toString() +
                                      _otpController[5].text.toString();
                                  // RegisterOtpController()
                                  //     .registerOtpMethod(
                                  //     widget.emailID, otp, context, widget.fromPage)
                                  verify_otp_to_start_wo_controller().verify_otp_to_start_wo_controller_method(get_work_order_status1.data![index].workId.toString(),otp,context)
                                      .whenComplete(() => setState(
                                        () {
                                      CalledApi = false;
                                    },
                                  ),
                                  );
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                                child: CalledApi
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        "Verify",
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        // TextFormField(
                        //   controller: ReasonController,
                        //   maxLength: 100,
                        //   decoration: InputDecoration(counterStyle: GoogleFonts.rubik(fontSize: 10.sp,color: Colors.grey),
                        //       suffixIcon: Icon(Icons.note_alt),
                        //       border: UnderlineInputBorder(),
                        //       hintText: "Enter reason",
                        //       hintStyle: GoogleFonts.lato(fontWeight:FontWeight.w600,color: Colors.grey,fontSize: 12.sp)
                        //   ),
                        // ),
                        // SizedBox(height: 3.h),
                        // Center(
                        //   child: SizedBox(
                        //     height: 5.h,
                        //     width: 40.w,
                        //     child: ElevatedButton(
                        //       onPressed: () async {
                        //         await post_work_reason_controller()
                        //             .post_work_reason_controller_method(
                        //             get_work_order_status2
                        //                 .data![widget.Tab_index1].workId
                        //                 .toString(),
                        //             ReasonController.text,
                        //             context);
                        //         ReasonController.clear();
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: appThemeColor,
                        //         side: BorderSide.none,
                        //         shape: const StadiumBorder(),
                        //       ),
                        //       child: Text(
                        //         "Ask to callback",
                        //         style:  GoogleFonts.lato(
                        //             fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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

  Widget complete_OTP_dialog2(context,index) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "OTP Verification",
                          style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              color: appThemeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "For confirmation please verify the otp send to the Client's Email.",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, fontSize: 10.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            5,
                            (index) {
                              return SizedBox(
                                width: 12.w,
                                height: 12.w,
                                child: TextField(
                                  cursorColor: appThemeColor,
                                  controller: _otpController[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1 && index < 5) {
                                      _focusNodes[index + 1].requestFocus();
                                    } else if (value.isEmpty && index > 0) {
                                      _focusNodes[index - 1].requestFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp),
                                  decoration: InputDecoration(
                                      counterText: '',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: appThemeColor,
                                              width: 0.25.h))),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 25.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    CalledApi == true;
                                  });
                                  var otp = _otpController[0].text.toString() +
                                      _otpController[1].text.toString() +
                                      _otpController[2].text.toString() +
                                      _otpController[3].text.toString() +
                                      _otpController[4].text.toString() +
                                      _otpController[5].text.toString();
                                  verify_otp_to_complete_wo_controller()
                                      .verify_otp_to_complete_wo_controller_method(
                                      otp,
                                      get_work_order_status3.data![index].workId.toString(),context)
                                      .whenComplete(() => setState(
                                        () {
                                      CalledApi = false;
                                    },
                                  ));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                                child: CalledApi
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        "Verify",
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        // TextFormField(
                        //   controller: ReasonController,
                        //   maxLength: 100,
                        //   decoration: InputDecoration(counterStyle: GoogleFonts.rubik(fontSize: 10.sp,color: Colors.grey),
                        //       suffixIcon: Icon(Icons.note_alt),
                        //       border: UnderlineInputBorder(),
                        //       hintText: "Enter reason",
                        //       hintStyle: GoogleFonts.lato(fontWeight:FontWeight.w600,color: Colors.grey,fontSize: 12.sp)
                        //   ),
                        // ),
                        // SizedBox(height: 3.h),
                        // Center(
                        //   child: SizedBox(
                        //     height: 5.h,
                        //     width: 40.w,
                        //     child: ElevatedButton(
                        //       onPressed: () async {
                        //         await post_work_reason_controller()
                        //             .post_work_reason_controller_method(
                        //             get_work_order_status2
                        //                 .data![widget.Tab_index1].workId
                        //                 .toString(),
                        //             ReasonController.text,
                        //             context);
                        //         ReasonController.clear();
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: appThemeColor,
                        //         side: BorderSide.none,
                        //         shape: const StadiumBorder(),
                        //       ),
                        //       child: Text(
                        //         "Ask to callback",
                        //         style:  GoogleFonts.lato(
                        //             fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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
