import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:cloverleaf_project/controller/Get_Payout_Data_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../model/GetPayoutDataModel.dart';
import 'ViewDetailsPayout.dart';

class Eng_Payout_list extends StatefulWidget {
  const Eng_Payout_list({super.key});

  @override
  State<Eng_Payout_list> createState() => _Eng_Payout_listState();
}

class _Eng_Payout_listState extends State<Eng_Payout_list> {
  bool is_load_Payout_list = false;
  late GetPayoutDataModel get_Payout_list;

  @override
  void initState() {
    super.initState();
    get_Payout_list_method();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: appThemeColor,
          title: Text('Payout List',
              style: GoogleFonts.lato(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              )),
        ),
        backgroundColor: appThemeColor,
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Container(
            height: 90.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
              child: is_load_Payout_list
                  ? get_Payout_list.data!.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: get_Payout_list.data!.length,
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
                                              BorderRadius.circular(10),
                                        ),
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Chip(
                                                  visualDensity:
                                                      const VisualDensity(
                                                          vertical: -3),
                                                  label: Text(
                                                    get_Payout_list
                                                        .data![i].monthName
                                                        .toString(),
                                                    style: GoogleFonts.lato(
                                                        color: appThemeColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  backgroundColor: Colors.blue
                                                      .withOpacity(0.2),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 4),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "Total amount",
                                                        style: GoogleFonts.lato(
                                                            color: Colors.grey),
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
                                                            get_Payout_list
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 4),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "Paid amount",
                                                        style: GoogleFonts.lato(
                                                            color: Colors.grey),
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
                                                            get_Payout_list
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
                                              if (get_Payout_list
                                                      .data![i].pending !=
                                                  get_Payout_list
                                                      .data![i].totalPaid) ...[
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
                                                          style:
                                                              GoogleFonts.lato(
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
                                                              get_Payout_list
                                                                  .data![i]
                                                                  .pending
                                                                  .toString(),
                                                              style: GoogleFonts.rubik(
                                                                  color: Colors
                                                                      .red,
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
                                              ],
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                EngViewDetailsPayout(
                                                              year:
                                                                  get_Payout_list
                                                                      .data![i]
                                                                      .year,
                                                              monthName:
                                                                  get_Payout_list
                                                                      .data![i]
                                                                      .monthName,
                                                              Date:
                                                                  get_Payout_list
                                                                      .data![i]
                                                                      .year,
                                                              index: i,
                                                              month:
                                                                  get_Payout_list
                                                                      .data![i]
                                                                      .month,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.info_outline,
                                                        color: Colors
                                                            .blue.shade900,
                                                      ),
                                                      // Text(
                                                      //   "View Details",
                                                      //   style: GoogleFonts.lato(fontSize: 13.0,
                                                      //       decoration: TextDecoration
                                                      //           .underline,
                                                      //       fontWeight: FontWeight.w600,
                                                      //       color: Colors.blue)
                                                      // ),
                                                    )
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
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 1.8.h,
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "${get_Payout_list.message.toString()}",
                            style: GoogleFonts.lato(color: Colors.red),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        color: appThemeColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void get_Payout_list_method() async {
    get_Payout_list = await Get_Eng_Payout_Data_controller()
        .Get_Payout_Data_controller_method();
    if (get_Payout_list.status.toString() == "true") {
      setState(() {
        is_load_Payout_list = true;
      });
    }
  }
}
