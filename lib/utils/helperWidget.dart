import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../constant/colorConstant.dart';
import '../constant/testStyleConstant.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/textFieldConstant.dart';


/// allowed pick files from mobile
List <String> allowedFiles =  ['jpg', 'pdf', 'doc','png','mp4'];

TextEditingController subjectController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

Widget createWorkRequest(context) {
  return Dialog(
    child: Container(
      height: 600.h,
      child: Stack(
        // alignment: Alignment.topRight,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subject*",
                    style: subjectStyle,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  workRequestTextFieldForm(subjectController, null, null),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Description", style: subjectStyle),
                  SizedBox(
                    height: 20.h,
                  ),
                  workRequestTextFieldForm(descriptionController, 400, 10),
                  SizedBox(
                    height: 120.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 110.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: Color(0XFF880E4F),
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: cancelStyle,
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 110.w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(appThemeColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Submit",
                            style: submitStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 2,
            top: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  key: Key('closeIconKey'),
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget openProfilePhoto(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: Stack(
      children: [
        CircleAvatar(
          radius: 20.h,
          backgroundImage: const AssetImage('assets/images/3135715.png'),
        ),
        Positioned(
          right: 2.h,
          top: 7.h,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                key: Key('closeIconKey'),
                radius: 15,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget profileListTrailingContainer(icon, context) {
  return Container(
      height:4.h,
      width: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: icon);
}

Widget profileListLeadingContainer(icon, context) {
  return Container(
      height:4.h,
      width: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: appThemeColor,
      ),
      child: icon);
}

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
    cursorColor: appThemeColor,
    onChanged: (value) {
      // setState(() {
      //   textValue = value;
      // });
    },
    onTap: () {},
    controller: controller,
    decoration: InputDecoration(
      hintText: text,
      hintStyle: GoogleFonts.lato(color: Colors.grey),
      suffixIcon: Icon(icons, color: appThemeColor),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: appThemeColor, width: 0.5.w),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}

