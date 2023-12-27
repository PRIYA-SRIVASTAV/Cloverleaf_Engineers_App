import 'package:cloverleaf_project/core/apiCall.dart';
import 'package:flutter/material.dart';
import '../screens/EngineerScreen/BottomNavigationPage.dart';
import '../screens/EngineerScreen/WorkOdersTabs/updateTechnicianSummary.dart';
import '../utils/helperWidget.dart';

class update_wo_extra_detail_controller {
  update_wo_extra_detail_controller_method(work_id, before_after_image, hrs_spent_by_tech, tech_summary, attach_file, img_type, context) async {
    var r = await ApiCalling().update_technician_summary_detail(
      work_id,
      before_after_image,
      hrs_spent_by_tech,
      tech_summary,
      attach_file,
      img_type == true ? "1" : "2"
    );

    /// before_img - 1 , after_img - 2
    if (r['status'].toString() == 'true') {
      customFlutterToast(r['message'].toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => updateTechnicianSummary(Work_id: work_id,)),
      );
    } else {
      customFlutterToast(r['message'].toString());
    }
  }
}
