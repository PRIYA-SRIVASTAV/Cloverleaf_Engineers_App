import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/testStyleConstant.dart';
import '../../../controller/Get_SE_Payout_Data_controller.dart';
import '../../../model/GetSEPayoutListModel.dart';
import 'SEViewDetailsPayout.dart';

class SE_Payout_list extends StatefulWidget {
  const SE_Payout_list({super.key});

  @override
  State<SE_Payout_list> createState() => _SE_Payout_listState();
}

class _SE_Payout_listState extends State<SE_Payout_list> {
  bool is_load_SE_Payout_list = false;
  late GetSePayoutList get_SE_Payout_list;

  @override
  void initState() {
    super.initState();
    get_SE_Payout_list_method();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Payout List",
            style: dashboardStyle,
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: appThemeColor,
        ),
        backgroundColor: appThemeColor,
        body: is_load_SE_Payout_list
            ? Container(
              // height: double.infinity,
              // width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (get_SE_Payout_list.data!.isNotEmpty) ...[
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: get_SE_Payout_list.data!.length,
                        itemBuilder: (BuildContext context, i) {
                          return Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 5,
                                                  horizontal: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                        "Work Order id",
                                                        style: GoogleFonts
                                                            .lato(
                                                                color: Colors
                                                                    .grey)),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      ":",
                                                      style: GoogleFonts.lato(
                                                          color:
                                                              appThemeColor),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "#${get_SE_Payout_list.data![i].workId.toString()}",
                                                      style: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 5,
                                                  horizontal: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                        "Total amount",
                                                        style: GoogleFonts
                                                            .lato(
                                                                color: Colors
                                                                    .grey)),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(":",
                                                          style: GoogleFonts
                                                              .lato(
                                                                  color:
                                                                      appThemeColor))),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .currency_rupee_sharp,
                                                          size: 10.sp,
                                                        ),
                                                        Text(
                                                          get_SE_Payout_list
                                                              .data![i]
                                                              .totalAmountToPay
                                                              .toString(),
                                                          style: GoogleFonts.rubik(
                                                              color:
                                                                  appThemeColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 5,
                                                  horizontal: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Paid amount",
                                                      style: GoogleFonts
                                                          .lato(
                                                              color: Colors
                                                                  .grey),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(":",
                                                          style: TextStyle(
                                                              color:
                                                                  appThemeColor))),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .currency_rupee_sharp,
                                                          size: 10.sp,
                                                        ),
                                                        Text(
                                                          get_SE_Payout_list
                                                              .data![i]
                                                              .totalPaid
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (get_SE_Payout_list
                                                    .data![i].pending !=
                                                get_SE_Payout_list
                                                    .data![i]
                                                    .totalPaid) ...[
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 5,
                                                    horizontal: 4),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Text(
                                                        "Pending amount",
                                                        style: GoogleFonts
                                                            .lato(
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Text(
                                                          ":",
                                                          style: GoogleFonts
                                                              .lato(
                                                                  color:
                                                                      appThemeColor),
                                                        )),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .currency_rupee_sharp,
                                                            size: 10.sp,
                                                          ),
                                                          Text(
                                                              get_SE_Payout_list
                                                                  .data![
                                                                      i]
                                                                  .pending
                                                                  .toString(),
                                                              style: GoogleFonts.rubik(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight.w400)),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 5,
                                                  horizontal: 4),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      "Call Duration",
                                                      style: GoogleFonts
                                                          .lato(
                                                              color: Colors
                                                                  .grey),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(":",
                                                          style: TextStyle(
                                                              color:
                                                                  appThemeColor))),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      get_SE_Payout_list
                                                                  .data![
                                                                      i]
                                                                  .seWorkingHours
                                                                  .toString() ==
                                                              "null"
                                                          ? ""
                                                          : get_SE_Payout_list
                                                              .data![i]
                                                              .seWorkingHours
                                                              .toString(),
                                                      style: GoogleFonts.rubik(
                                                          fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(vertical: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(),
                                                  if (get_SE_Payout_list
                                                          .data![i]
                                                          .totalPaid
                                                          .toString() !=
                                                      "0") ...[
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    SEViewDetailsPayout(
                                                              payout_id: get_SE_Payout_list
                                                                  .data![
                                                                      i]
                                                                  .id
                                                                  .toString(),
                                                              work_id: get_SE_Payout_list
                                                                  .data![
                                                                      i]
                                                                  .workId
                                                                  .toString(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        "View Transaction",
                                                        style: GoogleFonts.lato(
                                                            fontSize:
                                                                13.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            color: Colors
                                                                .blue),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return SizedBox(
                            height: 1.8.h,
                          );
                        },
                      ),
                    ] else ...[
                      Center(
                        child: Text(
                          "No Payout data available!!!",
                          style: GoogleFonts.lato(color: Colors.red),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            )
            : Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                height: 90.h,
                child: Center(
                  child: CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ),
              ),
      ),
    );
  }

  convertDuration(String duration) {
    double r = double.parse(duration);
    if (r == 60.0) {
      return "1 min";
    } else if (r < 60) {
      return "${r.toString()} sec";
    } else {
      List split = (r / 60).toString().split(".");
      return "${split[0].toString()} min ${split[1].toString().substring(0, 1)} sec";
    }
  }

  void get_SE_Payout_list_method() async {
    get_SE_Payout_list = await Get_SE_Payout_Data_controller()
        .Get_SE_Payout_Data_controller_method();
    if (get_SE_Payout_list.status.toString() == "true") {
      setState(
        () {
          is_load_SE_Payout_list = true;
        },
      );
    }
  }
}
