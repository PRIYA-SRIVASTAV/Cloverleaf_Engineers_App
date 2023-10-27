import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloverleaf_project/screens/commonScreens/splashScreen.dart';
import 'package:cloverleaf_project/utils/helperMethods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'constant/colorConstant.dart';
import 'core/locator.dart';
import 'core/navigatorService.dart';

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  String? title = message.data["title"];
  String? body = message.data["body"];
  AudioNotificationPlayStop(1);
debugPrint("Notifivation!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 12,
      channelKey: "push-notification-cloverleaf",
      color: Colors.white,
      title: title,
      body: body,
      category: NotificationCategory.Message,
      wakeUpScreen: true,
      fullScreenIntent: true,
      autoDismissible: true,
    ),
    actionButtons: [
      NotificationActionButton(
        key: "ACCEPT",
        label: "Accept",
        color: appThemeColor,
        autoDismissible: true,
      ),
      NotificationActionButton(
          key: "REJECT",
          label: "Reject",
          color: Colors.red,
          autoDismissible: true),
    ],
  );
}

void main() async {
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          playSound: false,
          channelKey: "push-notification-cloverleaf",
          channelName: "push notification cloverleaf",
          channelDescription: "notification from cloverleaf",
          defaultColor: Colors.redAccent,
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          locked: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group'),
      ],
      debug: true);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  setupLocator();
  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission();
  } else if (Platform.isAndroid) {
    await Permission.notification.isDenied.then((value) {
      if (value) {
        Permission.notification.request();
      }
    });
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //2. This method only call when App in foreground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint("call when App in foreground");
        AudioNotificationPlayStop(1);
        String? title = message.data["title"];
        String? body = message.data["body"];
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 123,
            channelKey: "push-notification-cloverleaf",
            color: Colors.white,
            title: title,
            body: body,
            category: NotificationCategory.Message,
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: true,
          ),
          actionButtons: [
            NotificationActionButton(
              key: "ACCEPT",
              label: "Accept",
              color: appThemeColor,
              autoDismissible: true,
            ),
            NotificationActionButton(
                key: "REJECT",
                label: "Reject",
                color: Colors.red,
                autoDismissible: true),
          ],
        );
      },
    );

    //3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        debugPrint("call when App in background");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['id']}");
        }
      },
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          navigatorKey: NavigationService().navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Clover Leaf',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                toolbarHeight: 100,
              ),
              primaryColor: appThemeColor),
          home: splashScreen(),
        );
      },
    );
  }
}
