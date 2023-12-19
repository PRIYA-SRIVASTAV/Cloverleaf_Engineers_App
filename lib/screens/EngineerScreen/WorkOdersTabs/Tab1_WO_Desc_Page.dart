import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../controller/get_Work_order_details_controller.dart';
import '../../../controller/send_otp_to_complete_wo_controller.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../controller/verify_otp_to_complete_wo_controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/GetWorkorderdetailsModel.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';
import 'WoEscalateToSEPage.dart';
import 'updateTechnicianSummary.dart';

class Tab1_WO_Desc extends StatefulWidget {
  Tab1_WO_Desc({required this.Tab_index1,required this.Work_id, super.key});
  var Work_id;
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
  TextEditingController commentController = TextEditingController();
  bool is_status2_work_list_load = false;
  late GetWorkorderdetailsModel get_work_order_status2;
  bool After_before_image_status = true;
  List<String> images = [
    'assets/images/asset_1.png',
    'assets/images/asset_2.webp',
    'assets/images/asset_3.jpg',
    'assets/images/asset_4.jpg'
  ];

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
      showDialog(
        context: context,
        builder: (context) {
          return Image_pick_dialog(context, profileImage);
        },
      );
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 45.h,
            width: 100.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        : Container(
            height: 45.h,
            width: 100.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
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
    // String base64 = "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";
    // Uint8List bytesImage = const Base64Decoder().convert(base64);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h),
        child: is_status2_work_list_load
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    get_work_order_status2.data!= null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                itemCount: get_work_order_status2.data!.clientImages!.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  String base64 = get_work_order_status2.data!.clientImages![index].toString();
                                  Uint8List bytesImage = const Base64Decoder().convert(base64);
                                  return buildImageCarouselItem(
                                      bytesImage, index);
                                },
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
                                          updateTechnicianSummary(Work_id : get_work_order_status2.data!.workId.toString()),
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
                                                            .data!
                                                            .workId
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
                                              send_otp_to_complete_wo_controller()
                                                  .send_otp_to_complete_wo_controller_method(
                                                      get_work_order_status2
                                                          .data!
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

  Widget buildImageCarouselItem(bytesImage, int index) {
    return Image.memory(
      bytesImage,
      fit: BoxFit.cover,
      width: double.infinity,
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
                                            .data!.workId
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
                                              .data!.workId
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
    get_work_order_status2 = await get_Work_order_details_controller().get_Work_order_details_controller_method(widget.Work_id);
    // get_add_parts_list_method();
    setState(() {
      is_status2_work_list_load = true;
    });
  }

  Widget Image_pick_dialog(context, profileImage) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Expanded(
            child: Container(
              height: 65.h,
              child: Stack(
                // alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Photos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: appThemeColor),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        imageWidget(),
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                              ToggleSwitch(
                                minWidth: 18.w,
                                minHeight: 4.h,
                                initialLabelIndex: 0,
                                totalSwitches: 2,
                                labels: ['After', 'Before'],
                                onToggle: (index) {
                                  print('switched to: $index');
                                },
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  InkWell(
                                    child: Text(
                                      "Ok",
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          color: appThemeColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              )
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
          ),
        );
      },
    );
  }
}
