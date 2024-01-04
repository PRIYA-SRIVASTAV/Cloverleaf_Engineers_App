import 'dart:convert';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../controller/get_Work_order_details_controller.dart';
import '../../../controller/send_otp_to_complete_wo_controller.dart';
import '../../../controller/verify_otp_to_complete_wo_controller.dart';
import '../../../model/GetWorkorderdetailsModel.dart';
import 'WoEscalateToSEPage.dart';
import 'getTechnicianSummary.dart';

class Tab1_WO_Desc extends StatefulWidget {
  Tab1_WO_Desc({required this.Tab_index1, required this.Work_id, super.key});

  var Work_id;
  var Tab_index1;

  @override
  State<Tab1_WO_Desc> createState() => _Tab1_WO_DescState();
}

class _Tab1_WO_DescState extends State<Tab1_WO_Desc> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpController;
  bool CalledApi = false;
  TextEditingController commentController = TextEditingController();
  bool is_status2_work_list_load = false;
  late GetWorkorderdetailsModel get_work_order_status2;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _otpController = List.generate(6, (index) => TextEditingController());
    get_work_order_status2_method();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
        child: is_status2_work_list_load
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    get_work_order_status2.data != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (get_work_order_status2
                                  .data!.clientImages!.isNotEmpty) ...[
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
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
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
                                  itemCount: get_work_order_status2
                                      .data!.clientImages!.length,
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    String base64 = get_work_order_status2
                                        .data!.clientImages![index]
                                        .toString();
                                    Uint8List bytesImage =
                                        const Base64Decoder().convert(base64);
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
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
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
                                          Icons.image_not_supported_outlined,
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
                                height:3.h,
                              ),
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
                                                "${get_work_order_status2.data!.assetName.toString()}",
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
                                                "${get_work_order_status2.data!.subject.toString()}",
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
                                                "${get_work_order_status2.data!.location.toString()}",
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
                                                "${get_work_order_status2.data!.desc.toString()}",
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
                                              "${get_work_order_status2.data!.woStatus.toString()}",
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
                                              "${get_work_order_status2.data!.priority.toString()}",
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
                                              "${get_work_order_status2.data!.category.toString()}",
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
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          getTechnicianSummary(
                                              Work_id: get_work_order_status2
                                                  .data?.workId
                                                  .toString()),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 5.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appThemeColor.withOpacity(0.2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Update technician summary & images',
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          size: 20.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 17.h,
                                width: 60.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Support required",
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: 26.w,
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
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WoEscalateToSEPage(
                                                    work_id:
                                                        get_work_order_status2
                                                            .data!.workId
                                                            .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              "Escalate",
                                              style: GoogleFonts.lato(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Want to mark it as complete ?",
                                          style: GoogleFonts.lato(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
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
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return OTP_dialog(context,
                                                      widget.Tab_index1);
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Complete",
                                              style: GoogleFonts.lato(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //color: Colors.grey,
                              )
                            ],
                          )
                        : Center(
                            child: Text(
                              "${get_work_order_status2.message.toString()}",
                              style: GoogleFonts.lato(color: Colors.red),
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
    );
  }

  Widget buildImageCarouselItem(bytesImage, int index) {
    return Image.memory(
      bytesImage,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Widget OTP_dialog(context, Tab_index1) {
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
                              onTap: () async {
                                send_otp_to_complete_wo_controller()
                                    .send_otp_to_complete_wo_controller_method(
                                        get_work_order_status2.data!.workId
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
                                  verify_otp_to_complete_wo_controller()
                                      .verify_otp_to_complete_wo_controller_method(
                                          otp,
                                          get_work_order_status2.data!.workId
                                              .toString(),
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

  void get_work_order_status2_method() async {
    get_work_order_status2 = await get_Work_order_details_controller()
        .get_Work_order_details_controller_method(widget.Work_id);
    // get_add_parts_list_method();
    setState(() {
      is_status2_work_list_load = true;
    });
  }
}
