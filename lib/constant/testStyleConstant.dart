import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'colorConstant.dart';

/// Text Style
TextStyle appTitleStyle = GoogleFonts.lato(fontWeight: FontWeight.w600, color: appThemeColor, fontSize:28.sp);
TextStyle appSubTitleStyle = GoogleFonts.lato(fontWeight: FontWeight.w600, color: appThemeColor, fontSize: 8.sp);
TextStyle getStartedStyle = TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold);
TextStyle textFieldTitleStyle = GoogleFonts.lato(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 14.sp);
TextStyle chartValueStyle = TextStyle(fontWeight: FontWeight.bold, color: appThemeColor);
TextStyle legendTextStyle = GoogleFonts.lato(fontSize: 10.sp, fontWeight: FontWeight.w600, color: Colors.black,);
TextStyle subjectStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 1.sp, color: appThemeColor);
TextStyle cancelStyle = TextStyle(fontSize: 18.sp, color: const Color(0XFF880E4F),);
TextStyle submitStyle = TextStyle(fontSize: 18.sp);
TextStyle dashboardStyle = GoogleFonts.lato(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white,);
TextStyle greetingsStyle = const TextStyle(color: Colors.white);
TextStyle dashboardCardStyle =GoogleFonts.lato(fontSize: 16.sp, fontWeight: FontWeight.bold);
TextStyle profileOptionsStyle = GoogleFonts.lato(fontSize: 12.sp, color: appThemeColor.withOpacity(0.5),fontWeight: FontWeight.w600);

