import 'dart:async';

// import 'package:daacoworks/Constants/string.dart';
// import 'package:daacoworks/Screens/CommonScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../../Constants/string.dart';
import '../../Constants/textstyleConstants.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen() {
    Timer(
        const Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => loginScreen())
            )
    );
  }

  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/images/logoClov.png',
                width: 40.w,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(splashText, style: appTitleStyle,),
              SizedBox(
                height: 1.h,
              ),
              Text(splashSubTitle, style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appThemeColor,
                  fontSize: 11.sp
              )),


            ],
          ),
        ),
      ),
    );
  }
}

