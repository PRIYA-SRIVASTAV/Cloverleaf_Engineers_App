import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
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


// final player = AudioPlayer();
//
// AudioNotificationPlayStop(val) async {
//   if (val == 1) {
//     debugPrint("=======Audio Player Started =========");
//     await player.play(AssetSource('notificationAudio/notificationRing.mp3'));
//
//    // player.play();
//   } else {
//     await player.stop();
//     debugPrint("=======Audio Player ended =========");
//   }
// }

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
