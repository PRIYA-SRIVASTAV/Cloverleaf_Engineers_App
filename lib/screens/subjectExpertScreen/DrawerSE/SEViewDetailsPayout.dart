import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
class SEViewDetailsPayout extends StatefulWidget {
  const SEViewDetailsPayout({super.key});

  @override
  State<SEViewDetailsPayout> createState() => _SEViewDetailsPayoutState();
}

class _SEViewDetailsPayoutState extends State<SEViewDetailsPayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          title: Text(
            "Work Order Id - #12",
            style: GoogleFonts.lato(fontSize: 18.sp),
          ),
          backgroundColor: appThemeColor,
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
                Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Txn Id",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Date",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Paid Amount",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600, fontSize: 12.sp),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, i) {
                    return Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 1.h),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "234",
                                    style: GoogleFonts.rubik(fontSize: 10.sp),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    "2-nov-23",
                                    style: GoogleFonts.rubik(fontSize: 10.sp),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    "1000",
                                    style: GoogleFonts.rubik(fontSize: 10.sp),
                                  ))
                            ],
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
