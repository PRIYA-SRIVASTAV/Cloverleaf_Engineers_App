import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../constant/testStyleConstant.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title1,
    required this.title2,
  });

  final String image, title1, title2;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title1,
              style: GoogleFonts.lato(fontSize:16.sp,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 2.h,),
          Container(
            height: 40.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 2.h,),
          Center(child: Text(title2, style: GoogleFonts.lato(fontSize:16.sp,fontWeight: FontWeight.bold),)),
        ]
        );
  }
}
