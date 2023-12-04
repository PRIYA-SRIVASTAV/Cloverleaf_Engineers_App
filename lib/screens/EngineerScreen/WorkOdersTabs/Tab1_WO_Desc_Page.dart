
import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../controller/post_work_reason_controller.dart';
import '../../../controller/send_otp_to_complete_wo_controller.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../controller/verify_otp_to_complete_wo_controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';
import '../../../utils/helperWidget.dart';

class Tab1_WO_Desc extends StatefulWidget {
  Tab1_WO_Desc({required this.Tab_index1, super.key});

  var Tab_index1;

  @override
  State<Tab1_WO_Desc> createState() => _Tab1_WO_DescState();
}

class _Tab1_WO_DescState extends State<Tab1_WO_Desc> {
  FilePickerResult? result;
  bool isExpanded1 = true;
  bool isExpanded2 = true;
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _otpController;
  bool CalledApi = false;
  TextEditingController ReasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController breakdownReasonController = TextEditingController();
  bool is_status2_work_list_load = false;
  late GetWorkOrderListModel get_work_order_status2;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(6, (index) => FocusNode());
    _otpController = List.generate(6, (index) => TextEditingController());
    get_work_order_status2_method();
  }

  void toggleContainerSize1() {
    setState(() {
      isExpanded1 = !isExpanded1;
    });
  }

  void toggleContainerSize2() {
    setState(() {
      isExpanded2 = !isExpanded2;
    });
  }

  File? profileImage;

  Future getProfileImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);
      if (profileImage == null) return;

      final profileImageTemporary = File(profileImage.path);

      setState(() {
        this.profileImage = profileImageTemporary;
      });
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 20.h,
            width: 50.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/3135715.png"),
              ),
            ),
          )
        : Container(
            height: 30.h,
            width: 60.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                profileImage!,
                fit: BoxFit.cover,
              ),
            ),
          );
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
                    get_work_order_status2.data!.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
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
                                items: [
                                  Container(
                                    height: 20.h,
                                    width: double.infinity,
                                    color: Colors.grey.withOpacity(0.3),
                                    child: Image.asset(
                                        "assets/images/asset_1.png"),
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: double.infinity,
                                    color: Colors.grey.withOpacity(0.3),
                                    child: Image.asset(
                                        "assets/images/asset_2.webp"),
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: double.infinity,
                                    color: Colors.grey.withOpacity(0.3),
                                    child: Image.asset(
                                        "assets/images/asset_3.jpg"),
                                  ),
                                  Container(
                                    height: 20.h,
                                    width: double.infinity,
                                    color: Colors.grey.withOpacity(0.3),
                                    child: Image.asset(
                                        "assets/images/asset_4.jpg"),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      getProfileImage(ImageSource.camera);
                                    },
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: appThemeColor,
                                      size: 30.sp,
                                    ),
                                  ),
                                  Text(
                                    "|",
                                    style: GoogleFonts.lato(
                                        color: Colors.black,
                                        fontSize: 35.sp,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text("Upload image", style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight:
                                      FontWeight.w600)
                                  // Container(
                                  //   height: 6.h,
                                  //   width:6.h,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(8.sp),
                                  //     // color: Colors.red,
                                  //     border: Border.all(color: appThemeColor),
                                  //   ),
                                  //   child: Image.asset(
                                  //       "assets/images/asset_1.png"),
                                  // ),
                                  // SizedBox(
                                  //   width: 0.5.h,
                                  // ),
                                  // Container(
                                  //   height: 6.h,
                                  //   width: 6.h,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(8.sp),
                                  //     // color: Colors.red,
                                  //     border: Border.all(color: appThemeColor),
                                  //   ),
                                  //   child: Image.asset(
                                  //       "assets/images/asset_2.webp"),
                                  // ),
                                  // SizedBox(
                                  //   width: 0.5.h,
                                  // ),
                                  // Container(
                                  //   height: 6.h,
                                  //   width: 6.h,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(8.sp),
                                  //     // color: Colors.red,
                                  //     border: Border.all(color: appThemeColor),
                                  //   ),
                                  //   child: Image.asset(
                                  //       "assets/images/asset_3.jpg"),
                                  // ),
                                  // SizedBox(
                                  //   width: 0.5.h,
                                  // ),
                                  // Container(
                                  //   height: 6.h,
                                  //   width: 6.h,
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(8.sp),
                                  //     // color: Colors.red,
                                  //     border: Border.all(color: appThemeColor),
                                  //   ),
                                  //   child: Image.asset(
                                  //       "assets/images/asset_4.jpg"),
                                  // ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
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
                                                "${get_work_order_status2.data![widget.Tab_index1].asset.toString()}",
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
                                                "${get_work_order_status2.data![widget.Tab_index1].subject.toString()}",
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
                                                "${get_work_order_status2.data![widget.Tab_index1].loc.toString()}",
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
                                                "${get_work_order_status2.data![widget.Tab_index1].desc.toString()}",
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
                                              "${get_work_order_status2.data![widget.Tab_index1].woStatus.toString()}",
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
                                              "${get_work_order_status2.data![widget.Tab_index1].priority.toString()}",
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
                                              "${get_work_order_status2.data![widget.Tab_index1].category.toString()}",
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
                              GestureDetector(
                                onTap: toggleContainerSize1,
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: appThemeColor.withOpacity(0.2),
                                  ),
                                  duration: Duration(milliseconds: 300),
                                  width: double.infinity,
                                  height: isExpanded1 ? 5.h : 45.h,
                                  child: isExpanded1
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Update technician summary',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Icon(
                                                Icons.arrow_right,
                                                size: 20.sp,
                                              )
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 4.h,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Update technician summary',
                                                      style: GoogleFonts.lato(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                      size: 20.sp,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                "Breakdown Reason",
                                                style: GoogleFonts.lato(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Container(
                                                height: 6.h,
                                                child: TextFormField(
                                                  cursorColor: appThemeColor,
                                                  onChanged: (value) {
                                                    // setState(() {
                                                    //   textValue = value;
                                                    // });
                                                  },
                                                  onTap: () {},
                                                  controller:
                                                      breakdownReasonController,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "select or enter breakdown reason",
                                                    hintStyle: GoogleFonts.lato(
                                                        fontSize: 10.sp,
                                                        color: Colors.grey),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: appThemeColor,
                                                          width: 0.5.w),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Text(
                                                "Hours spent by technician",
                                                style: GoogleFonts.lato(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 6.h,
                                                    width: 35.w,
                                                    child: TextFormField(
                                                      cursorColor:
                                                          appThemeColor,
                                                      onChanged: (value) {
                                                        // setState(() {
                                                        //   textValue = value;
                                                        // });
                                                      },
                                                      onTap: () {},
                                                      controller:
                                                          breakdownReasonController,
                                                      decoration:
                                                          InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  appThemeColor,
                                                              width: 0.5.w),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 6.h,
                                                    width: 35.w,
                                                    child: TextFormField(
                                                      cursorColor:
                                                          appThemeColor,
                                                      onChanged: (value) {
                                                        // setState(() {
                                                        //   textValue = value;
                                                        // });
                                                      },
                                                      onTap: () {},
                                                      controller:
                                                          breakdownReasonController,
                                                      decoration:
                                                          InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  appThemeColor,
                                                              width: 0.5.w),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  result = await FilePicker.platform.pickFiles(
                                                      allowMultiple: false,
                                                      type: FileType.custom,
                                                      allowedExtensions: allowedFiles);
                                                  if (result == null) {
                                                    log("No file selected");
                                                  } else {
                                                    setState(() {});
                                                    for (var element in result!.files) {
                                                      log(element.name);
                                                    }
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.file_present_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      "Attach files",
                                                      style: GoogleFonts.lato(
                                                          color: Colors.black,
                                                          fontSize: 12.sp),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Center(
                                                child: SizedBox(
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
                                                              .all(Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                    ),
                                                    onPressed: () async {
                                                      // var Work_id;
                                                      // await getPref().then((value) {
                                                      //   value.setString(
                                                      //       KEYWORKID,
                                                      //       get_SE_work_order_status1
                                                      //           .data?[index].workId
                                                      //           .toString());
                                                      // });
                                                      // await getPref().then((value) {
                                                      //   Work_id = value
                                                      //       .getString(KEYWORKID);
                                                      // });
                                                      // print(
                                                      //     "@@@@@@@@@@@@@@@@@@@ $Work_id");
                                                      // SE_update_wo_status_Controller()
                                                      //     .SE_update_wo_status_accepted_Controller_method(
                                                      //     Work_id, context);
                                                      // get_SE_work_order_status1_method();
                                                    },
                                                    child: Text(
                                                      "Save",
                                                      style: GoogleFonts.lato(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              ),
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
                                width: 40.h,
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
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Unable_to_solve_dialog(
                                                      context);
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Accelerate",
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
                                              send_otp_to_complete_wo_controller()
                                                  .send_otp_to_complete_wo_controller_method(
                                                      get_work_order_status2
                                                          .data![
                                                              widget.Tab_index1]
                                                          .workId
                                                          .toString());
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
                                "${get_work_order_status2.message.toString()}"),
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

  Widget Complete_WO_dialog() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 32.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 3.h, right: 3.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirmation",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: appThemeColor),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                          controller: commentController,
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
                          style: GoogleFonts.lato(fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h, top: 3.h),
                          child: Row(
                            children: [
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp, color: Colors.red),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Continue',
                                  style: GoogleFonts.lato(
                                      fontSize: 10.sp, color: appThemeColor),
                                ),
                                onPressed: () async {
                                  var Work_id;
                                  await getPref().then((value) {
                                    value.setString(
                                        KEYWORKID,
                                        get_work_order_status2
                                            .data![widget.Tab_index1].workId
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
        //   AlertDialog(
        //   title: Text('Confirmation'),
        //   content: Container(
        //     width: 200, // Set the width as per your preference
        //     height: 100, // Set the height as per your preference
        //     child: Center(
        //       child: Row(
        //         children: [
        //           TextFormField(
        //             controller: CommentController,
        //             // maxLength: 100,
        //             decoration: InputDecoration(
        //                 suffixIcon: Icon(Icons.note_alt),
        //                 border: UnderlineInputBorder(),
        //                 hintText: "Enter reason"),
        //           ),
        //           Text('Are you sure you want to mark it as Complete?'),
        //         ],
        //       ),
        //     ),
        //   ),
        //   actions: <Widget>[
        //     TextButton(
        //       child: Text('Cancel',style: TextStyle(color: Colors.red),),
        //       onPressed: () {
        //         Navigator.of(context).pop(); // Close the dialog
        //       },
        //     ),
        //     TextButton(
        //       child: Text('Continue',style: TextStyle(color: appThemeColor),),
        //       onPressed: ()async {
        //         var Work_id;
        //         await getPref()
        //             .then((value) {
        //           value.setString(
        //               KEYWORKID,
        //               get_work_order_status3
        //                   .data[index]
        //                   .workId
        //                   .toString());
        //         });
        //         await getPref()
        //             .then((value) {
        //           Work_id =
        //               value.getString(
        //                   KEYWORKID);
        //         });
        //         await update_wo_status_Controller()
        //             .update_wo_status_completed_Controller_method(
        //             Work_id,
        //             context);
        //       },
        //     ),
        //   ],
        // );
      },
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
                                          get_work_order_status2
                                              .data![widget.Tab_index1].workId
                                              .toString(),context)
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

  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status6);
    // get_add_parts_list_method();
    setState(() {
      is_status2_work_list_load = true;
    });
  }

  Widget Unable_to_solve_dialog(context) {
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
                        Center(
                          child: Text(
                            "Support Required",
                            style: GoogleFonts.lato(
                                fontSize: 14.sp,
                                color: appThemeColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: InputDecoration(
                              counterStyle: GoogleFonts.rubik(
                                  fontSize: 10.sp, color: Colors.grey),
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "Enter reason",
                              hintStyle: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 12.sp)),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 40.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                await post_work_reason_controller()
                                    .post_work_reason_controller_method(
                                        get_work_order_status2
                                            .data![widget.Tab_index1].workId
                                            .toString(),
                                        ReasonController.text,
                                        context);
                                ReasonController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appThemeColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Ask to callback",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
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
