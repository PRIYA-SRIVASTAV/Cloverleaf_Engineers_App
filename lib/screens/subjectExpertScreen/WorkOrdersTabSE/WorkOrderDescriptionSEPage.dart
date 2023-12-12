import 'dart:convert';
import 'dart:typed_data';
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
import '../../../utils/helperMethods.dart';
import 'DocumentListTile.dart';
import 'WoInfoPage.dart';

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

  List<String> images = [
    'assets/images/asset_1.png',
    'assets/images/asset_2.webp',
    'assets/images/asset_3.jpg',
    'assets/images/asset_4.jpg'
  ];
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
    get_SE_parts_list_data_method();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildImageCarouselItem(String imageUrl, int index) {
    return Stack(
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String base64 =
        "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";
    Uint8List bytesImage = const Base64Decoder().convert(base64);
    if (is_status2_SE_work_list_load) {
      settingDataForPostApiCall();
    }
    return DefaultTabController(
      length: 3,
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
                                      text: 'Summary Details',
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
                                                      child: Image.memory(
                                                          bytesImage),
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
                                    SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 2.h, right: 2.h, top: 2.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Photos",
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            CarouselSlider.builder(
                                              options: CarouselOptions(
                                                height: 20.h,
                                                autoPlay: true,
                                                autoPlayInterval:
                                                    Duration(seconds: 5),
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                pauseAutoPlayOnTouch: true,
                                                enlargeCenterPage: true,
                                                enableInfiniteScroll: true,
                                              ),
                                              itemCount: images.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index,
                                                      int realIndex) {
                                                final imageUrl = images[index];
                                                return images[index] == 0
                                                    ? Container(
                                                        height: 20.h,
                                                        width: 100.w,
                                                        color: Colors.grey,
                                                      )
                                                    : buildImageCarouselItem(
                                                        imageUrl, index);
                                              },
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            Text(
                                              "Escalate Reason",
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Card(
                                              elevation: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 5),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 8,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        width: double.infinity,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5.w),
                                                          child: Text(
                                                            "djcndkjcnkjdnxkjqswqwlksmqahhhhhhhxksajchsijdwksnjxshxgysgxysgvbxcfdghszbxgvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvwwwwwwwwygxhvxaghxhg",
                                                            style: GoogleFonts
                                                                .lato(
                                                                    fontSize:
                                                                        10.sp),
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
                                            Text(
                                              "Attachments",
                                              style: GoogleFonts.lato(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.h),
                                              child: isPermission
                                                  ? ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          documentList.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        var docData =
                                                            documentList[index];
                                                        return DocumentListTile(
                                                          fileUrl:
                                                              docData['url']!,
                                                          title:
                                                              docData['title']!,
                                                        );
                                                      },
                                                    )
                                                  : TextButton(
                                                      onPressed: () {
                                                        checkPermission();
                                                        if (isPermission ==
                                                            true) {
                                                          CircularProgressIndicator(
                                                            color:
                                                                appThemeColor,
                                                          );
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  woInfoPage(
                                                                      Tab1Index:
                                                                          widget
                                                                              .index),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 3.h,
                                                        width: 100.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Press to Allow Permission !!!",
                                                            style: GoogleFonts.lato(
                                                                fontSize: 10.sp,
                                                                color: Colors
                                                                    .blue
                                                                    .shade900),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
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
                                                        padding:
                                                        const EdgeInsets
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
                                                                        .data![
                                                                    i]
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
                                                                        .data![
                                                                    i]
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
                          child: CircularProgressIndicator(
                            color: appThemeColor,
                          ),
                        ),
                ),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ),
              ),
            ),
    );
  }

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await Get_SE_Work_Order_List_Controller()
        .SE_work_order_list_pending_controller_method(SE_Work_order_status2);
    get_SE_add_parts_list_method();
    inviteeController.text =
        get_SE_work_order_status2.data![widget.index].zegoUserId!;
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
    MyZegoConst.callWorkId =
        get_SE_work_order_status2.data![widget.index].workId.toString();
    MyZegoConst.ENg_Zego_id =
        get_SE_work_order_status2.data![widget.index].zegoUserId.toString();
    MyZegoConst.SE_Zego_id = currentUser.id.toString();
  }
}
