import 'dart:developer';
import 'package:cloverleaf_project/controller/Post_FCM_Token_Controller.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/BottomNavigationPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Services/ZegoLoginServices.dart';
import '../../constant/colorConstant.dart';
import '../../constant/prefsConstant.dart';
import '../../constant/testStyleConstant.dart';
import '../../utils/helperMethods.dart';
import '../onBoardingScreen/onBoardingPage1.dart';
import '../subjectExpertScreen/BottomNavigationPageSE.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  var zegoUserID = "";
  // @override
  // void initState() {
  //   super.initState();
  //   routingFunction();
  //   // 1. This method call when app in terminated state and you get a notification
  //   // when you click on notification app open from terminated state and you can get notification data in this method
  //   player = AudioPlayer();
  //   FirebaseMessaging.instance.getInitialMessage().then(
  //     (message) async {
  //       print("FirebaseMessaging.instance.getInitialMessage");
  //       if (message != null) {
  //         print("New Notification");
  //         _playSound();
  //         // if (message.data['_id'] != null) {
  //         //   Navigator.of(context).push(
  //         //     MaterialPageRoute(
  //         //       builder: (context) => DemoScreen(
  //         //         id: message.data['_id'],
  //         //       ),
  //         //     ),
  //         //   );
  //         // }
  //       }
  //     },
  //   );
  //
  //   // 2. This method only call when App in forground it mean app must be opened
  //   FirebaseMessaging.onMessage.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessage.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data11 ${message.data}");
  //        // LocalNotificationService.createanddisplaynotification(message);
  //         _playSound();
  //       }
  //     },
  //   );
  //
  //   // 3. This method only call when App in background and not terminated(not closed)
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessageOpenedApp.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data22 ${message.data['_id']}");
  //         _playSound();
  //       }
  //     },
  //   );
  // }
  @override
  void initState() {
    routingFunction();
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) async {
        print("=========terminated_state=========");
        if (message != null) {
          if (message.data['id'] != 0) {
            print("call when app in terminated state");
         //   AudioNotificationPlayStop(1);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BottomNavigationPage(BottomIndex: 2,SendTabIndex: 0,)
                    /*DemoScreen(
                  id: message.data['_id'],
                ),*/
              ),
            );
          }
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 50.h,
          width: 80.w,
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
                width: 40.w,
                child: Image.asset('assets/logo/newLogo.png',fit: BoxFit.contain),
              ),
              Text(
                "CLOVERLEAF",
                style: appTitleStyle,
              ),
              Text(
                "GLOBAL SOLUTION PVT LTD.",
                style: appSubTitleStyle,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "An     Industry    4.0    Initiative",
                style: GoogleFonts.lato(fontWeight: FontWeight.w600, color: appThemeColor, fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void routingFunction() async {
    await generatingUserIDforZegorCloud();
    var auth_eng_token;
    var auth_se_token;
    await getPref().then((value) {
      auth_eng_token = value.getString(KEYENGTOKEN);
      auth_se_token = value.getString(KEYSETOKEN);
    });
    var fcm_token;
    await FirebaseMessaging.instance.getToken().then((value) {
      fcm_token = value;
      log("FCM-TOKEN====$fcm_token");
    });
    if (auth_eng_token.toString() != "KEY_ENG_TOKEN" &&
        auth_eng_token.toString() != "null") {
      Post_FCM_Token_Controller().Eng_Post_FCM_Token_Controller_method(fcm_token,zegoUserID);
      debugPrint(auth_eng_token.toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainClassEng(),
        ),
      );
    } else if (auth_se_token.toString() != "KEY_SE_TOKEN" &&
        auth_se_token.toString() != "null") {
      Post_FCM_Token_Controller().SE_Post_FCM_Token_Controller_method(fcm_token, zegoUserID);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainClassSE(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage1(),
        ),
      );
    }
  }

  generatingUserIDforZegorCloud() async {
    final prefs = await SharedPreferences.getInstance();
    final cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';

    if (cacheUserID.isNotEmpty) {
      currentUser.id = cacheUserID;
      currentUser.name = 'user_$cacheUserID';
    }
    if (currentUser.id.isNotEmpty) {
      onUserLogin();
    } else {
      getUniqueUserId().then((userID) async {
        var a = userID;
        login(
          userID: a,
          userName: 'user_${a}',
        ).then((value) {
          onUserLogin();
        });
      });
    }
    zegoUserID = cacheUserID;
    debugPrint("ZegoUserID------------------------>>>$zegoUserID");
  }
}
