import 'dart:async';
import 'dart:developer';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloverleaf_project/controller/Post_FCM_Token_Controller.dart';
import 'package:cloverleaf_project/screens/commonScreens/BottomNavigationPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';
import '../../constant/colorConstant.dart';
import '../../constant/prefsConstant.dart';
import '../../constant/testStyleConstant.dart';
import '../../core/locator.dart';
import '../../core/navigatorService.dart';
import '../../utils/helperMethods.dart';
import '../onBoardingScreen/onBoardingPage1.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

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
    super.initState();


    routingFunction();


    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    // FirebaseMessaging.instance.getInitialMessage().then(
    //   (message) async {
    //     print("==================");
    //     if (message != null) {
    //       if (message.data['id'] != 0) {
    //         print("call when app in terminated state");
    //         AudioNotificationPlay();
    //         // Navigator.of(context).push(
    //         //   MaterialPageRoute(
    //         //     builder: (context) => DemoScreen(
    //         //       id: message.data['_id'],
    //         //     ),
    //         //   ),
    //         // );
    //       }
    //     }
    //   },
    // );


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
                child: Image.asset('assets/images/Cloverleaf-gif-video.gif'),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "CLOVERLEAF",
                style: appTitleStyle,
              ),
              Text(
                "BUILDING THE FUTURE OF MACHINE SERVICE",
                style: appSubTitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void routingFunction() async {
    var auth_token;
    await getPref().then((value) {
      auth_token = value.getString(KEYTOKEN);
    });
    var fcm_token;
    await FirebaseMessaging.instance.getToken().then((value) {
      fcm_token = value;
      log("FCM-TOKEN====$fcm_token");
    });
    if (auth_token.toString() != "KEY_TOKEN" &&
        auth_token.toString() != "null") {
      debugPrint(auth_token.toString());
      Post_FCM_Token_Controller().Post_FCM_Token_Controller_method(fcm_token);
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => MainClass())));
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoardingPage1(),
          ),
        ),
      );
    }
  }
}
