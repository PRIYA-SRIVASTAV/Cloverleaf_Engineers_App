// import 'package:daacoworks/Constants/colorConstants.dart';
// import 'package:daacoworks/Constants/string.dart';
// import 'package:daacoworks/Constants/textstyleConstants.dart';
// import 'package:daacoworks/Screens/CommonScreen/SignUp.dart';
// import 'package:daacoworks/Screens/CommonScreen/bottomNavigationBar.dart';
// import 'package:daacoworks/Screens/OnBoardingPages/home.dart';
import 'package:dmms/Screens/assetFloatingActionScreens/partScreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/colorConstants.dart';
import '../../Constants/string.dart';
import '../../Constants/textstyleConstants.dart';
import '../../utils/helperWidget.dart';
import '../assetFloatingActionScreens/assetScreen.dart';
import 'SignUp.dart';
import 'bottomNavigationBar.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
 TextEditingController EmailController = TextEditingController();
 TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(

        children: [
          Onboarding_BackGround(),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               SizedBox(
                 height: 20.h,
                 width: 40.w,
                 child:Image.asset('assets/images/logoClov.png'),
               ),
               SizedBox(
                 height: 2.h,
               ),
               Text(splashText,style: appTitleStyle),
               SizedBox(
                 height: 1.h,
               ),
               Text(splashSubTitle,style: TextStyle(
                 fontWeight: FontWeight.w600,
                 color: appThemeColor,
                 fontSize: 11.sp
               ),
               ),
               SizedBox(
                 height: 5.h,
               ),
               Align(
                 alignment: Alignment.topLeft,
                   child: Text(loginToYourAccount,style: titleStyle,)
               ),

               SizedBox(
                 height: 5.h,
               ),
               textFieldContainerR(EmailController,context,email,Icons.email),
               SizedBox(
                 height: 2.h,
               ),
               textFieldContainerR(PasswordController,context,password,Icons.remove_red_eye),
              SizedBox(
                height: 2.h,
              ),
              Row(

                children: [
                  Container(
                    height: 2.h,
                    width: 2.h,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                  SizedBox(width: 1.w,),
                  Text(rememberMe,style: TextStyle(fontWeight: FontWeight.w500,fontSize:10.sp ))
                ],
              ),
               SizedBox(
                 height: 2.h,
               ),
               SizedBox(
                 height: 6.h,
                 width: 100.w,

                 child: FloatingActionButton(
                   onPressed: (){
                     Navigator.of(context).push(
                       MaterialPageRoute(builder: (context){
                         return MainClass();
                       })
                     );
                   },
                   backgroundColor: appThemeColor,
                   shape: OutlineInputBorder(
                     borderSide: BorderSide.none,
                     borderRadius: BorderRadius.circular(5)
                   ),
                   child: Text(signIn,style: TextStyle(fontSize: 20.sp,color: Colors.white),),

                 ),
               ),
               SizedBox(height: 2.h,),
               Padding(
                 padding: const EdgeInsets.only(bottom: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     InkWell(
                       onTap:(){
                         Navigator.of(context).push(
                           MaterialPageRoute(builder: (context){
                             // return SignUpPage();
                             return floatAssetScreen();
                           })
                         );
               },
                         child: Text(signUp,
                           style: TextStyle(color: appThemeColor,fontSize: 15.sp,fontWeight: FontWeight.w500),
                         )),
                     SizedBox(width: 2.w,),
                     Text(forDemo,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),)
                   ],
                 ),
               ),


             ],
           ),
         ),

        ],
      )
    );
  }
}
