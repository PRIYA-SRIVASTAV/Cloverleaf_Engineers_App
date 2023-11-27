import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
import '../../../constant/prefsConstant.dart';
import '../../../constant/stringsConstant.dart';
import '../../../controller/post_work_reason_controller.dart';
import '../../../controller/update_wo_status_Controller.dart';
import '../../../controller/work_order_list_controller.dart';
import '../../../model/WorkOrderModel.dart';
import '../../../utils/helperMethods.dart';

class Tab1_WO_Desc extends StatefulWidget {
  Tab1_WO_Desc({required this.Tab_index1, super.key});
  var Tab_index1;

  @override
  State<Tab1_WO_Desc> createState() => _Tab1_WO_DescState();
}

class _Tab1_WO_DescState extends State<Tab1_WO_Desc> {
  TextEditingController ReasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  bool is_status2_work_list_load = false;
  late GetWorkOrderListModel get_work_order_status2;


  @override
  void initState() {
    super.initState();
    get_work_order_status2_method();
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
                                                  return Unable_to_solve_dialog(
                                                      context);
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Reason",
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
                                          "Work order completed?",
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
                                            onPressed: (){
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Complete_WO_dialog();
                                                },
                                              );
                                            },
                                            // onPressed: () async {
                                            //   var Work_id;
                                            //   await getPref()
                                            //       .then((value) {
                                            //     value.setString(
                                            //         KEYWORKID,
                                            //         get_work_order_status2
                                            //             .data[widget
                                            //                 .Tab_index1]
                                            //             .workId
                                            //             .toString());
                                            //   });
                                            //   await getPref()
                                            //       .then((value) {
                                            //     Work_id =
                                            //         value.getString(
                                            //             KEYWORKID);
                                            //   });
                                            //   await update_wo_status_Controller()
                                            //       .update_wo_status_completed_Controller_method(
                                            //           Work_id,
                                            //           context);
                                            // },
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
                child: CircularProgressIndicator(color: appThemeColor,),
              ),
      ),
    );
  }

  Widget Complete_WO_dialog() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return   Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirmation",
                          style: TextStyle(
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
                        SizedBox(height:2.h),
                        Text('Are you sure you want to mark it as Complete?',style: TextStyle(fontWeight: FontWeight.w500),),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Row(
                            children: [
                              TextButton(
                                child: Text('Cancel',style: TextStyle(fontSize:10.sp,color: Colors.red),),
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: Text('Continue',style: TextStyle(fontSize:10.sp,color: appThemeColor),),
                                onPressed: ()async {
                                  var Work_id;
                                  await getPref()
                                      .then((value) {
                                    value.setString(
                                        KEYWORKID,
                                        get_work_order_status2
                                            .data![widget.Tab_index1]
                                            .workId
                                            .toString());
                                  });
                                  await getPref()
                                      .then((value) {
                                    Work_id =
                                        value.getString(
                                            KEYWORKID);
                                  });
                                  await update_wo_status_Controller()
                                      .update_wo_status_completed_Controller_method(
                                      Work_id,
                                      context);
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

  void get_work_order_status2_method() async {
    get_work_order_status2 = await work_order_list_controller()
        .work_order_list_pending_controller_method(Work_order_status2);
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
                                fontSize: 14.sp, color: appThemeColor, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: InputDecoration(counterStyle: GoogleFonts.rubik(fontSize: 10.sp,color: Colors.grey),
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "Enter reason",
                              hintStyle: GoogleFonts.lato(fontWeight:FontWeight.w600,color: Colors.grey,fontSize: 12.sp)
                          ),
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
                                style:  GoogleFonts.lato(
                                    fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w600),
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
