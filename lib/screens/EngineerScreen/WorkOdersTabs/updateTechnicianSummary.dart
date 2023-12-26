import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_technician_summary_controller.dart';
import '../../../controller/update_wo_extra_detail_controller.dart';
import '../../../model/GetTechnicianSummaryModel.dart';
import '../../../utils/helperWidget.dart';
import '../BottomNavigationPage.dart';

class updateTechnicianSummary extends StatefulWidget {
  var Work_id;

  updateTechnicianSummary({required this.Work_id, super.key});

  @override
  State<updateTechnicianSummary> createState() =>
      _updateTechnicianSummaryState();
}

class _updateTechnicianSummaryState extends State<updateTechnicianSummary> {
  TextEditingController summaryController = TextEditingController();
  TextEditingController hoursSpent1Controller = TextEditingController();
  TextEditingController hoursSPent2Controller = TextEditingController();
  FilePickerResult? result;
  List<FilePickerResult> selectedFiles = [];

  // List<FilePickerResult> filePath =[];
  bool After_before_image_type = false;
  List<String> images = [
    'assets/images/asset_1.png',
    'assets/images/asset_2.webp',
    'assets/images/asset_3.jpg',
    'assets/images/asset_4.jpg'
  ];
  late GetTechnicianSummaryModel get_tech_summary_data;
  bool is_load_get_tech_summary_data = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_tech_summary_data_method();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    summaryController.dispose();
    hoursSpent1Controller.dispose();
    hoursSPent2Controller.dispose();
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
          return Image_pick_dialog(context);
        },
      );
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  void tapButton() async {
    setState(() {
      After_before_image_type = !After_before_image_type;
    });
  }

  Widget Image_pick_dialog(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 65.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.w),
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
                            ToggleSwitch(
                              minWidth: 18.w,
                              minHeight: 4.h,
                              initialLabelIndex: 0,
                              totalSwitches: 2,
                              labels: ['After', 'Before'],
                              onToggle: (index) {
                                tapButton();
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
                                  onTap: () async {
                                    await update_wo_extra_detail_controller()
                                        .update_wo_extra_detail_controller_method(
                                            widget.Work_id,
                                            profileImage,
                                            hoursSpent1Controller.text,
                                            summaryController.text,
                                            result,
                                            false,
                                            context);
                                  },
                                  child: Text(
                                    "Ok",
                                    style: GoogleFonts.lato(
                                        fontSize: 12.sp,
                                        color: appThemeColor,
                                        fontWeight: FontWeight.w600),
                                  ),
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
        );
      },
    );
  }

  Widget buildImageCarouselItem(String imageUrl, int index) {
    return Stack(
      children: [
        Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          child: Container(
            height: 2.h,
            width: 15.w,
            color: appThemeColor,
            child: Center(
              child: Text(
                "After",
                style: GoogleFonts.lato(color: Colors.white, fontSize: 10.sp),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.h,
          right: 0.w,
          child: InkWell(
            child: Container(
              height: 3.h,
              width: 3.h,
              child: Center(
                child: Text(
                  "╳",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              color: Colors.red,
            ),
            onTap: () {
              // Remove the image from the list
              setState(() {
                images.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Technician Summary",
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
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white,
        ),
        child: is_load_get_tech_summary_data
            ? Padding(
                padding: EdgeInsets.only(top: 3.h, left: 2.h, right: 2.h),
                child: SingleChildScrollView(
                  child: Column(
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
                        itemCount: images.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          final imageUrl = images[index];
                          return images[index] == 0
                              ? Container(
                                  height: 20.h,
                                  width: 100.w,
                                  color: Colors.grey,
                                )
                              : buildImageCarouselItem(imageUrl, index);
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          getProfileImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: appThemeColor,
                              size: 30.sp,
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
                            Text("Upload image",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Summary",
                        style: GoogleFonts.lato(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
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
                          controller: summaryController,
                          decoration: InputDecoration(
                            hintText: "enter summary & fixes",
                            hintStyle: GoogleFonts.lato(
                                fontSize: 10.sp, color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: appThemeColor, width: 0.5.w),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Hours spent by technician",
                        style: GoogleFonts.lato(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 6.h,
                            width: 35.w,
                            child: TextFormField(
                              cursorColor: appThemeColor,
                              onChanged: (value) {
                                // setState(() {
                                //   textValue = value;
                                // });
                              },
                              onTap: () {},
                              controller: hoursSpent1Controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeColor, width: 0.5.w),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 6.h,
                            width: 35.w,
                            child: TextFormField(
                              cursorColor: appThemeColor,
                              onChanged: (value) {
                                // setState(() {
                                //   textValue = value;
                                // });
                              },
                              onTap: () {},
                              controller: hoursSPent2Controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: appThemeColor, width: 0.5.w),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
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
                              allowMultiple: true,
                              type: FileType.custom,
                              allowedExtensions: allowedFiles);
                          if (result == null) {
                          } else {
                            selectedFiles.clear();
                            setState(() {});
                            for (var element in result!.files) {
                              // log("Selected File Name" +//
                              // seelement.name.toString());// log("Selected File Name" + result.toString());

                              selectedFiles.add(result!);
                            }
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.file_present_outlined,
                                  color: Colors.blue.shade900,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  "Attach files",
                                  style: GoogleFonts.lato(
                                      color: Colors.blue.shade900,
                                      fontSize: 12.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                      if (selectedFiles.isNotEmpty) ...[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectedFiles.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 4.h,
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
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            selectedFiles[index]
                                                .files[index]
                                                .name
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.highlight_remove,
                                            size: 20.sp,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                )
                              ],
                            );
                          },
                        ),
                      ],
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          SizedBox(
                            width: 30.w,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                              ),
                              onPressed: () async {
                                for (int i = 0; i < selectedFiles.length; i++) {
                                  update_wo_extra_detail_controller()
                                      .update_wo_extra_detail_controller_method(
                                          widget.Work_id,
                                          profileImage,
                                          hoursSpent1Controller.text,
                                          summaryController.text,
                                          selectedFiles[i].files[i],
                                          false,
                                          context);

                                  debugPrint("Called For Times");
                                }
                              },
                              child: Text(
                                "Update",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator(color: appThemeColor)),
      ),
    );
  }

  void get_tech_summary_data_method() async {
    get_tech_summary_data = await get_technician_summary_controller()
        .get_technician_summary_controller_method(widget.Work_id);
    setState(() {
      is_load_get_tech_summary_data = true;
    });
  }
}
