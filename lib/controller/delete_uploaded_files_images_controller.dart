import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/material.dart';
import '../screens/EngineerScreen/WorkOdersTabs/getTechnicianSummary.dart';
import '../utils/helperWidget.dart';

class delete_uploaded_files_images_controller{
  delete_uploaded_files_images_controller_method(id, work_id, file_name, file_type,context)async{
    var r = await ApiCalling().delete_uploaded_files_images(id, work_id, file_name, file_type);
    print("delete_uploaded_files_images=======> $r");
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getTechnicianSummary(
            Work_id: work_id,
          ),
        ),
      );
    } else {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getTechnicianSummary(
            Work_id: work_id,
          ),
        ),
      );
    }
  }
}