import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/colorConstant.dart';
import '../../../constant/testStyleConstant.dart';
class FAQ_Page extends StatefulWidget {
  const FAQ_Page({super.key});

  @override
  State<FAQ_Page> createState() => _FAQ_PageState();
}

class _FAQ_PageState extends State<FAQ_Page> {
  bool isExpanded1 = true;
  bool isExpanded2 = true;
  bool isExpanded3 = true;
  bool isExpanded4 = true;
  bool isExpanded5 = true;
  bool isExpanded6 = true;
  bool isExpanded7 = true;
  bool isExpanded8 = true;

  void toggleContainerSize1() {
    setState(() {
      isExpanded1 = !isExpanded1;
    });
  }

  void toggleContainerSize2() {
    setState(() {
      isExpanded2 = !isExpanded2;
    });
  }

  void toggleContainerSize3() {
    setState(() {
      isExpanded3 = !isExpanded3;
    });
  }

  void toggleContainerSize4() {
    setState(() {
      isExpanded4 = !isExpanded4;
    });
  }

  void toggleContainerSize5() {
    setState(() {
      isExpanded5 = !isExpanded5;
    });
  }

  void toggleContainerSize6() {
    setState(() {
      isExpanded6 = !isExpanded6;
    });
  }
  void toggleContainerSize7() {
    setState(() {
      isExpanded7 = !isExpanded7;
    });
  }
  void toggleContainerSize8() {
    setState(() {
      isExpanded8 = !isExpanded8;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "FAQ",
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
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: Container(
          height: 90.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.h),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize1,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded1 ? 4.h : 30.h,
                        child: isExpanded1
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize2,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded2 ? 4.h : 30.h,
                        child: isExpanded2
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize3,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded3 ? 4.h : 30.h,
                        child: isExpanded3
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize4,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded4 ? 4.h : 30.h,
                        child: isExpanded4
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize5,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded5 ? 4.h : 30.h,
                        child: isExpanded5
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize6,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded6 ? 4.h : 30.h,
                        child: isExpanded6
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize7,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded7 ? 4.h : 30.h,
                        child: isExpanded7
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: toggleContainerSize8,
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appThemeColor.withOpacity(0.2),
                        ),
                        duration: Duration(milliseconds: 300),
                        width: double.infinity,
                        height: isExpanded8 ? 4.h : 30.h,
                        child: isExpanded8
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lorem Ipsum',
                                style: GoogleFonts.lato(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 20.sp,
                              )
                            ],
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 4.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Lorem Ipsum',
                                      style: GoogleFonts.lato(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                height: 20.h,
                                width: double.infinity,
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.lato(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}
