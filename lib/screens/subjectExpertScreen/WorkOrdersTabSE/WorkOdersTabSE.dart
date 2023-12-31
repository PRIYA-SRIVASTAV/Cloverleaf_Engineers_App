import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:cloverleaf_project/controller/Get_SE_Work_Order_List_Controller.dart';
import 'package:cloverleaf_project/controller/SE_update_wo_status_controller.dart';
import 'package:cloverleaf_project/screens/subjectExpertScreen/DrawerSE/DrawerSE.dart';
import 'package:cloverleaf_project/screens/subjectExpertScreen/WorkOrdersTabSE/WorkOrderDescriptionSEPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../model/SE_Work_order_model.dart';
import '../../../utils/helperMethods.dart';


class WorkOrderSE extends StatefulWidget {
  var TabIndex;

  WorkOrderSE({required this.TabIndex, super.key});

  @override
  State<WorkOrderSE> createState() => _WorkOrderSEState();
}

class _WorkOrderSEState extends State<WorkOrderSE> {
  late GetSeWorkOrderListModel get_SE_work_order_status1;
  late GetSeWorkOrderListModel get_SE_work_order_status2;
  late GetSeWorkOrderListModel get_SE_work_order_status3;
  bool is_status1_SE_work_list_load = false;
  bool is_status2_SE_work_list_load = false;
  bool is_status3_SE_work_list_load = false;

  @override
  void initState() {
    super.initState();
    get_SE_work_order_status1_method();
    get_SE_work_order_status2_method();
    get_SE_work_order_status3_method();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        drawer: const AppDrawerSE(),
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
            child: Column(
              children: [
                Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.h),
                  ),
                  child: TabBar(
                    labelStyle:
                        TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25.h),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: 'Unaccepted',
                      ),
                      Tab(
                        text: 'Ongoing',
                      ),
                      Tab(
                        text: 'Completed',
                      ),
                    ],
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
                      if (is_status1_SE_work_list_load == true) ...[
                        if (get_SE_work_order_status1.data.isNotEmpty) ...[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: get_SE_work_order_status1.data.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 40.h,
                                child: Card(
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
                                              "Work-id #${get_SE_work_order_status1.data[index].workId.toString()}",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status1
                                                              .data[index].asset
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status1
                                                              .data[index]
                                                              .subject
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status1
                                                              .data[index].loc
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Engineer name",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status1.data[index].assignedEngineerName.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // color: Colors.grey,
                                              height: 20.h,
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
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        get_SE_work_order_status1
                                                            .data[index]
                                                            .woStatus
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.red),
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
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        get_SE_work_order_status1
                                                            .data[index]
                                                            .priority
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.orange),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Engineer id",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                       get_SE_work_order_status1.data[index].assignedEngineerId.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.red),
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
                                              width: 35.w,
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
                                                        get_SE_work_order_status1
                                                            .data[index].workId
                                                            .toString());
                                                  });
                                                  await getPref().then((value) {
                                                    Work_id = value
                                                        .getString(KEYWORKID);
                                                  });
                                                  print(
                                                      "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                                  SE_update_wo_status_Controller().SE_update_wo_status_accepted_Controller_method(Work_id, context);
                                                  get_SE_work_order_status1_method();
                                                },
                                                child: Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 35.w,
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
                                                        get_SE_work_order_status1
                                                            .data[index].workId
                                                            .toString());
                                                  });
                                                  await getPref().then((value) {
                                                    Work_id = value
                                                        .getString(KEYWORKID);
                                                  });
                                                  print(
                                                      "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                                  SE_update_wo_status_Controller().SE_update_wo_status_Rejected_Controller_method(Work_id, context);
                                                  get_SE_work_order_status1_method();
                                                },
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
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
                                "${get_SE_work_order_status1.message.toString()}"),
                          ),
                        ],
                      ] else ...[
                        Center(
                          child: CircularProgressIndicator(
                            color: appThemeColor,
                          ),
                        )
                      ],
                      if (is_status2_SE_work_list_load == true) ...[
                        if (get_SE_work_order_status2.data.isNotEmpty) ...[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: get_SE_work_order_status2.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WorkOrderDescriptionSEpage(
                                              index: index),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 35.h,
                                  child: Card(
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
                                                "Work-id #${get_SE_work_order_status2.data[index].workId.toString()}",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold),
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
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          Text(
                                                            get_SE_work_order_status2
                                                                .data[index].asset
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color:
                                                                Colors.grey),
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
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          Text(
                                                            get_SE_work_order_status2
                                                                .data[index]
                                                                .subject
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color:
                                                                Colors.grey),
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
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          Text(
                                                            get_SE_work_order_status2
                                                                .data[index].loc
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color:
                                                                Colors.grey),
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            "Engineer name",
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          Text(
                                                            get_SE_work_order_status2.data[index].assignedEngineerName.toString(),
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color:
                                                                Colors.grey),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // color: Colors.grey,
                                                height: 20.h,
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status2
                                                              .data[index]
                                                              .woStatus
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: Colors.red),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status2
                                                              .data[index]
                                                              .priority
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                              Colors.orange),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          "Engineer id",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status2.data[index].assignedEngineerId.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color: Colors.red),
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
                                ),
                              );
                            },
                          ),
                        ] else ...[
                          Center(
                            child: Text(
                              "${get_SE_work_order_status2.message.toString()}",
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
                      if (is_status3_SE_work_list_load == true) ...[
                        if (get_SE_work_order_status3.data.isNotEmpty) ...[
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: get_SE_work_order_status3.data.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                height: 35.h,
                                child: Card(
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
                                              "Work-id #${get_SE_work_order_status3.data[index].workId.toString()}",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status3
                                                              .data[index].asset
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                              Colors.grey),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status3
                                                              .data[index]
                                                              .subject
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                              Colors.grey),
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
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status3
                                                              .data[index].loc
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                              Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          "Engineer name",
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        Text(
                                                          get_SE_work_order_status3.data[index].assignedEngineerName.toString(),
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                              Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // color: Colors.grey,
                                              height: 20.h,
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
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      Text(
                                                        get_SE_work_order_status3
                                                            .data[index]
                                                            .woStatus
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.red),
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
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      Text(
                                                        get_SE_work_order_status3
                                                            .data[index]
                                                            .priority
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                            Colors.orange),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "Engineer id",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      Text(
                                                        get_SE_work_order_status3.data[index].assignedEngineerId.toString(),
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color: Colors.red),
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
                              "${get_SE_work_order_status3.message.toString()}",
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
    );
  }

  void get_SE_work_order_status1_method() async {
    get_SE_work_order_status1 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_unaccepted_controller_method(SE_Work_order_status1);
    setState(() {
      is_status1_SE_work_list_load = true;
    });
  }

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_pending_controller_method(SE_Work_order_status2);
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }

  void get_SE_work_order_status3_method() async {
    get_SE_work_order_status3 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_completed_controller_method(SE_Work_order_status3);
    setState(() {
      is_status3_SE_work_list_load = true;
    });
  }
}
