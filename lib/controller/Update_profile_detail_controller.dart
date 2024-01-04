import 'package:cloverleaf_project/screens/EngineerScreen/BottomNavigationPage.dart';
import 'package:flutter/material.dart';
import '../core/apiCall.dart';
import '../screens/subjectExpertScreen/BottomNavigationPageSE.dart';
import '../utils/helperWidget.dart';

class update_profile_detail_controller {
  update_profile_detail_controller_method(profileImage, name, phone, address1,
      address2, city, state, zip, oldPass, newPass, confPass, context) async {
    var r = await ApiCalling().Update_Profile_details(profileImage, name, phone,
        address1, address2, city, state, zip, oldPass, newPass, confPass);
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationPage()),
      );
    } else {
      customFlutterToast(r['message'].toString());
    }
  }

  Update_SE_Profile_details_controller_method(profileImage, name, phone, address1,
      address2, city, state, zip, oldPass, newPass, confPass, context) async {
    var r = await ApiCalling().Update_SE_Profile_details(profileImage, name, phone,
        address1, address2, city, state, zip, oldPass, newPass, confPass);
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationPageSE()),
      );
    } else {
      customFlutterToast(r['message'].toString());
    }
  }
}
