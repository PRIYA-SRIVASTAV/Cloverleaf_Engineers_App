import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Constants/colorConstants.dart';
import '../Constants/textstyleConstants.dart';

Future customFlutterToast(msg) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: appThemeColor,
      textColor: Colors.white,
      fontSize: 16.sp);
}
Widget Onboarding_BackGround() {
  return Container(
    color: Colors.white,
    height: 100.h,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 40.w),
          child: Container(
            height: 45.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Group 4.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        Padding(
          padding: EdgeInsets.only(left: 40.w),
          child: Container(
            height: 45.h,
            width: 100.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Group 74.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textFieldContainer(controller, context, text, icons) {
  return TextFormField(
    onChanged: (value) {
      // setState(() {
      //   textValue = value;
      // });
    },
    onTap: () {},
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(icons, color: appThemeColor),
      label: Text(
        text,
        style: textFieldTitleStyle,
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appThemeColor, width: 0.5.w),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

Widget textFieldContainerR(controller,context,text,icons){
  return TextFormField(
    onChanged: (value){},
    onTap: (){},
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: Icon(icons,color: appThemeColor),
      label: Text(
        text,
        style: TextStyle(
          color: appThemeColor,
          fontWeight: FontWeight.w500, fontSize: 18.sp
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appThemeColor,width: 0.5.w),
        borderRadius: BorderRadius.circular(5)
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5)
      )

    ),

  );
}
