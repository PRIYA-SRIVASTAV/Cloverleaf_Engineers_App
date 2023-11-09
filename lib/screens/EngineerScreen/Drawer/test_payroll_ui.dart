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
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios)),
          backgroundColor: appThemeColor,
          title: Text('Payout List',style: GoogleFonts.lato(fontSize: 18.sp,fontWeight: FontWeight.w600,)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
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
                                    borderRadius: BorderRadius.circular(10)),
                                width: double.infinity,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Chip(
                                          visualDensity:
                                          const VisualDensity(
                                              vertical: -3),
                                          label: Text(
                                            "October",
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Total amount",
                                                  style: GoogleFonts.lato(color: Colors.grey)
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(":",
                                                    style: GoogleFonts.lato(color: appThemeColor))),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee_sharp,
                                                    size: 10.sp,
                                                  ),
                                                  Text(
                                                    "2000",
                                                      style: GoogleFonts.rubik( color: appThemeColor,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Paid amount",
                                                  style: GoogleFonts.lato(color: Colors.grey),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(":",
                                                    style: TextStyle(
                                                        color: appThemeColor))),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee_sharp,
                                                    size: 10.sp,
                                                  ),
                                                  Text(
                                                    "1000",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if(1==1)...[Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 4),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Pending amount",
                                                style:GoogleFonts.lato(color: Colors.grey),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  ":",
                                                  style: GoogleFonts.lato( color: appThemeColor),
                                                )),
                                            Expanded(
                                              flex: 3,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee_sharp,
                                                    size: 10.sp,
                                                  ),
                                                  Text(
                                                      "1000",
                                                      style: GoogleFonts.rubik( color: Colors.red,
                                                          fontWeight:
                                                          FontWeight.w400)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),],
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Chip(
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -3),
                                              label: Text(
                                                "12-03-2023",
                                                style: GoogleFonts.getFont(
                                                    'Rubik',
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                              backgroundColor: Colors.blue.shade900,
                                              padding: EdgeInsets.zero,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => EngViewDetailsPayout()
                                                  ),
                                                );
                                              },
                                              child: Icon(Icons.info_outline,color: Colors.blue.shade900,)
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void get_Payout_list_method()async {
    get_Payout_list = await Get_Payout_Data_controller().Get_Payout_Data_controller_method();
    if(get_Payout_list.status.toString()=="true"){
      setState(() {
        is_load_Payout_list = true;
      });
    }
  }
}
