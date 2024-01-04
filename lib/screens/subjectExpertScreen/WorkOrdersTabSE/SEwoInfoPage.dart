import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/utils/helperMethods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_SE_Work_Order_List_Controller.dart';
import '../../../controller/get_escalate_data_controller.dart';
import '../../../model/GetEscalateDataModel.dart';
import '../../../model/SE_Work_order_model.dart';
import 'DocumentListTile.dart';

class SEwoInfoPage extends StatefulWidget {
  var Tab1Index;
  var Work_id;

  SEwoInfoPage({required this.Tab1Index, required this.Work_id, super.key});

  @override
  State<SEwoInfoPage> createState() => _SEwoInfoPageState();
}

class _SEwoInfoPageState extends State<SEwoInfoPage> {
  bool isPermission = false;
  var checkAllPermission = CheckPermission();

  checkPermission() async {
    var permission = await checkAllPermission.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  late GetEscalateDataModel get_SE_work_order_status2;
  bool is_status2_SE_work_list_load = false;
  var documentList = [
    {
      "id": "1",
      "title": "file video 1",
      "url": "https://download.samplelib.com/mp4/sample-30s.mp4"
    },
    {
      "id": "2",
      "title": "file video 2",
      "url": "https://download.samplelib.com/mp4/sample-20s.mp4"
    },
    {
      "id": "3",
      "title": "file video 3",
      "url": "https://download.samplelib.com/mp4/sample-15s.mp4"
    }
  ];

  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
    checkPermission();
  }

