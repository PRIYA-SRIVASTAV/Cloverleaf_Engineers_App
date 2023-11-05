import 'dart:developer';
import 'package:cloverleaf_project/constant/stringsConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant/prefsConstant.dart';
import '../core/apiCall.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../screens/subjectExpertScreen/BottomNavigationPageSE.dart';
import '../utils/helperMethods.dart';
import '../utils/helperWidget.dart';

class Login_Controller {
  Login_controller_method(email, password, context) async {
    if (email.toString().isEmpty) {
      customFlutterToast("email can't be empty");
    } else if (password.toString().isEmpty) {
      customFlutterToast("password can't be empty");
    } else {
      var r = await ApiCalling().Login(email, password, type);
      log("rrrrrrrrrrrrrrrrrrr $r");
      if (r['status'].toString() == 'true') {
        if(r['data']['user_type']=='2'){
          await getPref().then((value) {
            value.setString(KEYENGTOKEN, r['token'].toString());
            value.setString(KEYUNIQUEID, r['data']['unique_id'].toString());
            value.setString(KEYUSERNAME, r['data']['name'].toString());
          });
          customFlutterToast(r["message"]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigationPage(),
            ),
          );
        }
        else{
          await getPref().then((value) {
            value.setString(KEYSETOKEN, r['token'].toString());
            value.setString(KEYUNIQUEID, r['data']['unique_id'].toString());
            value.setString(KEYUSERNAME, r['data']['name'].toString());
          });
          customFlutterToast(r["message"]);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavigationPageSE(),
            ),
          );
        }
      } else {
        return customFlutterToast(r["message"]);
      }
    }
  }
}
