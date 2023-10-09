import 'package:cloverleaf_project/screens/commonScreens/BottomNavigationPage.dart';
import 'package:flutter/material.dart';
import '../core/apiCall.dart';
import '../utils/helperWidget.dart';

class update_profile_detail_controller{
  update_profile_detail_controller_method(name, phone, address1, address2, city, state, zip,context)async{
    var r = await ApiCalling().Update_Profile_details(name, phone, address1, address2, city, state, zip);
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationPage()),
      );
    }
  }
}