import 'dart:convert';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../Services/ZegoLoginServices.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../controller/get_escalate_data_controller.dart';
import '../../../model/GetEscalateDataModel.dart';
import '../../../utils/helperMethods.dart';

class OrderDetailsTab extends StatefulWidget {
  var work_id;

  OrderDetailsTab({required this.work_id, super.key});

  @override
  State<OrderDetailsTab> createState() => _OrderDetailsTabState();
}

class _OrderDetailsTabState extends State<OrderDetailsTab> {
  TextEditingController inviteeController = TextEditingController();
  late GetEscalateDataModel get_SE_work_order_status2;
  bool is_status2_SE_work_list_load = false;


  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
  }

  @override
  Widget build(BuildContext context) {
    if (is_status2_SE_work_list_load) {
      settingDataForPostApiCall();
    }
    return Scaffold(
      body: is_status2_SE_work_list_load
          ? get_SE_work_order_status2.data != null
              ? ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
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
                    if (get_SE_work_order_status2
                        .data!.clientImages!.isNotEmpty) ...[
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
                        itemBuilder: (BuildContext context, int index,
                            int realIndex) {
                          String base64 = get_SE_work_order_status2
                              .data!.clientImages![index]
                              .toString();
                          Uint8List bytesImage =
                              const Base64Decoder().convert(base64);
                          return buildImageCarouselItem(bytesImage, index);
                        },
                      ),
                    ] else ...[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.sp),
                            color: Colors.grey.withOpacity(0.3)),
                        height: 25.h,
                        width: 80.h,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 40.sp,
                              ),
                              Text(
                                "Client photos not available !!",
                                style: GoogleFonts.lato(
                                    color: Colors.grey, fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                              fontWeight: FontWeight.w600),
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
                                              fontWeight: FontWeight.w600),
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
                                              fontWeight: FontWeight.w600),
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
                                              fontWeight: FontWeight.w600),
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
                                              fontWeight: FontWeight.w600),
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
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 8.h,
                            width: 100.w,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Video/Voice Call to Engineer",
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    sendCallButton(
                                      isVideoCall: false,
                                      inviteeUsersIDTextCtrl:
                                          inviteeController,
                                      onCallFinished:
                                          onSendCallInvitationFinished,
                                    ),
                                    sendCallButton(
                                      isVideoCall: true,
                                      inviteeUsersIDTextCtrl:
                                          inviteeController,
                                      onCallFinished:
                                          onSendCallInvitationFinished,
                                    ),
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
                )
          : Center(
              child: CircularProgressIndicator(
                color: appThemeColor,
              ),
            ),
    );
  }

  Widget buildImageCarouselItem(bytesImage, index) {
    return Stack(
      children: [
        Image.memory(
          bytesImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ],
    );
  }

  void get_SE_work_order_status2_method() async {
    get_SE_work_order_status2 = await get_escalate_data_controller()
        .get_escalate_data_controller_method(widget.work_id);
    inviteeController.text =
        get_SE_work_order_status2.data!.zegoUserId.toString();
    //  get_SE_work_order_status2.data[widget.index].zegoUserId;
    setState(() {
      is_status2_SE_work_list_load = true;
    });
  }

  void settingDataForPostApiCall() {
    MyZegoConst.callWorkId = get_SE_work_order_status2.data!.workId.toString();
    MyZegoConst.ENg_Zego_id =
        get_SE_work_order_status2.data!.zegoUserId.toString();
    MyZegoConst.SE_Zego_id = currentUser.id.toString();
  }
}
