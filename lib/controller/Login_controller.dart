import 'dart:developer';

import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/prefsConstant.dart';
import '../core/apiCall.dart';
import '../screens/commonScreens/BottomNavigationPage.dart';
import '../utils/helperMethods.dart';
import '../utils/helperWidget.dart';

class Login_Controller {
  Login_controller_method(email, password, context) async {
    if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("password can't be empty");
    } else {
      var r = await ApiCalling().Login(email, password,type);
      log("rrrrrrrrrrrrrrrrrrr $r");
      if (r['status'].toString() == 'true') {
        await getPref().then((value) {
          value.setString(KEYTOKEN, r['token'].toString());
          value.setString(KEYID, r['data']['id'].toString());
        });
        customFlutterToast(r["message"]);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  BottomNavigationPage(),
          ),
        );
      }
      else{
        return customFlutterToast(r["message"]);
      }
    }
  }
}
