// import 'package:daacoworks/Constants/colorConstants.dart';
// import 'package:daacoworks/Screens/CommonScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import 'loginScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [
              Text("Page Not Found",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18.sp),),
              SizedBox(height: 2.h,),
              InkWell(
                onTap: (){
                  Navigator.pop(context,
                    MaterialPageRoute(builder: (context){
                      return loginScreen();
                    })
                  );
                },
                  child: Text("Click To Home Page",style: TextStyle(color:appThemeColor,fontWeight: FontWeight.w700,fontSize: 12.sp)
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
