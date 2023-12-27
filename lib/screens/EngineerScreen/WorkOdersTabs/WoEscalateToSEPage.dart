import 'dart:developer';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/post_work_reason_controller.dart';
import '../../../utils/helperWidget.dart';

class WoEscalateToSEPage extends StatefulWidget {
  var work_id;

  WoEscalateToSEPage({required this.work_id, super.key});

  @override
  State<WoEscalateToSEPage> createState() => _WoEscalateToSEPageState();
}

class _WoEscalateToSEPageState extends State<WoEscalateToSEPage> {
  TextEditingController ReasonController = TextEditingController();
  List uploadedImages = [];

  @override
  void dispose() {
    super.dispose();
    ReasonController.dispose();
  }

  File? profileImage;

  Future getProfileImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);
      if (profileImage == null) return;

      final profileImageTemporary = File(profileImage.path);

      setState(() {
        this.profileImage = profileImageTemporary;
        uploadedImages.add(profileImage.name);
      });
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  List<FilePickerResult> selectedFiles = [];
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Support Required",
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
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Photos",
                style: GoogleFonts.lato(),
              ),
              SizedBox(
                height: 1.h,
              ),
              uploadedImages.isEmpty
                  ? Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: DottedBorder(
                          color: Colors.blue.shade900.withOpacity(0.4),
                          //color of dotted/dash line
                          strokeWidth: 2,
                          //thickness of dash/dots
                          dashPattern: [5, 3],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            height: 20.h,
                            width: 80.h,
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  getProfileImage(ImageSource.camera);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image_outlined,
                                      color: Colors.blue.shade900,
                                    ),
                                    Text(
                                      "Upload image",
                                      style: GoogleFonts.lato(
                                          color: Colors.blue.shade900,
                                          fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 45.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 2.w, horizontal: 2.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 35.h,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 20.h,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  pauseAutoPlayOnTouch: true,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                ),
                                itemCount: uploadedImages.length,
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  var imageUrl =
                                      uploadedImages[index].toString();
                                  return /*get_tech_summary_data
                                        .data!.beforeAfterImage?[index] == 0
                                ? Container(
                                    height: 20.h,
                                    width: 100.w,
                                    color: Colors.grey,
                                  )
                                :*/
                                      buildImageCarouselItem(imageUrl, index);
                                },
                              ),
                            ),
                            DottedBorder(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              //color of dotted/dash line
                              strokeWidth: 2,
                              //thickness of dash/dots
                              dashPattern: [5, 3],
                              //dash patterns, 10 is dash width, 6 is space width
                              child: Container(
                                height: 5.h,
                                width: 80.h,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      getProfileImage(ImageSource.camera);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_outlined,
                                          color: Colors.blue.shade900,
                                        ),
                                        Text(
                                          "Upload more images",
                                          style: GoogleFonts.lato(
                                              color: Colors.blue.shade900,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: 2.h,
              ),
              Text("File"),
              SizedBox(
                height: 1.h,
              ),
              if (result == null) ...[
                Container(
                  height: 15.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedBorder(
                      color: Colors.blue.shade900.withOpacity(0.4),
                      //color of dotted/dash line
                      strokeWidth: 2,
                      //thickness of dash/dots
                      dashPattern: [5, 3],
                      //dash patterns, 10 is dash width, 6 is space width
                      child: Container(
                        child: Center(
                          child: InkWell(
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
                                  selectedFiles.add(result!);
                                }
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_present,
                                  color: Colors.blue.shade900,
                                ),
                                Text(
                                  "Upload file",
                                  style: GoogleFonts.lato(
                                      color: Colors.blue.shade900,
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        height: 15.h,
                        width: 80.h,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 10.h,
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: DottedBorder(
                              color: Colors.blue.shade900.withOpacity(0.4),
                              //color of dotted/dash line
                              strokeWidth: 2,
                              //thickness of dash/dots
                              dashPattern: [5, 3],
                              //dash patterns, 10 is dash width, 6 is space width
                              child: Container(
                                height: 15.h,
                                width: 80.h,
                                child: Center(
                                  child: InkWell(
                                    onTap: () async {
                                      result = await FilePicker.platform
                                          .pickFiles(
                                              allowMultiple: true,
                                              type: FileType.custom,
                                              allowedExtensions: allowedFiles);
                                      if (result == null) {
                                      } else {
                                        selectedFiles.clear();
                                        setState(() {});
                                        for (var element in result!.files) {
                                          selectedFiles.add(result!);
                                        }
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.file_present,
                                          color: Colors.blue.shade900,
                                        ),
                                        Text(
                                          "Upload file",
                                          style: GoogleFonts.lato(
                                              color: Colors.blue.shade900,
                                              fontSize: 10.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (selectedFiles.isNotEmpty) ...[
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              //physics: NeverScrollableScrollPhysics(),
                              itemCount: selectedFiles.length,
                              itemBuilder: (context, index) {
                                //final callLog = callLogs[index];
                                return Column(
                                  children: [
                                    Container(
                                      color: Colors.blue.shade900.withOpacity(0.2),
                                      height: 4.h,
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 1.h,)
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
              SizedBox(
                height: 2.h,
              ),
              Text("Reason"),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                cursorColor: appThemeColor,
                controller: ReasonController,
                maxLength: 100,
                decoration: InputDecoration(
                    counterStyle:
                        GoogleFonts.rubik(fontSize: 10.sp, color: Colors.grey),
                    suffixIcon: Icon(Icons.note_alt),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: appThemeColor, width: 0.25.h),
                    ),
                    hintText: "Enter reason",
                    hintStyle: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontSize: 12.sp)),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    width: 35.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.lato(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 35.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        await post_work_reason_controller()
                            .post_work_reason_controller_method(
                                widget.work_id,
                                ReasonController.text,
                                profileImage,
                                result,
                                context);
                        ReasonController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appThemeColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "Escalate",
                        style: GoogleFonts.lato(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageCarouselItem(imageUrl, index) {
    return Stack(
      children: [
        // Image.asset(
        //   imageUrl,
        //   fit: BoxFit.cover,
        //   width: double.infinity,
        // ),
        Image(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          width: double.infinity,
        )
        // Positioned(
        //   top: 0.h,
        //   right: 0.w,
        //   child: InkWell(
        //     child: Container(
        //       height: 3.h,
        //       width: 3.h,
        //       child: Center(
        //         child: Text(
        //           "╳",
        //           style: GoogleFonts.lato(
        //               color: Colors.white,
        //               fontSize: 12.sp,
        //               fontWeight: FontWeight.w600),
        //         ),
        //       ),
        //       color: Colors.red,
        //     ),
        //     onTap: () {
        //       // Remove the image from the list
        //       setState(() {
        //         uploadedImages.removeAt(index);
        //       });
        //     },
        //   ),
        // ),
      ],
    );
  }
}