  Widget buildImageCarouselItem(bytesImage, index) {
    return Stack(
      children: [
        Image.memory(
          bytesImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          child: Container(
            height: 2.h,
            width: 15.w,
            color: appThemeColor,
            child: Center(
              child: get_SE_work_order_status2.data!.escalateWoData!
                          .beforeEscalateImage![index].type ==
                      2
                  ? Text(
                      "Before",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 10.sp),
                    )
                  : Text(
                      "Escalate",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 10.sp),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageCarouselItem2(bytesImage, index) {
    return Stack(
      children: [
        Image.network(
          bytesImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          child: Container(
            height: 2.h,
            width: 15.w,
            color: appThemeColor,
            child: Center(
              child: get_SE_work_order_status2.data!.escalateWoData!
                  .beforeEscalateImage![index].type ==
                  2
                  ? Text(
                "Before",
                style: GoogleFonts.lato(
                    color: Colors.white, fontSize: 10.sp),
              )
                  : Text(
                "Escalate",
                style: GoogleFonts.lato(
                    color: Colors.white, fontSize: 10.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.Tab1Index,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: appThemeColor,
          title: Text(
            "Work Order # ${widget.Work_id}",
            style: dashboardStyle,
          ),
        ),
        backgroundColor: appThemeColor,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
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
                        fontSize: 9.5.sp, fontWeight: FontWeight.w600),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: 'Order Details',
                      ),
                      Tab(
                        text: 'Summary Details',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 78.h,
                  width: 100.w,
                  child: TabBarView(
                    children: [
                      if (is_status2_SE_work_list_load == true) ...[
                        get_SE_work_order_status2.data != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  if (get_SE_work_order_status2.data!.clientImages!.isNotEmpty) ...[
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.photo_size_select_actual_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Client Photos",
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    CarouselSlider.builder(
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
                                      itemCount: get_SE_work_order_status2
                                          .data!.clientImages!.length,
                                      itemBuilder: (BuildContext context,
                                          int index, int realIndex) {
                                        String base64 =
                                            get_SE_work_order_status2
                                                .data!.clientImages![index]
                                                .toString();
                                        Uint8List bytesImage =
                                            const Base64Decoder()
                                                .convert(base64);
                                        return buildImageCarouselItem(
                                            bytesImage, index);
                                      },
                                    ),
                                  ] else ...[
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.photo_size_select_actual_outlined,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Text(
                                          "Client Photos",
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                          color: Colors.grey.withOpacity(0.3)),
                                      height: 25.h,
                                      width: 80.h,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.grey,
                                              size: 40.sp,
                                            ),
                                            Text(
                                              "Client photos not available !!",
                                              style: GoogleFonts.lato(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
                                                      get_SE_work_order_status2
                                                          .data!.assetName
                                                          .toString(),
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
                                                      get_SE_work_order_status2
                                                          .data!.subject
                                                          .toString(),
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
                                                      get_SE_work_order_status2
                                                          .data!.location
                                                          .toString(),
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
                                                    SizedBox(height: 0.5.h),
                                                    Text(
                                                      get_SE_work_order_status2
                                                          .data!.desc
                                                          .toString(),
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
                                                    get_SE_work_order_status2
                                                        .data!.woStatus
                                                        .toString(),
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
                                                    get_SE_work_order_status2
                                                        .data!.priority
                                                        .toString(),
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
                                                    get_SE_work_order_status2
                                                        .data!.category
                                                        .toString(),
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
                                    "${get_SE_work_order_status2.message.toString()}"),
                              ),
                      ] else ...[
                        Center(
                          child: CircularProgressIndicator(
                            color: appThemeColor,
                          ),
                        )
                      ],
                      if (is_status2_SE_work_list_load == true) ...[
                        get_SE_work_order_status2.data != null
                            ? ListView(
                                physics: AlwaysScrollableScrollPhysics(),
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.photo_size_select_actual_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Escalate Photos",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  if (get_SE_work_order_status2
                                      .data!
                                      .escalateWoData!
                                      .beforeEscalateImage!
                                      .isNotEmpty) ...[
                                    CarouselSlider.builder(
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
                                      itemCount: get_SE_work_order_status2
                                          .data!
                                          .escalateWoData!
                                          .beforeEscalateImage!
                                          .length,
                                      itemBuilder: (BuildContext context,
                                          int index, int realIndex) {
                                        var imageUrl = get_SE_work_order_status2
                                            .data!
                                            .escalateWoData!
                                            .beforeEscalateImage![index]
                                            .path
                                            .toString();
                                        return buildImageCarouselItem2(
                                            imageUrl, index);
                                      },
                                    ),
                                  ] else ...[
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.sp),
                                          color: Colors.grey.withOpacity(0.3)),
                                      height: 25.h,
                                      width: 80.h,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.grey,
                                              size: 40.sp,
                                            ),
                                            Text(
                                              "Escalated Photos not available !!",
                                              style: GoogleFonts.lato(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.report_problem_outlined,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Escalate Reason",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Card(
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              width: double.infinity,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                child: get_SE_work_order_status2
                                                            .data!
                                                            .comment![widget
                                                                .Tab1Index]
                                                            .commentType
                                                            .toString() ==
                                                        4
                                                    ? Text(
                                                        get_SE_work_order_status2
                                                            .data!
                                                            .comment![widget
                                                                .Tab1Index]
                                                            .comment
                                                            .toString(),
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp),
                                                      )
                                                    : Text(
                                                        "Reason not available !!",
                                                        style: GoogleFonts.lato(
                                                            color: Colors.grey,
                                                            fontSize: 10.sp),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.drive_file_move_rtl_sharp,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                        "Escalate Files",
                                        style: GoogleFonts.lato(
                                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.h),
                                      child: get_SE_work_order_status2
                                              .data!
                                              .escalateWoData!
                                              .escalateFile!
                                              .isNotEmpty
                                          ? isPermission
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      get_SE_work_order_status2
                                                          .data!
                                                          .escalateWoData!
                                                          .escalateFile!
                                                          .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return DocumentListTile(
                                                      fileUrl:
                                                          get_SE_work_order_status2
                                                              .data!
                                                              .escalateWoData!
                                                              .escalateFile![
                                                                  index]
                                                              .path!
                                                              .toString(),
                                                      title:
                                                          get_SE_work_order_status2
                                                              .data!
                                                              .escalateWoData!
                                                              .escalateFile![
                                                                  index]
                                                              .name!
                                                              .toString(),
                                                    );
                                                  },
                                                )
                                              : TextButton(
                                                  onPressed: () {
                                                    checkPermission();
                                                    if (isPermission == true) {
                                                      CircularProgressIndicator(
                                                        color: appThemeColor,
                                                      );
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              SEwoInfoPage(
                                                            Tab1Index: widget
                                                                .Tab1Index,
                                                            Work_id:
                                                                get_SE_work_order_status2
                                                                    .data!
                                                                    .workId
                                                                    .toString(),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Container(
                                                    height: 3.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Press to Allow Permission !!!",
                                                        style: GoogleFonts.lato(
                                                            fontSize: 10.sp,
                                                            color: Colors
                                                                .blue.shade900),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                          : Row(
                                              children: [
                                                Text(
                                                  "No escalated file available !!",
                                                  style: GoogleFonts.lato(
                                                      color: Colors.grey),
                                                ),
                                                Icon(
                                                  Icons.not_interested,
                                                  color: Colors.red,
                                                )
                                              ],
                                            )),
                                  SizedBox(
                                    height: 4.h,
                                  )
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

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await get_escalate_data_controller()
        .get_escalate_data_controller_method(widget.Work_id);
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }
}
