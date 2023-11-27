import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:cloverleaf_project/controller/Get_Payout_view_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../model/GetPayoutViewDetailsModel.dart';
import 'EngTxnHistory.dart';

class EngViewDetailsPayout extends StatefulWidget {
  var index;
  var monthName;
  var month;
  var year;
  var Date;

  EngViewDetailsPayout(
      {required this.index,
      required this.monthName,
      required this.month,
      required this.year,
      required this.Date,
      super.key});

  @override
  State<EngViewDetailsPayout> createState() => _EngViewDetailsPayoutState();
}

class _EngViewDetailsPayoutState extends State<EngViewDetailsPayout> {
  bool is_load_View_Details_Payout_list = false;
  late GetPayoutViewDetailsModel get_View_Details_Payout_list;

  @override
  void initState() {
    super.initState();
    get_View_Details_Payout_list_method();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: is_load_View_Details_Payout_list
          ? Scaffold(
              appBar: AppBar(
                elevation: 0,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                title: Text(
                  widget.monthName.toString(),
                  style: GoogleFonts.lato(fontSize: 18.sp),
                ),
                backgroundColor: appThemeColor,
              ),
              backgroundColor: appThemeColor,
              body: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Container(
                    height: 90.h,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          if (get_View_Details_Payout_list
                              .data!.paymentList!.isNotEmpty) ...[
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: get_View_Details_Payout_list
                                  .data!.paymentList!.length,
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
                                                  if (get_View_Details_Payout_list
                                                          .data!.isPromised ==
                                                      false) ...[
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
                                                            flex: 2,
                                                            child: Text(
                                                                "Work Order Id",
                                                                style: GoogleFonts.lato(
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
                                                            child: Text(
                                                              "# ${get_View_Details_Payout_list.data!.paymentList![i].workId.toString()}",
                                                              style: GoogleFonts.rubik(
                                                                  color:
                                                                      appThemeColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
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
                                                          flex: 2,
                                                          child: Text(
                                                            "Total amount",
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
                                                            style: GoogleFonts.lato(
                                                                color:
                                                                    appThemeColor),
                                                          ),
                                                        ),
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
                                                                get_View_Details_Payout_list
                                                                    .data!
                                                                    .paymentList![
                                                                        i]
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
                                                          flex: 2,
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
                                                          child: Text(
                                                            ":",
                                                            style: TextStyle(
                                                                color:
                                                                    appThemeColor),
                                                          ),
                                                        ),
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
                                                                get_View_Details_Payout_list
                                                                    .data!
                                                                    .paymentList![
                                                                        i]
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
                                                  if (get_View_Details_Payout_list
                                                          .data!
                                                          .paymentList![i]
                                                          .pending !=
                                                      get_View_Details_Payout_list
                                                          .data!
                                                          .paymentList![i]
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
                                                            flex: 2,
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
                                                                    get_View_Details_Payout_list
                                                                        .data!
                                                                        .paymentList![
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
                                                        .symmetric(vertical: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        EngTxnHistory(
                                                                  payout_id: get_View_Details_Payout_list
                                                                      .data!
                                                                      .paymentList![
                                                                          i]
                                                                      .id
                                                                      .toString(),
                                                                  work_id: get_View_Details_Payout_list
                                                                      .data!
                                                                      .paymentList![
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
                                                                fontSize: 13.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .blue
                                                                    .shade900),
                                                          ),
                                                        ),
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
                              separatorBuilder: (BuildContext context, int i) {
                                return SizedBox(
                                  height: 1.8.h,
                                );
                              },
                            ),
                          ] else ...[
                            Center(
                              child: Text(
                                "${get_View_Details_Payout_list.message.toString()}",
                                style: GoogleFonts.lato(color: Colors.red),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: appThemeColor,
                  ),
                ),
              ),
            ),
    );
  }

  void get_View_Details_Payout_list_method() async {
    get_View_Details_Payout_list = await get_payout_view_Details_controller()
        .get_payout_view_Details_controller_method(widget.month, widget.year);
    if (get_View_Details_Payout_list.status.toString() == "true") {
      setState(() {
        is_load_View_Details_Payout_list = true;
      });
    }
  }
}
