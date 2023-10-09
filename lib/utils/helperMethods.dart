import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

isConnectedToInternet() async {
  if (!kIsWeb) {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  } else {
    return true;
  }
}

Future getPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
}

AudioPlayer player = AudioPlayer();

AudioNotificationPlayStop(val) async {
  await player.setAsset('assets/notificationAudio/notificationRing.mp3');
  if (val == 1) {
    player.play();
  } else {
    player.stop();
  }
}

// void exitApp() {
//   if (Platform.isAndroid) {
//     exit(0);
//   }
// }
