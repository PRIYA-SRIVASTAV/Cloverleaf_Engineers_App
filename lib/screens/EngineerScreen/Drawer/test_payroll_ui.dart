import 'package:cloverleaf_project/constant/colorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class test_payroll extends StatefulWidget {
  const test_payroll({super.key});

  @override
  State<test_payroll> createState() => _test_payrollState();
}

class _test_payrollState extends State<test_payroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h), // Set the desired height
        child: AppBar(
          flexibleSpace: Container(
            height: 50.h,
            width: 30.w,
            color: appThemeColor,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [Text("Total amount received")],
              ),
            ),
          ),
          // backgroundColor: appThemeColor,
          title: Text('Payout List'),
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
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(":",
                                                    style: TextStyle(
                                                        color: appThemeColor))),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                "10",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                style: TextStyle(
                                                    color: Colors.grey),
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
                                                    "2000",
                                                    style: TextStyle(
                                                        color: appThemeColor,
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
                                                style: TextStyle(
                                                    color: Colors.grey),
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
                                                "Pending amount",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: Text(
                                                  ":",
                                                  style: TextStyle(
                                                      color: appThemeColor),
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
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
                                                // style: GoogleFonts.getFont(
                                                //     'Rubik',
                                                //     color: appThemeColor,
                                                //     fontSize: 12,
                                                //     fontWeight:
                                                //     FontWeight.w400),
                                              ),
                                              backgroundColor: Colors.pinkAccent
                                                  .withOpacity(0.2),
                                              padding: EdgeInsets.zero,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // var route = MaterialPageRoute(
                                                //     builder: (BuildContext
                                                //     context) {
                                                //       return InvoicePage_View(
                                                //         invoiceId: modeldata[i]
                                                //             .id
                                                //             .toString(),
                                                //       );
                                                //     });
                                                // Navigator.of(context)
                                                //     .push(route);
                                              },
                                              child: const Text(
                                                "View Details",
                                                style: TextStyle(
                                                    fontSize: 13.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.blue),
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
