import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../controller/get_escalate_data_controller.dart';
import '../../../model/GetEscalateDataModel.dart';
import '../../../utils/helperMethods.dart';
import 'DocumentListTile.dart';

class SummaryTab extends StatefulWidget {
  var index;
  var work_id;
  SummaryTab({required this.index,required this.work_id, super.key});

  @override
  State<SummaryTab> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  late GetEscalateDataModel get_SE_work_order_status2;
  bool is_status2_SE_work_list_load = false;
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
  @override
  void initState() {
    super.initState();
    get_SE_work_order_status2_method();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: is_status2_SE_work_list_load
          ? get_SE_work_order_status2.data != null
              ? ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
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
                          "Escalate Photos",
                          style: GoogleFonts.lato(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    if (get_SE_work_order_status2.data!.escalateWoData!
                        .beforeEscalateImage!.isNotEmpty) ...[
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
                            .data!.escalateWoData!.beforeEscalateImage!.length,
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          var imageUrl = get_SE_work_order_status2.data!
                              .escalateWoData!.beforeEscalateImage![index].path
                              .toString();
                          return buildImageCarouselItem2(imageUrl, index);
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
                                "Escalated Photos not available !!",
                                style: GoogleFonts.lato(
                                    color: Colors.grey, fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.report_problem_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Escalate Reason",
                          style: GoogleFonts.lato(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: get_SE_work_order_status2
                                      .data!.comment!.isNotEmpty
                                  ? Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: get_SE_work_order_status2
                                                    .data!
                                                    .comment![widget.index]
                                                    .commentType ==
                                                4
                                            ? Text(
                                                get_SE_work_order_status2
                                                    .data!
                                                    .comment![widget.index]
                                                    .comment
                                                    .toString(),
                                                style: GoogleFonts.lato(
                                                    fontSize: 10.sp),
                                              )
                                            : Text(
                                                "Reason not available !!",
                                                style: GoogleFonts.lato(
                                                    color: Colors.grey,
                                                    fontSize: 10.sp),
                                              ),
                                      ),
                                    )
                                  : Text(
                                      "Reason not available !!",
                                      style: GoogleFonts.lato(
                                          color: Colors.grey, fontSize: 10.sp),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.drive_file_move_rtl_sharp,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          "Escalate Files",
                          style: GoogleFonts.lato(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: get_SE_work_order_status2
                              .data!.escalateWoData!.escalateFile!.isNotEmpty
                          ? /*isPermission
                                                                ?*/
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: get_SE_work_order_status2
                                  .data!.escalateWoData!.escalateFile!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return DocumentListTile(
                                  fileUrl: get_SE_work_order_status2
                                      .data!
                                      .escalateWoData!
                                      .escalateFile![index]
                                      .path!
                                      .toString(),
                                  title: get_SE_work_order_status2
                                      .data!
                                      .escalateWoData!
                                      .escalateFile![index]
                                      .name!
                                      .toString(),
                                );
                              },
                            )
                          /*: TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      checkPermission();
                                                                      if (isPermission ==
                                                                          true) {
                                                                        CircularProgressIndicator(
                                                                          color:
                                                                              appThemeColor,
                                                                        );
                                                                        // Navigator
                                                                        //     .push(
                                                                        //   context,
                                                                        //   MaterialPageRoute(
                                                                        //     builder: (context) =>
                                                                        //         SEwoInfoPage(
                                                                        //       Tab1Index: widget.Index,
                                                                        //       Work_id: get_SE_work_order_status2.data!.workId.toString(),
                                                                        //     ),
                                                                        //   ),
                                                                        // );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          3.h,
                                                                      width:
                                                                          100.w,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Press to Allow Permission !!!",
                                                                          style: GoogleFonts.lato(
                                                                              fontSize: 10.sp,
                                                                              color: Colors.blue.shade900),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )*/
                          : Row(
                              children: [
                                Text(
                                  "No escalated file available !!",
                                  style: GoogleFonts.lato(color: Colors.grey),
                                ),
                                Icon(
                                  Icons.not_interested,
                                  color: Colors.red,
                                )
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 4.h,
                    )
                  ],
                )
              : Center(
                  child:
                      Text("${get_SE_work_order_status2.message.toString()}"),
                )
          : Center(
              child: CircularProgressIndicator(
                color: appThemeColor,
              ),
            ),
    );
  }

  Widget buildImageCarouselItem2(bytesImage, index) {
    return Stack(
      children: [
        Image.network(
          bytesImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          child: Container(
            height: 2.h,
            width: 15.w,
            color: appThemeColor,
            child: Center(
              child: get_SE_work_order_status2.data!.escalateWoData!
                          .beforeEscalateImage![index].type ==
                      2
                  ? Text(
                      "Before",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 10.sp),
                    )
                  : Text(
                      "Escalate",
                      style: GoogleFonts.lato(
                          color: Colors.white, fontSize: 10.sp),
                    ),
            ),
          ),
        ),
      ],
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
