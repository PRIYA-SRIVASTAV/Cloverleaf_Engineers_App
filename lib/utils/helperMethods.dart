import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
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


/// for file downloading
class CheckPermission {
  Future<bool> isStoragePermission() async {
    var isStorage = await Permission.storage.status;
    var isAccessLc = await Permission.accessMediaLocation.status;
    var isMnagExt = await Permission.manageExternalStorage.status;

    if (!isStorage.isGranted || !isAccessLc.isGranted || !isMnagExt.isGranted) {
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
      await Permission.manageExternalStorage.request();
      if (!isStorage.isGranted ||
          !isAccessLc.isGranted ||
          !isMnagExt.isGranted) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}

class DirectoryPath {
  getPath() async {
    final path = Directory(
        "/storage/emulated/0/Android/media/com.example.cloverleaf_project/files");
    if (await path.exists()) {
      return path.path;
    }
    else{
      path .create();
      return path.path;
    }
  }
}
