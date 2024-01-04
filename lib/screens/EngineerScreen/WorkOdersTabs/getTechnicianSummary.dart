import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/WorkOdersTabs/updateTechnicianSummary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_technician_summary_controller.dart';
import '../../../controller/delete_uploaded_files_images_controller.dart';
import '../../../model/GetTechnicianSummaryModel.dart';

class getTechnicianSummary extends StatefulWidget {
  var Work_id;

  getTechnicianSummary({required this.Work_id, super.key});

  @override
  State<getTechnicianSummary> createState() => _getTechnicianSummaryState();
}

class _getTechnicianSummaryState extends State<getTechnicianSummary> {
  late GetTechnicianSummaryModel get_tech_summary_data;
  bool is_load_get_tech_summary_data = false;
  bool apiCalled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_tech_summary_data_method();
  }

  Widget buildImageCarouselItem(imageUrl, index) {
    return Stack(
      children: [
        Image.network(
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
              child:
                  get_tech_summary_data.data!.beforeAfterImage![index].type == 1
                      ? Text(
                          "Before",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 10.sp),
                        )
                      : Text(
                          "After",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 10.sp),
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
              delete_uploaded_files_images_controller()
                  .delete_uploaded_files_images_controller_method(
                  get_tech_summary_data.data!.beforeAfterImage![index].id
                      .toString(),
                  widget.Work_id,
                  get_tech_summary_data.data!.beforeAfterImage![index].name
                      .toString(),
                  get_tech_summary_data.data!.beforeAfterImage![index].type
                      .toString(),
                  context);
              if (apiCalled == true) {
                setState(() {
                  get_tech_summary_data.data!.beforeAfterImage!.removeAt(index);
                });
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>  false ,
      child: Scaffold(
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
                        if (get_tech_summary_data
                            .data!.beforeAfterImage!.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.photo_album_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "Images",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
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
                              enableInfiniteScroll: false,
                            ),
                            itemCount: get_tech_summary_data
                                .data!.beforeAfterImage?.length,
                            itemBuilder:
                                (BuildContext context, int index, int realIndex) {
                              var imageUrl = get_tech_summary_data
                                  .data!.beforeAfterImage?[index].path
                                  .toString();
                              return buildImageCarouselItem(imageUrl, index);
                            },
                          ),
                        ] else ...[
                          Row(
                            children: [
                              Icon(
                                Icons.photo_album_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "Images",
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
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
                                    "Images not available !!",
                                    style: GoogleFonts.lato(
                                        color: Colors.grey, fontSize: 12.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.summarize_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "Summary",
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 8.h,
                          width: double.infinity,
                          child: Card(
                            shape: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${get_tech_summary_data.data!.techSummary.toString()}",
                                    style: GoogleFonts.rubik(
                                        fontSize: 12.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "Hours spent by technician",
                              style: GoogleFonts.lato(
                                  fontSize: 12.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          height: 8.h,
                          width: double.infinity,
                          child: Card(
                            shape: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${get_tech_summary_data.data!.hrsSpentByTech.toString()}",
                                    style: GoogleFonts.rubik(
                                        fontSize: 12.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.file_present_outlined,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "Files",
                              style: GoogleFonts.lato(
                                  color: Colors.black, fontSize: 12.sp),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (get_tech_summary_data
                            .data!.attachFile!.isNotEmpty) ...[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                get_tech_summary_data.data!.attachFile!.length,
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
                                              get_tech_summary_data
                                                  .data!.attachFile![index].name!
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              await delete_uploaded_files_images_controller()
                                                  .delete_uploaded_files_images_controller_method(
                                                      get_tech_summary_data.data!
                                                          .attachFile![index].id
                                                          .toString(),
                                                      widget.Work_id,
                                                      get_tech_summary_data.data!
                                                          .attachFile![index].name
                                                          .toString(),
                                                      get_tech_summary_data.data!
                                                          .attachFile![index].type
                                                          .toString(),
                                                      context);
                                            },
                                            child: Container(
                                                height: 4.h,
                                                width: 5.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  color: Colors.red,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "delete",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 8.sp,
                                                      color: Colors.white),
                                                ))
                                                // Icon(
                                                //   Icons.delete_forever,
                                                //   color: Colors.red,
                                                //   size: 16.sp,
                                                // ),
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
                        ] else ...[
                          Text("No file uploaded yet!!")
                        ],
                        SizedBox(
                          height: 1.h,
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          updateTechnicianSummary1(
                                        work_id: widget.Work_id,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Edit",
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
      ),
    );
  }

  void get_tech_summary_data_method() async {
    get_tech_summary_data = await get_technician_summary_controller()
        .get_technician_summary_controller_method(widget.Work_id);
    if (get_tech_summary_data.status.toString() == "true") {
      setState(() {
        is_load_get_tech_summary_data = true;
      });
    }
  }
}
