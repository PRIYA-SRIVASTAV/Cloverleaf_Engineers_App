import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'ViewDetailsPayout.dart';

class Payout_list extends StatefulWidget {
  const Payout_list({super.key});

  @override
  State<Payout_list> createState() => _Payout_listState();
}

class _Payout_listState extends State<Payout_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h), // Set the desired height
        child: AppBar(
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back_ios)),
          // toolbarHeight: 120, // Set this height
          flexibleSpace: Container(
            color: appThemeColor,
            child: Padding(
              padding: EdgeInsets.only(left:5.w,top:20.h),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("Total Amount Received",style: GoogleFonts.lato(fontSize: 16.sp,color: Colors.white)),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee,size: 22.sp,color: Colors.white,),
                      Text("97000",style: GoogleFonts.rubik(color: Colors.white,fontSize: 22.sp),),
                    ],
                  )
                ],
              ),
            ),
          ),
          // backgroundColor: appThemeColor,
          title: Text('Payout List',style: GoogleFonts.lato(fontSize: 18.sp)),
        ),
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
                  return InkWell(
                    onTap: () {
                      // var route =
                      // MaterialPageRoute(builder: (BuildContext context) {
                      //   return InvoicePage_View(
                      //     invoiceId: modeldata[i].id.toString(),
                      //   );
                      // });
                      // Navigator.of(context).push(route);
                    },
                    child: Card(
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
                                  child: Column(
                                    children: [
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
                                                "Work order id",
                                                style: GoogleFonts.lato(color: Colors.grey)
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(":",
                                                    style: GoogleFonts.lato(color: appThemeColor))),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                "10",
                                                style: GoogleFonts.rubik(fontWeight: FontWeight.w400),
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
                                      if(1==0)...[Padding(
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
                                                    color: appThemeColor,
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.w400),
                                              ),
                                              backgroundColor: Colors.pinkAccent
                                                  .withOpacity(0.2),
                                              padding: EdgeInsets.zero,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => ViewDetailsPayout()
                                                  ),
                                                );
                                              },
                                              child:  Text(
                                                "View Details",
                                                style: GoogleFonts.lato(fontSize: 13.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue)
                                              ),
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
    );
  }
}
