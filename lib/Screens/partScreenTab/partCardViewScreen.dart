import 'package:flutter/material.dart';

import '../../Constants/colorConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class partCardViewScreen extends StatefulWidget {
  const partCardViewScreen({super.key});

  @override
  State<partCardViewScreen> createState() => _partCardViewScreenState();
}

class _partCardViewScreenState extends State<partCardViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: appThemeColor,
        title: Text(
          "Bearing , Shopfloor",
          style: GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
          // GoogleFonts.roboto(
        ),

        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
      ),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          ),
          color: Colors.grey.shade300
            
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                      child: Text("Category",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87) ,)),
                  SizedBox(
                    width: 40.w,
                      child: Text("Type",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87) ,)),
                ],
              ),
              SizedBox(height: 4.h,),
              Text("Threshold Count",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
              SizedBox(height: 7.h,),
              Text("Batch Details",style:GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w700,color: Colors.black87)),
              Divider(color: Colors.black54,),
              SizedBox(height: 2.h,),
              Container(
                width: 100.w,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 27.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Batch Code",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("6202zz",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Store Location",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("Haridwar",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Part Location",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("Haridwar",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Initial Count",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("2",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Available Count",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("2",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 27.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Cost Per piece",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("0",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.h,),
                        Row(
                          children: [
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("QR Code",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("6202zz",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),
                            SizedBox(
                              width: 28.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bar Code",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black87)),
                                  SizedBox(height: 0.5.h,),
                                  Text("_____",style:GoogleFonts.roboto(fontSize: 10.sp, fontWeight: FontWeight.w500,color: Colors.black54)),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
