import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/get_Work_order_details_controller.dart';
import '../../../controller/send_otp_to_start_wo_controller.dart';
import '../../../controller/verify_otp_to_start_wo_controller.dart';
import '../../../model/GetWorkorderdetailsModel.dart';

class woDetailsAfterAccept extends StatefulWidget {
  var work_id;
  var Index;

  woDetailsAfterAccept({required this.work_id, required this.Index, super.key});

  @override
  State<woDetailsAfterAccept> createState() => _woDetailsAfterAcceptState();
}

class _woDetailsAfterAcceptState extends State<woDetailsAfterAccept> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpController;
  TextEditingController ReasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  bool is_status1_work_list_load = false;
  late GetWorkorderdetailsModel get_work_order_status1;
  bool CalledApi = false;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _otpController = List.generate(6, (index) => TextEditingController());
    get_work_order_status1_method();
  }

  @override
  Widget build(BuildContext context) {
    return is_status1_work_list_load
        ? Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                "Work Order # ${get_work_order_status1.data!.workId.toString()}",
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
                        get_work_order_status1.data != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  if (get_work_order_status1
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
                                      itemCount: get_work_order_status1
                                          .data!.clientImages!.length,
                                      itemBuilder: (BuildContext context,
                                          int index, int realIndex) {
                                        String base64 = get_work_order_status1
                                            .data!.clientImages![index]
                                            .toString();
                                        Uint8List bytesImage =
                                            const Base64Decoder()
                                                .convert(base64);
                                        return buildImageCarouselItem(
                                            bytesImage, index);
                                      },
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
                                                      "${get_work_order_status1.data!.assetName.toString()}",
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
                                                      "${get_work_order_status1.data!.subject.toString()}",
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
                                                      "${get_work_order_status1.data!.location.toString()}",
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
                                                      "${get_work_order_status1.data!.desc.toString()}",
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
                                                    "${get_work_order_status1.data!.woStatus.toString()}",
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
                                                    "${get_work_order_status1.data!.priority.toString()}",
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
                                                    "${get_work_order_status1.data!.category.toString()}",
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      SizedBox(
                                        width: 25.w,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue.shade900),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return wo_start_OTP_dialog(
                                                    context, widget.Index);
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Start",
                                            style: GoogleFonts.lato(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
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
              title: Text(
                "Work Order # ",
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
                height:90.h,
              ),
            ),
          );
  }

  void get_work_order_status1_method() async {
    get_work_order_status1 = await get_Work_order_details_controller()
        .get_Work_order_details_controller_method(widget.work_id);
    // get_add_parts_list_method();
    setState(() {
      is_status1_work_list_load = true;
    });
  }

  Widget buildImageCarouselItem(bytesImage, int index) {
    return Image.memory(
      bytesImage,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Widget wo_start_OTP_dialog(context, Index) {
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
                            (Index) {
                              return SizedBox(
                                width: 12.w,
                                height: 12.w,
                                child: TextField(
                                  cursorColor: appThemeColor,
                                  controller: _otpController[Index],
                                  focusNode: _focusNodes[Index],
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1 && Index < 5) {
                                      _focusNodes[Index + 1].requestFocus();
                                    } else if (value.isEmpty && Index > 0) {
                                      _focusNodes[Index - 1].requestFocus();
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.sp),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: appThemeColor, width: 0.25.h),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                send_otp_to_start_wo_controller()
                                    .send_otp_to_start_wo_controller_method(
                                        get_work_order_status1.data!.workId
                                            .toString());
                              },
                              child: Text(
                                "Get Otp",
                                style: GoogleFonts.lato(
                                    color: Colors.blue.shade900,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
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
                                  verify_otp_to_start_wo_controller()
                                      .verify_otp_to_start_wo_controller_method(
                                          get_work_order_status1.data!.workId
                                              .toString(),
                                          otp,
                                          context)
                                      .whenComplete(
                                        () => setState(
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
