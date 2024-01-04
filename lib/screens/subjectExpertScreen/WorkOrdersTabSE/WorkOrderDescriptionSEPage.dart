import 'dart:convert';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/constant/prefsConstant.dart';
import 'package:cloverleaf_project/controller/get_escalate_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Services/ZegoLoginServices.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_Add_Parts_list_controller.dart';
import '../../../model/GetAddPartsListModel.dart';
import '../../../model/GetEscalateDataModel.dart';
import '../../../utils/helperMethods.dart';
import 'DocumentListTile.dart';
import 'OrderDetailsTab.dart';
import 'PartsUsedTab.dart';
import 'SummaryTab.dart';

class WorkOrderDescriptionSEpage extends StatefulWidget {
  var work_id;
  var Index;

  WorkOrderDescriptionSEpage(
      {required this.Index, required this.work_id, super.key});

  @override
  State<WorkOrderDescriptionSEpage> createState() =>
      _WorkOrderDescriptionSEpageState();
}

class _WorkOrderDescriptionSEpageState
    extends State<WorkOrderDescriptionSEpage> {
  late GetEscalateDataModel get_SE_work_order_status2;
  late GetAddPartsListModel get_SE_add_parts_list;
  bool is_status2_SE_work_list_load = false;
  bool is_load_SE_add_parts_list = false;

  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: is_status2_SE_work_list_load
          ? SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  title: Text(
                    "Work Order # ${get_SE_work_order_status2.data!.workId}",
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
                                      text: 'Order Details',
                                    ),
                                    Tab(
                                      text: 'Summary',
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
                                    OrderDetailsTab(
                                      work_id: widget.work_id,
                                    ),
                                    SummaryTab(
                                      index: widget.Index,
                                      work_id: get_SE_work_order_status2
                                          .data!.workId
                                          .toString(),
                                    ),
                                    PartsUsedTab(
                                      work_id: get_SE_work_order_status2
                                          .data!.workId
                                          .toString(),
                                    ),
                                    // if (is_status2_SE_work_list_load == true) ...[
                                    //   get_SE_work_order_status2.data != null
                                    //       ? ListView(
                                    //           physics:
                                    //               NeverScrollableScrollPhysics(),
                                    //           shrinkWrap: true,
                                    //           children: [
                                    //             Row(
                                    //               children: [
                                    //                 Icon(
                                    //                   Icons
                                    //                       .photo_size_select_actual_outlined,
                                    //                   color: Colors.black,
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 1.w,
                                    //                 ),
                                    //                 Text(
                                    //                   "Client Photos",
                                    //                   style: GoogleFonts.lato(
                                    //                       fontSize: 12.sp,
                                    //                       fontWeight:
                                    //                           FontWeight.w600),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             SizedBox(
                                    //               height: 2.h,
                                    //             ),
                                    //             if (get_SE_work_order_status2
                                    //                 .data!
                                    //                 .clientImages!
                                    //                 .isNotEmpty) ...[
                                    //               CarouselSlider.builder(
                                    //                 options: CarouselOptions(
                                    //                   height: 20.h,
                                    //                   autoPlay: true,
                                    //                   autoPlayInterval:
                                    //                       Duration(seconds: 5),
                                    //                   autoPlayAnimationDuration:
                                    //                       Duration(
                                    //                           milliseconds:
                                    //                               800),
                                    //                   pauseAutoPlayOnTouch:
                                    //                       true,
                                    //                   enlargeCenterPage: true,
                                    //                   enableInfiniteScroll:
                                    //                       true,
                                    //                 ),
                                    //                 itemCount:
                                    //                     get_SE_work_order_status2
                                    //                         .data!
                                    //                         .clientImages!
                                    //                         .length,
                                    //                 itemBuilder:
                                    //                     (BuildContext context,
                                    //                         int index,
                                    //                         int realIndex) {
                                    //                   String base64 =
                                    //                       get_SE_work_order_status2
                                    //                           .data!
                                    //                           .clientImages![
                                    //                               index]
                                    //                           .toString();
                                    //                   Uint8List bytesImage =
                                    //                       const Base64Decoder()
                                    //                           .convert(base64);
                                    //                   return buildImageCarouselItem(
                                    //                       bytesImage, index);
                                    //                 },
                                    //               ),
                                    //             ] else ...[
                                    //               Container(
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(
                                    //                                 12.sp),
                                    //                     color: Colors.grey
                                    //                         .withOpacity(0.3)),
                                    //                 height: 25.h,
                                    //                 width: 80.h,
                                    //                 child: Center(
                                    //                   child: Column(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                     children: [
                                    //                       Icon(
                                    //                         Icons
                                    //                             .image_not_supported_outlined,
                                    //                         color: Colors.grey,
                                    //                         size: 40.sp,
                                    //                       ),
                                    //                       Text(
                                    //                         "Client photos not available !!",
                                    //                         style: GoogleFonts
                                    //                             .lato(
                                    //                                 color: Colors
                                    //                                     .grey,
                                    //                                 fontSize:
                                    //                                     12.sp),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //             SizedBox(
                                    //               height: 1.h,
                                    //             ),
                                    //             Padding(
                                    //               padding: const EdgeInsets.all(
                                    //                   12.0),
                                    //               child: Column(
                                    //                 children: [
                                    //                   Row(
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .spaceBetween,
                                    //                     children: [
                                    //                       Expanded(
                                    //                         child: Container(
                                    //                           height: 30.h,
                                    //                           width: 35.w,
                                    //                           child: Column(
                                    //                             mainAxisAlignment:
                                    //                                 MainAxisAlignment
                                    //                                     .spaceBetween,
                                    //                             crossAxisAlignment:
                                    //                                 CrossAxisAlignment
                                    //                                     .start,
                                    //                             children: [
                                    //                               Column(
                                    //                                 crossAxisAlignment:
                                    //                                     CrossAxisAlignment
                                    //                                         .start,
                                    //                                 children: [
                                    //                                   Text(
                                    //                                     "Asset Name",
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             12.sp,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   ),
                                    //                                   SizedBox(
                                    //                                     height:
                                    //                                         0.5.h,
                                    //                                   ),
                                    //                                   Text(
                                    //                                     get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .assetName
                                    //                                         .toString(),
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             10.sp,
                                    //                                         color: Colors.grey,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   )
                                    //                                 ],
                                    //                               ),
                                    //                               Column(
                                    //                                 crossAxisAlignment:
                                    //                                     CrossAxisAlignment
                                    //                                         .start,
                                    //                                 children: [
                                    //                                   Text(
                                    //                                     "Subject",
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             12.sp,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   ),
                                    //                                   SizedBox(
                                    //                                     height:
                                    //                                         0.5.h,
                                    //                                   ),
                                    //                                   Text(
                                    //                                     get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .subject
                                    //                                         .toString(),
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             10.sp,
                                    //                                         color: Colors.grey,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   )
                                    //                                 ],
                                    //                               ),
                                    //                               Column(
                                    //                                 crossAxisAlignment:
                                    //                                     CrossAxisAlignment
                                    //                                         .start,
                                    //                                 children: [
                                    //                                   Text(
                                    //                                     "Location",
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             12.sp,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   ),
                                    //                                   SizedBox(
                                    //                                     height:
                                    //                                         0.5.h,
                                    //                                   ),
                                    //                                   Text(
                                    //                                     get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .location
                                    //                                         .toString(),
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             10.sp,
                                    //                                         color: Colors.grey,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   )
                                    //                                 ],
                                    //                               ),
                                    //                               Column(
                                    //                                 crossAxisAlignment:
                                    //                                     CrossAxisAlignment
                                    //                                         .start,
                                    //                                 children: [
                                    //                                   Text(
                                    //                                     "Description",
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             12.sp,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   ),
                                    //                                   SizedBox(
                                    //                                       height:
                                    //                                           0.5.h),
                                    //                                   Text(
                                    //                                     get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .desc
                                    //                                         .toString(),
                                    //                                     style: GoogleFonts.lato(
                                    //                                         fontSize:
                                    //                                             10.sp,
                                    //                                         color: Colors.grey,
                                    //                                         fontWeight: FontWeight.w600),
                                    //                                   )
                                    //                                 ],
                                    //                               ),
                                    //                             ],
                                    //                           ),
                                    //                         ),
                                    //                       ),
                                    //                       Container(
                                    //                         height: 20.h,
                                    //                         width: 30.w,
                                    //                         child: Column(
                                    //                           mainAxisAlignment:
                                    //                               MainAxisAlignment
                                    //                                   .spaceBetween,
                                    //                           crossAxisAlignment:
                                    //                               CrossAxisAlignment
                                    //                                   .start,
                                    //                           children: [
                                    //                             Column(
                                    //                               crossAxisAlignment:
                                    //                                   CrossAxisAlignment
                                    //                                       .start,
                                    //                               children: [
                                    //                                 Text(
                                    //                                   "Status",
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 12
                                    //                                           .sp,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                   height:
                                    //                                       0.5.h,
                                    //                                 ),
                                    //                                 Text(
                                    //                                   get_SE_work_order_status2
                                    //                                       .data!
                                    //                                       .woStatus
                                    //                                       .toString(),
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 10
                                    //                                           .sp,
                                    //                                       color: Colors
                                    //                                           .orange,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 )
                                    //                               ],
                                    //                             ),
                                    //                             Column(
                                    //                               crossAxisAlignment:
                                    //                                   CrossAxisAlignment
                                    //                                       .start,
                                    //                               children: [
                                    //                                 Text(
                                    //                                   "Priority",
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 12
                                    //                                           .sp,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                   height:
                                    //                                       0.5.h,
                                    //                                 ),
                                    //                                 Text(
                                    //                                   get_SE_work_order_status2
                                    //                                       .data!
                                    //                                       .priority
                                    //                                       .toString(),
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 10
                                    //                                           .sp,
                                    //                                       color: Colors
                                    //                                           .red,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 )
                                    //                               ],
                                    //                             ),
                                    //                             Column(
                                    //                               crossAxisAlignment:
                                    //                                   CrossAxisAlignment
                                    //                                       .start,
                                    //                               children: [
                                    //                                 Text(
                                    //                                   "Category",
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 12
                                    //                                           .sp,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 ),
                                    //                                 SizedBox(
                                    //                                   height:
                                    //                                       0.5.h,
                                    //                                 ),
                                    //                                 Text(
                                    //                                   get_SE_work_order_status2
                                    //                                       .data!
                                    //                                       .category
                                    //                                       .toString(),
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize: 10
                                    //                                           .sp,
                                    //                                       color: Colors
                                    //                                           .grey,
                                    //                                       fontWeight:
                                    //                                           FontWeight.w600),
                                    //                                 )
                                    //                               ],
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: 1.h,
                                    //                   ),
                                    //                   Container(
                                    //                     height: 8.h,
                                    //                     width: 100.w,
                                    //                     child: Row(
                                    //                       mainAxisAlignment:
                                    //                           MainAxisAlignment
                                    //                               .spaceBetween,
                                    //                       children: [
                                    //                         Text(
                                    //                           "Video/Voice Call to Engineer",
                                    //                           style: GoogleFonts.lato(
                                    //                               fontSize:
                                    //                                   12.sp,
                                    //                               fontWeight:
                                    //                                   FontWeight
                                    //                                       .w600),
                                    //                         ),
                                    //                         Row(
                                    //                           children: [
                                    //                             sendCallButton(
                                    //                               isVideoCall:
                                    //                                   false,
                                    //                               inviteeUsersIDTextCtrl:
                                    //                                   inviteeController,
                                    //                               onCallFinished:
                                    //                                   onSendCallInvitationFinished,
                                    //                             ),
                                    //                             sendCallButton(
                                    //                               isVideoCall:
                                    //                                   true,
                                    //                               inviteeUsersIDTextCtrl:
                                    //                                   inviteeController,
                                    //                               onCallFinished:
                                    //                                   onSendCallInvitationFinished,
                                    //                             ),
                                    //                           ],
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //                   ),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         )
                                    //       : Center(
                                    //           child: Text(
                                    //               "${get_SE_work_order_status2.message.toString()}"),
                                    //         ),
                                    // ] else ...[
                                    //   Center(
                                    //     child: CircularProgressIndicator(
                                    //       color: appThemeColor,
                                    //     ),
                                    //   )
                                    // ],
                                    // if (is_status2_SE_work_list_load == true) ...[
                                    //   get_SE_work_order_status2.data != null
                                    //       ? ListView(
                                    //           physics:
                                    //               AlwaysScrollableScrollPhysics(),
                                    //           children: [
                                    //             SizedBox(
                                    //               height: 2.h,
                                    //             ),
                                    //             Row(
                                    //               children: [
                                    //                 Icon(
                                    //                   Icons
                                    //                       .photo_size_select_actual_outlined,
                                    //                   color: Colors.black,
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 1.w,
                                    //                 ),
                                    //                 Text(
                                    //                   "Escalate Photos",
                                    //                   style: GoogleFonts.lato(
                                    //                       fontSize: 12.sp,
                                    //                       fontWeight:
                                    //                           FontWeight.w600),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             SizedBox(
                                    //               height: 2.h,
                                    //             ),
                                    //             if (get_SE_work_order_status2
                                    //                 .data!
                                    //                 .escalateWoData!
                                    //                 .beforeEscalateImage!
                                    //                 .isNotEmpty) ...[
                                    //               CarouselSlider.builder(
                                    //                 options: CarouselOptions(
                                    //                   height: 20.h,
                                    //                   autoPlay: true,
                                    //                   autoPlayInterval:
                                    //                       Duration(seconds: 5),
                                    //                   autoPlayAnimationDuration:
                                    //                       Duration(
                                    //                           milliseconds:
                                    //                               800),
                                    //                   pauseAutoPlayOnTouch:
                                    //                       true,
                                    //                   enlargeCenterPage: true,
                                    //                   enableInfiniteScroll:
                                    //                       true,
                                    //                 ),
                                    //                 itemCount:
                                    //                     get_SE_work_order_status2
                                    //                         .data!
                                    //                         .escalateWoData!
                                    //                         .beforeEscalateImage!
                                    //                         .length,
                                    //                 itemBuilder:
                                    //                     (BuildContext context,
                                    //                         int index,
                                    //                         int realIndex) {
                                    //                   var imageUrl =
                                    //                       get_SE_work_order_status2
                                    //                           .data!
                                    //                           .escalateWoData!
                                    //                           .beforeEscalateImage![
                                    //                               index]
                                    //                           .path
                                    //                           .toString();
                                    //                   return buildImageCarouselItem2(
                                    //                       imageUrl, index);
                                    //                 },
                                    //               ),
                                    //             ] else ...[
                                    //               Container(
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius:
                                    //                         BorderRadius
                                    //                             .circular(
                                    //                                 12.sp),
                                    //                     color: Colors.grey
                                    //                         .withOpacity(0.3)),
                                    //                 height: 25.h,
                                    //                 width: 80.h,
                                    //                 child: Center(
                                    //                   child: Column(
                                    //                     mainAxisAlignment:
                                    //                         MainAxisAlignment
                                    //                             .center,
                                    //                     children: [
                                    //                       Icon(
                                    //                         Icons
                                    //                             .image_not_supported_outlined,
                                    //                         color: Colors.grey,
                                    //                         size: 40.sp,
                                    //                       ),
                                    //                       Text(
                                    //                         "Escalated Photos not available !!",
                                    //                         style: GoogleFonts
                                    //                             .lato(
                                    //                                 color: Colors
                                    //                                     .grey,
                                    //                                 fontSize:
                                    //                                     12.sp),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //             SizedBox(
                                    //               height: 4.h,
                                    //             ),
                                    //             Row(
                                    //               children: [
                                    //                 Icon(
                                    //                   Icons
                                    //                       .report_problem_outlined,
                                    //                   color: Colors.black,
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 1.w,
                                    //                 ),
                                    //                 Text(
                                    //                   "Escalate Reason",
                                    //                   style: GoogleFonts.lato(
                                    //                       fontSize: 12.sp,
                                    //                       fontWeight:
                                    //                           FontWeight.w600),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             SizedBox(
                                    //               height: 2.h,
                                    //             ),
                                    //             Card(
                                    //               elevation: 3,
                                    //               child: Padding(
                                    //                 padding: const EdgeInsets
                                    //                         .symmetric(
                                    //                     vertical: 8,
                                    //                     horizontal: 5),
                                    //                 child: Row(
                                    //                   children: [
                                    //                     Expanded(
                                    //                       flex: 8,
                                    //                       child: get_SE_work_order_status2.data!.comment!.isNotEmpty ? Container(
                                    //                         decoration:
                                    //                             BoxDecoration(
                                    //                           color:
                                    //                               Colors.white,
                                    //                           borderRadius:
                                    //                               BorderRadius
                                    //                                   .circular(
                                    //                                       10),
                                    //                         ),
                                    //                         width:
                                    //                             double.infinity,
                                    //                         child: Padding(
                                    //                           padding: EdgeInsets
                                    //                               .symmetric(
                                    //                                   horizontal:
                                    //                                       5.w),
                                    //                           child: get_SE_work_order_status2
                                    //                                       .data!
                                    //                                       .comment![widget.Index]
                                    //                                       .commentType == 4
                                    //                               ? Text(
                                    //                                   get_SE_work_order_status2
                                    //                                       .data!
                                    //                                       .comment![widget.Index]
                                    //                                       .comment
                                    //                                       .toString(),
                                    //                                   style: GoogleFonts.lato(
                                    //                                       fontSize:
                                    //                                           10.sp),
                                    //                                 )
                                    //                               : Text(
                                    //                                   "Reason not available !!",
                                    //                                   style: GoogleFonts.lato(
                                    //                                       color: Colors
                                    //                                           .grey,
                                    //                                       fontSize:
                                    //                                           10.sp),
                                    //                                 ),
                                    //                         ),
                                    //                       )
                                    //                           : Text(
                                    //                         "Reason not available !!",
                                    //                         style: GoogleFonts.lato(
                                    //                             color: Colors
                                    //                                 .grey,
                                    //                             fontSize:
                                    //                             10.sp),
                                    //                       ),
                                    //                     ),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 5.h,
                                    //             ),
                                    //             Row(
                                    //               children: [
                                    //                 Icon(
                                    //                   Icons
                                    //                       .drive_file_move_rtl_sharp,
                                    //                   color: Colors.black,
                                    //                 ),
                                    //                 SizedBox(
                                    //                   width: 1.w,
                                    //                 ),
                                    //                 Text(
                                    //                   "Escalate Files",
                                    //                   style: GoogleFonts.lato(
                                    //                       fontSize: 12.sp,
                                    //                       fontWeight:
                                    //                           FontWeight.w600),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //             SizedBox(
                                    //               height: 2.h,
                                    //             ),
                                    //             Padding(
                                    //                 padding:
                                    //                     EdgeInsets.symmetric(
                                    //                         horizontal: 2.h),
                                    //                 child:
                                    //                     get_SE_work_order_status2
                                    //                             .data!
                                    //                             .escalateWoData!
                                    //                             .escalateFile!
                                    //                             .isNotEmpty
                                    //                         ? /*isPermission
                                    //                             ?*/ ListView.builder(
                                    //                                 shrinkWrap:
                                    //                                     true,
                                    //                                 itemCount: get_SE_work_order_status2
                                    //                                     .data!
                                    //                                     .escalateWoData!
                                    //                                     .escalateFile!
                                    //                                     .length,
                                    //                                 itemBuilder:
                                    //                                     (BuildContext
                                    //                                             context,
                                    //                                         int index) {
                                    //                                   return DocumentListTile(
                                    //                                     fileUrl: get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .escalateWoData!
                                    //                                         .escalateFile![index]
                                    //                                         .path!
                                    //                                         .toString(),
                                    //                                     title: get_SE_work_order_status2
                                    //                                         .data!
                                    //                                         .escalateWoData!
                                    //                                         .escalateFile![index]
                                    //                                         .name!
                                    //                                         .toString(),
                                    //                                   );
                                    //                                 },
                                    //                               )
                                    //                             /*: TextButton(
                                    //                                 onPressed:
                                    //                                     () {
                                    //                                   checkPermission();
                                    //                                   if (isPermission ==
                                    //                                       true) {
                                    //                                     CircularProgressIndicator(
                                    //                                       color:
                                    //                                           appThemeColor,
                                    //                                     );
                                    //                                     // Navigator
                                    //                                     //     .push(
                                    //                                     //   context,
                                    //                                     //   MaterialPageRoute(
                                    //                                     //     builder: (context) =>
                                    //                                     //         SEwoInfoPage(
                                    //                                     //       Tab1Index: widget.Index,
                                    //                                     //       Work_id: get_SE_work_order_status2.data!.workId.toString(),
                                    //                                     //     ),
                                    //                                     //   ),
                                    //                                     // );
                                    //                                   }
                                    //                                 },
                                    //                                 child:
                                    //                                     Container(
                                    //                                   height:
                                    //                                       3.h,
                                    //                                   width:
                                    //                                       100.w,
                                    //                                   decoration:
                                    //                                       BoxDecoration(
                                    //                                     color: Colors
                                    //                                         .grey
                                    //                                         .shade300,
                                    //                                     borderRadius:
                                    //                                         BorderRadius.circular(12),
                                    //                                   ),
                                    //                                   child:
                                    //                                       Center(
                                    //                                     child:
                                    //                                         Text(
                                    //                                       "Press to Allow Permission !!!",
                                    //                                       style: GoogleFonts.lato(
                                    //                                           fontSize: 10.sp,
                                    //                                           color: Colors.blue.shade900),
                                    //                                     ),
                                    //                                   ),
                                    //                                 ),
                                    //                               )*/
                                    //                         : Row(
                                    //                             children: [
                                    //                               Text(
                                    //                                 "No escalated file available !!",
                                    //                                 style: GoogleFonts.lato(
                                    //                                     color: Colors
                                    //                                         .grey),
                                    //                               ),
                                    //                               Icon(
                                    //                                 Icons
                                    //                                     .not_interested,
                                    //                                 color: Colors
                                    //                                     .red,
                                    //                               )
                                    //                             ],
                                    //                           ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 4.h,
                                    //             )
                                    //           ],
                                    //         )
                                    //       : Center(
                                    //           child: Text(
                                    //               "${get_SE_work_order_status2.message.toString()}"),
                                    //         ),
                                    // ] else ...[
                                    //   Center(
                                    //     child: CircularProgressIndicator(
                                    //       color: appThemeColor,
                                    //     ),
                                    //   ),
                                    // ],
                                    // if (is_load_SE_add_parts_list == true) ...[
                                    //   if (get_SE_add_parts_list.data!.isNotEmpty) ...[
                                    //     SizedBox(
                                    //       height: 2.h,
                                    //     ),
                                    //     Padding(
                                    //       padding: const EdgeInsets.symmetric(
                                    //           vertical: 8, horizontal: 5),
                                    //       child: Row(
                                    //         children: [
                                    //           Expanded(
                                    //             flex: 3,
                                    //             child: Text(
                                    //               "Parts Id",
                                    //               style: GoogleFonts.lato(
                                    //                   fontWeight: FontWeight.w600,
                                    //                   fontSize: 12.sp),
                                    //             ),
                                    //           ),
                                    //           Expanded(
                                    //             flex: 4,
                                    //             child: Text(
                                    //               "Parts Name",
                                    //               style: GoogleFonts.lato(
                                    //                   fontWeight: FontWeight.w600,
                                    //                   fontSize: 12.sp),
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       height: 2.h,
                                    //     ),
                                    //     ListView.builder(
                                    //       shrinkWrap: true,
                                    //       physics: const ClampingScrollPhysics(),
                                    //       itemCount: get_SE_add_parts_list.data?.length,
                                    //       itemBuilder: (BuildContext context, i) {
                                    //         return Card(
                                    //           elevation: 3,
                                    //           child: Padding(
                                    //             padding: EdgeInsets.symmetric(
                                    //                 vertical: 2.h, horizontal: 1.h),
                                    //             child: Row(
                                    //               children: [
                                    //                 Expanded(
                                    //                   flex: 3,
                                    //                   child: Text(
                                    //                     get_SE_add_parts_list.data![i].partsId
                                    //                         .toString(),
                                    //                     style: GoogleFonts.rubik(
                                    //                         fontSize: 10.sp),
                                    //                   ),
                                    //                 ),
                                    //                 Expanded(
                                    //                   flex: 4,
                                    //                   child: Text(
                                    //                     get_SE_add_parts_list
                                    //                         .data![i].partsName
                                    //                         .toString(),
                                    //                     style: GoogleFonts.rubik(
                                    //                         fontSize: 10.sp),
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ] else ...[
                                    //     Container(
                                    //       height: 55.h,
                                    //       child: Center(
                                    //         child: Text(
                                    //           "${get_SE_add_parts_list.message.toString()}",
                                    //           style: GoogleFonts.lato(color: Colors.red),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ] else ...[
                                    //   Center(
                                    //     child: CircularProgressIndicator(
                                    //       color: appThemeColor,
                                    //     ),
                                    //   ),
                                    // ],
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
                appBar: AppBar(
                  elevation: 0.0,
                  title: Text(
                    "Work Order # ",
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
    get_SE_work_order_status2 = await get_escalate_data_controller()
        .get_escalate_data_controller_method(widget.work_id);
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }
}
