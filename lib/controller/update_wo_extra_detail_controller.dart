import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:cloverleaf_project/screens/EngineerScreen/WorkOdersTabs/updateTechnicianSummary.dart';
import 'package:flutter/material.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../screens/EngineerScreen/WorkOdersTabs/getTechnicianSummary.dart';
import '../utils/helperWidget.dart';

class update_wo_extra_detail_controller {
  update_before_after_image_controller_method(work_id, before_after_image,
      hrs_spent_by_tech, tech_summary, attach_file, img_type, context) async {
    var a = await ApiCalling().update_technician_summary_detail(
        work_id,
        before_after_image,
        hrs_spent_by_tech,
        tech_summary,
        attach_file,
        img_type == true ? "1" : "2");
    print("update_after_before_img=======> $a");
    if (a['status'].toString() == 'true') {
      customFlutterToast(a['message'].toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => getTechnicianSummary(
            Work_id: work_id,
          ),
        ),
      );
    } else {
      customFlutterToast(a['message'].toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => getTechnicianSummary(
            Work_id: work_id,
          ),
        ),
      );
    }

    /// before_img - 1 , after_img - 2
  }

  update_wo_extra_detail_controller_method(work_id, before_after_image,
      hrs_spent_by_tech, tech_summary, attach_file, img_type, context) async {
    var r = await ApiCalling().update_technician_summary_detail(
        work_id,
        before_after_image,
        hrs_spent_by_tech,
        tech_summary,
        attach_file,
        img_type);
    print("update_wo_extra_detail=======> $r");
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => getTechnicianSummary(
            Work_id: work_id,
          ),
        ),
      );
    } else {
      customFlutterToast(r['message'].toString());
      Navigator.pushReplacement(
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
