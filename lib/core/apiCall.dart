import 'dart:convert';
import 'package:cloverleaf_project/core/results.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant/prefsConstant.dart';
import '../model/GetAddPartsListModel.dart';
import '../model/GetDashboardDataModel.dart';
import '../model/GetEscalateDataModel.dart';
import '../model/GetLeaveCalenderModel.dart';
import '../model/GetPartsModel.dart';
import '../model/GetPayoutDataModel.dart';
import '../model/GetPayoutSETransactionListModel.dart';
import '../model/GetPayoutTransactionListModel.dart';
import '../model/GetPayoutViewDetailsModel.dart';
import '../model/GetProfileSEModel.dart';
import '../model/GetSECallLogsModel.dart';
import '../model/GetSEDashbordDataModel.dart';
import '../model/GetSEPayoutListModel.dart';
import '../model/GetTechnicianSummaryModel.dart';
import '../model/GetUserStatusModel.dart';
import '../model/GetWorkorderdetailsModel.dart';
import '../model/GetprofilePageModel.dart';
import '../model/SE_Work_order_model.dart';
import '../model/WorkOrderModel.dart';
import '../utils/helperMethods.dart';
import '../utils/helperWidget.dart';
import 'apiEndpoints.dart';

class ApiCalling {
  var client = http.Client();

  headerWithoutContentTypeENG() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(KEYENGTOKEN) != null)
      token = pref.getString(KEYENGTOKEN);
    Map<String, String> WithToken = {
      "Authorization": "Bearer $token",
    };
    return WithToken;
  }

  headerWithoutContentTypeSE() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(KEYSETOKEN) != null) token = pref.getString(KEYSETOKEN);
    Map<String, String> WithToken = {
      "Authorization": "Bearer $token",
    };
    return WithToken;
  }

  headerWithContentTypeENG() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(KEYENGTOKEN) != null)
      token = pref.getString(KEYENGTOKEN);
    Map<String, String> headerToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return headerToken;
  }

  headerWithContentTypeSE() async {
    var pref = await getPref();
    String token = "";
    if (pref.getString(KEYSETOKEN) != null) token = pref.getString(KEYSETOKEN);
    Map<String, String> headerToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    return headerToken;
  }

  /// ===============================================post Apis=================================================================

  /// Api for login
  Future Login(email, password, type, Fcm_token, zegoUserId) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Login_Uri = Uri.parse(ApiEndpoints.Login_url);
        var map = Map<String, dynamic>();
        map['email'] = email;
        map['password'] = password;
        map['type'] = type;
        map['fcm_token'] = Fcm_token;
        map['zego_user_id'] = zegoUserId;
        debugPrint("-----------$map----------");
        var Login_Response = await client.post(Login_Uri, body: map);
        MYAPILOGS("Login Api", Login_Response);
        if (Login_Response.statusCode == 200) {
          return jsonDecode(Login_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Login_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  /// multipart api
  Future post_work_reason(
      work_id, reason, escalate_img, escalate_file,work_order_status) async {
    if (await isConnectedToInternet()) {
      try {
        Uri post_work_reason_Uri = Uri.parse(ApiEndpoints.post_work_reason_url);
        var body = <String, String>{
          'work_id': work_id,
          'reason': reason,
          'wo_status': work_order_status,
        };
        var request = http.MultipartRequest('POST', post_work_reason_Uri);
        request.fields.addAll(body);
        if (escalate_img != null) {
          request.files.add(await http.MultipartFile.fromPath(
              "escalate_img", escalate_img.path));
        } else if (escalate_file != null) {
          request.files.add(await http.MultipartFile.fromPath(
              "escalate_file", escalate_file.path));
        }
        var pref = await getPref();
        String token = "";
        if (pref.getString(KEYENGTOKEN) != null)
          token = pref.getString(KEYENGTOKEN);
        request.headers.addAll({
          "Authorization": "Bearer $token",
        });
        http.StreamedResponse response = await request.send();
        final a = await http.Response.fromStream(response);
        print("post_work_parts_Response ===========> ${a.body}");
        MYAPILOGS(" post work parts Api", a);
        if (a.statusCode == 200) {
          return jsonDecode(a.body);
        } else {
          return customFlutterToast(jsonDecode(a.body)["message"].toString());
        }
      } catch (e) {
        print(e);
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future update_technician_summary_detail (work_id, before_after_image, hrs_spent_by_tech, tech_summary, attach_file, img_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri update_wo_extra_detail_Url =
        Uri.parse(ApiEndpoints.update_wo_extra_detail);

        var body = <String, String>{
          "work_id": work_id,
          "hrs_spent_by_tech": hrs_spent_by_tech,
          "tech_summary": tech_summary,
          "type": img_type,
        };
        var request = http.MultipartRequest('POST', update_wo_extra_detail_Url);
        request.fields.addAll(body);
        if (before_after_image != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
                "before_after_image", before_after_image.path),
          );
        } else if (attach_file != null) {
          PlatformFile data =attach_file;
          request.files.add(await http.MultipartFile.fromPath("attach_file", data.path!));
        }
        var pref = await getPref();
        String token = "";
        if (pref.getString(KEYENGTOKEN) != null)
          token = pref.getString(KEYENGTOKEN);
        request.headers.addAll({
          "Authorization": "Bearer $token",
        });
        http.StreamedResponse response = await request.send();
        final a = await http.Response.fromStream(response);
        if (a.statusCode == 200) {
          debugPrint("======update_technician_summary_detail_api======> ${jsonDecode(a.body)}");
          return jsonDecode(a.body);
        } else {
          customFlutterToast(jsonDecode(a.body)["message"].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future Update_Profile_details(image, name, phone, address1, address2, city,
      state, zip, oldPass, newPass, confPass) async {
    try {
      Uri User_setting_Uri = Uri.parse(ApiEndpoints.Update_profile_url);
      var body = <String, String>{
        "name": name,
        "phone": phone,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "zip_code": zip,
        "old_password": oldPass,
        "password": newPass,
        "cpassword": confPass,
      };
      var request = http.MultipartRequest('POST', User_setting_Uri);
      request.fields.addAll(body);
      if (image != null) {
        request.files
            .add(await http.MultipartFile.fromPath("image", image.path));
      }
      var pref = await getPref();
      String token = "";
      if (pref.getString(KEYENGTOKEN) != null)
        token = pref.getString(KEYENGTOKEN);
      //debugPrint(image.path.toString());
      request.headers.addAll({
        "Authorization": "Bearer $token",
      });
      http.StreamedResponse response = await request.send();
      final a = await http.Response.fromStream(response);
      debugPrint("Update_Profile_details Api Response ====${a.body}");
      if (a.statusCode == 200) {
        return jsonDecode(a.body);
      } else {
        return customFlutterToast(jsonDecode(a.body)["message"].toString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future Update_SE_Profile_details(name, phone, address1, address2, city, state,
      zip, oldPass, newPass, confPass) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Update_SE_Profile_details_Url =
            Uri.parse(ApiEndpoints.SE_Update_profile_url);
        var map = {
          "name": name,
          "phone": phone,
          "address_1": address1,
          "address_2": address2,
          "city": city,
          "state": state,
          "zip_code": zip,
          "old_password": oldPass,
          "password": newPass,
          "cpassword": confPass,
        };
        var Update_SE_Profile_details_Url_Response = await client.post(
            Update_SE_Profile_details_Url,
            body: map,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS(
            "SE Update profile Api", Update_SE_Profile_details_Url_Response);
        if (Update_SE_Profile_details_Url_Response.statusCode == 200) {
          return jsonDecode(Update_SE_Profile_details_Url_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Update_SE_Profile_details_Url_Response.body)["message"]
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  Future Post_SE_Call_start(
      subj_expert_id, eng_id, workorder_id, call_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Post_SE_Call_details_Url =
            Uri.parse(ApiEndpoints.SE_post_call_start);
        var map = {
          "subj_expert_id": subj_expert_id,
          "eng_id": eng_id,
          "workorder_id": workorder_id,
          "call_type": call_type,
        };
        var Post_SE_Call_details_Url_Response = await client.post(
            Post_SE_Call_details_Url,
            body: map,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS("Post SE call start Api", Post_SE_Call_details_Url_Response);
        if (Post_SE_Call_details_Url_Response.statusCode == 200) {
          return jsonDecode(Post_SE_Call_details_Url_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Post_SE_Call_details_Url_Response.body)["message"]
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future Post_SE_Call_End(
      subj_expert_id, eng_id, call_duration, user_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Post_SE_Call_End_Url = Uri.parse(ApiEndpoints.SE_post_call_end);
        var map = {
          "subj_expert_id": subj_expert_id,
          "eng_id": eng_id,
          "duration": call_duration
        };
        var Post_SE_Call_End_Url_Response = await client.post(
            Post_SE_Call_End_Url,
            body: map,
            headers: user_type == "eng"
                ? await headerWithoutContentTypeENG()
                : await headerWithoutContentTypeSE());
        MYAPILOGS("Post SE call end Api", Post_SE_Call_End_Url_Response);
        if (Post_SE_Call_End_Url_Response.statusCode == 200) {
          return jsonDecode(Post_SE_Call_End_Url_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Post_SE_Call_End_Url_Response.body)["message"]
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  /// Api for is update active
  Future is_Update_ENG_active(is_active) async {
    if (await isConnectedToInternet()) {
      try {
        Uri is_Update_active_Uri =
            Uri.parse(ApiEndpoints.Upadate_is_active_url);
        var map = Map<String, dynamic>();
        map['is_active'] = is_active;

        var Login_Response = await client.post(is_Update_active_Uri,
            body: map, headers: await headerWithoutContentTypeENG());
        MYAPILOGS("is_Update_ENG_active Api", Login_Response);
        if (Login_Response.statusCode == 200) {
          return jsonDecode(Login_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Login_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future is_Update_SE_active(is_active) async {
    if (await isConnectedToInternet()) {
      try {
        Uri is_Update_SE_active_Uri =
            Uri.parse(ApiEndpoints.Upadate_is_active_url);
        var map = Map<String, dynamic>();
        map['is_active'] = is_active;
        var is_Update_SE_active_Response = await client.post(
            is_Update_SE_active_Uri,
            body: map,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS("is_Update_SE_active Api", is_Update_SE_active_Response);
        if (is_Update_SE_active_Response.statusCode == 200) {
          return jsonDecode(is_Update_SE_active_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(is_Update_SE_active_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  /// Api for update-wo-status
  Future update_wo_status(work_id, work_order_status) async {
    if (await isConnectedToInternet()) {
      try {
        Uri update_wo_status_Uri =
            Uri.parse(ApiEndpoints.Eng_update_wo_status_url);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['wo_status'] = work_order_status;

        var update_wo_status_Response = await client.post(update_wo_status_Uri,
            body: map, headers: await headerWithoutContentTypeENG());
        MYAPILOGS(" update_wo_status Api", update_wo_status_Response);
        if (update_wo_status_Response.statusCode == 200) {
          return jsonDecode(update_wo_status_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(update_wo_status_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future SE_update_wo_status(work_id, se_wo_status) async {
    if (await isConnectedToInternet()) {
      try {
        Uri SE_update_wo_status_uri =
            Uri.parse(ApiEndpoints.SE_update_wo_status_url);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['se_wo_status'] = se_wo_status;

        var SE_update_wo_status_Response = await client.post(
            SE_update_wo_status_uri,
            body: map,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS(" SE_update_wo_status Api", SE_update_wo_status_Response);
        if (SE_update_wo_status_Response.statusCode == 200) {
          return jsonDecode(SE_update_wo_status_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(SE_update_wo_status_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///

  /// Api for Raise leave request
  Future Raise_leave_request(is_on_leave, notes, date) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Raise_leave_request_Uri = Uri.parse(ApiEndpoints.raise_leave_url);
        // Map<String, dynamic> map1 = {
        //   "is_on_leave": "$is_on_leave",
        //   "note": "$note",
        //   "Date": "$selectedDate",
        // };
        // print("--------map1---------$map1");
        // var jsonString = jsonEncode(map1);
        // print("=======$jsonString");
        // Map<String, dynamic> map2 = {
        //   "calender": "$jsonString",
        // };
        // print("--------map2---------$map2");
        var map = Map<String, dynamic>();
        map['is_onleave'] = is_on_leave;
        map['notes'] = notes;
        map['date'] = date;
        var Raise_leave_request_Response = await client.post(
            Raise_leave_request_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS(" Raise leave request Api", Raise_leave_request_Response);
        if (Raise_leave_request_Response.statusCode == 200) {
          return jsonDecode(Raise_leave_request_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(Raise_leave_request_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future Post_location(latitude, longitude, address) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Post_location_Uri = Uri.parse(ApiEndpoints.post_location_url);
        Map<String, dynamic> map1 = {
          "latitude": "$latitude",
          "longitude": "$longitude",
          "address": "$address"
        };
        print("--------map1---------$map1");
        var jsonString = jsonEncode(map1);
        Map<String, dynamic> map2 = {
          "location": "$jsonString",
        };
        print("--------map2---------$map2");
        var Post_location_Response = await client.post(Post_location_Uri,
            body: map2, headers: await headerWithoutContentTypeENG());
        print("+++++++++++++++${Post_location_Response.body}");
        MYAPILOGS(" Post location Api", Post_location_Response);
        if (Post_location_Response.statusCode == 200) {
          return jsonDecode(Post_location_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(Post_location_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  Future post_work_parts(work_id, parts_id, parts_name) async {
    if (await isConnectedToInternet()) {
      try {
        Uri post_work_parts_Uri = Uri.parse(ApiEndpoints.post_work_parts_url);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['parts_id'] = parts_id;
        map['parts_name'] = parts_name;
        print(map);
        var post_work_parts_Response = await client.post(post_work_parts_Uri,
            body: (map), headers: await headerWithoutContentTypeENG());
        print(
            "post_work_parts_Response ===========> ${post_work_parts_Response.body}");
        MYAPILOGS(" post work parts Api", post_work_parts_Response);
        if (post_work_parts_Response.statusCode == 200) {
          return jsonDecode(post_work_parts_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(post_work_parts_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future post_SE_work_parts(work_id, parts_id, parts_name) async {
    if (await isConnectedToInternet()) {
      try {
        Uri post_SE_work_parts_Uri =
            Uri.parse(ApiEndpoints.post_work_parts_url);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['parts_id'] = parts_id;
        map['parts_name'] = parts_name;

        var post_SE_work_parts_Response = await client.post(
            post_SE_work_parts_Uri,
            body: map,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS(" post SE work parts Api", post_SE_work_parts_Response);
        if (post_SE_work_parts_Response.statusCode == 200) {
          return jsonDecode(post_SE_work_parts_Response.body);
        } else {
          customFlutterToast(
            jsonDecode(post_SE_work_parts_Response.body)['message'].toString(),
          );
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  Future ENG_Post_FCM_Token(FCM_token, ZegoUserId) async {
    if (await isConnectedToInternet()) {
      try {
        Uri ENG_Post_FCM_Token_Uri = Uri.parse(ApiEndpoints.post_FCM_Token);
        var map = Map<String, dynamic>();
        map['fcm_token'] = FCM_token;
        map['zego_user_id'] = ZegoUserId;
        var ENG_Post_FCM_Token_Response = await client.post(
            ENG_Post_FCM_Token_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS("Eng_Post_FCM_Token Api", ENG_Post_FCM_Token_Response);
        if (ENG_Post_FCM_Token_Response.statusCode == 200) {
          return jsonDecode(ENG_Post_FCM_Token_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(ENG_Post_FCM_Token_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future SE_Post_FCM_Token(FCM_token, ZegoUserId) async {
    if (await isConnectedToInternet()) {
      try {
        Uri Post_FCM_Token_Uri = Uri.parse(ApiEndpoints.post_FCM_Token);
        var map = Map<String, dynamic>();
        map['fcm_token'] = FCM_token;
        map['zego_user_id'] = ZegoUserId;
        var Post_FCM_Token_Response = await client.post(Post_FCM_Token_Uri,
            body: map, headers: await headerWithoutContentTypeSE());
        MYAPILOGS("SE_Post_FCM_Token Api", Post_FCM_Token_Response);
        if (Post_FCM_Token_Response.statusCode == 200) {
          return jsonDecode(Post_FCM_Token_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(Post_FCM_Token_Response.body)['message'].toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  Future send_otp_to_start_wo(work_id, button_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri send_otp_to_start_wo_Uri =
            Uri.parse(ApiEndpoints.send_otp_to_start_wo);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['type'] = button_type;
        var send_otp_to_start_wo_Response = await client.post(
            send_otp_to_start_wo_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS("send_otp_to_start_wo Api", send_otp_to_start_wo_Response);
        if (send_otp_to_start_wo_Response.statusCode == 200) {
          return jsonDecode(send_otp_to_start_wo_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(send_otp_to_start_wo_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future send_otp_to_complete_wo(work_id, button_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri send_otp_to_complete_wo_Uri =
            Uri.parse(ApiEndpoints.send_otp_to_complete_wo);
        var map = Map<String, dynamic>();
        map['work_id'] = work_id;
        map['type'] = button_type;
        var send_otp_to_complete_wo_Response = await client.post(
            send_otp_to_complete_wo_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS(
            "send_otp_to_complete_wo Api", send_otp_to_complete_wo_Response);
        if (send_otp_to_complete_wo_Response.statusCode == 200) {
          return jsonDecode(send_otp_to_complete_wo_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(send_otp_to_complete_wo_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  ///================================================================================================================================///
  Future verify_otp_to_start_wo(otp, work_id, button_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri verify_otp_to_start_wo_Uri =
            Uri.parse(ApiEndpoints.verify_otp_to_start_wo);
        var map = Map<String, dynamic>();
        map['otp'] = otp;
        map['work_id'] = work_id;
        map['type'] = button_type;
        var verify_otp_to_start_wo_Response = await client.post(
            verify_otp_to_start_wo_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS(
            "verify_otp_to_start_wo Api", verify_otp_to_start_wo_Response);
        if (verify_otp_to_start_wo_Response.statusCode == 200) {
          return jsonDecode(verify_otp_to_start_wo_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(verify_otp_to_start_wo_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future verify_otp_to_complete_wo(otp, work_id, button_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri verify_otp_to_complete_wo_Uri =
            Uri.parse(ApiEndpoints.verify_otp_to_complete_wo);
        var map = Map<String, dynamic>();
        map['otp'] = otp;
        map['work_id'] = work_id;
        map['type'] = button_type;
        var verify_otp_to_complete_wo_Response = await client.post(
            verify_otp_to_complete_wo_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS(
            "verify_otp_to_complete Api", verify_otp_to_complete_wo_Response);
        if (verify_otp_to_complete_wo_Response.statusCode == 200) {
          return jsonDecode(verify_otp_to_complete_wo_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(verify_otp_to_complete_wo_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  Future delete_uploaded_files_images(id,work_id,file_name,file_type) async {
    if (await isConnectedToInternet()) {
      try {
        Uri delete_uploaded_files_images_Uri =
            Uri.parse(ApiEndpoints.delete_uploaded_files_images);
        var map = Map<String, dynamic>();
        map['id'] = id;
        map['work_id'] = work_id;
        map['file_name'] = file_name;
        map['file_type'] = file_type;
        var delete_uploaded_files_images_Response = await client.post(
            delete_uploaded_files_images_Uri,
            body: map,
            headers: await headerWithoutContentTypeENG());
        MYAPILOGS(
            "delete_uploaded_files_images Api", delete_uploaded_files_images_Response);
        if (delete_uploaded_files_images_Response.statusCode == 200) {
          return jsonDecode(delete_uploaded_files_images_Response.body);
        } else {
          customFlutterToast(
              jsonDecode(delete_uploaded_files_images_Response.body)['message']
                  .toString());
        }
      } catch (e) {
        debugPrint('Error: $e');
      }
    } else {
      debugPrint("Please Check Internet Connection");
    }
  }

  // Future delete_uploaded_files_images() async {
  //   if (await isConnectedToInternet()) {
  //     try {
  //       Uri delete_uploaded_files_images_Url = Uri.parse(ApiEndpoints.delete_uploaded_files_images);
  //
  //       var delete_uploaded_files_images_Response = await client.delete(delete_uploaded_files_images_Url, headers: await headerWithoutContentType());
  //
  //       MYAPILOGS("Create task Api", delete_uploaded_files_images_Response);
  //       if (delete_uploaded_files_images_Response.statusCode == 200) {
  //         return jsonDecode(delete_uploaded_files_images_Response.body);
  //       } else {
  //         customFlutterToast(
  //             jsonDecode(delete_uploaded_files_images_Response.body)["message"].toString());
  //       }
  //     } catch (e) {
  //       debugPrint('Error: $e');
  //     }
  //   } else {
  //     debugPrint("Please Check Internet Connection");
  //   }
  // }

  ///================================================================================================================================///

  /// ===============================================get Apis=================================================================

  /// Apis for Work order list
  Future get_Work_order_list_for_unaccepted(Work_Order_status1) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Work_order_list_for_unaccepted_Uri =
            Uri.parse("${ApiEndpoints.Work_order_List_Url}$Work_Order_status1");

        var get_Work_order_list_for_unaccepted_Res = await client.get(
            get_Work_order_list_for_unaccepted_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("unaccepted Work order list api",
            get_Work_order_list_for_unaccepted_Res);
        if (get_Work_order_list_for_unaccepted_Res.statusCode == 200) {
          return getWorkOrderListModelFromJson(
              get_Work_order_list_for_unaccepted_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_Work_order_list_for_pending(Work_Order_status2) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Work_order_list_for_pending_uri =
            Uri.parse("${ApiEndpoints.Work_order_List_Url}$Work_Order_status2");

        var get_Work_order_list_for_pending_Res = await client.get(
            get_Work_order_list_for_pending_uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS(
            "pending Work order list api", get_Work_order_list_for_pending_Res);
        if (get_Work_order_list_for_pending_Res.statusCode == 200) {
          return getWorkOrderListModelFromJson(
              get_Work_order_list_for_pending_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///
  Future get_Work_order_details(Work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Work_order_details_uri =
            Uri.parse("${ApiEndpoints.Work_order_detail_Url}$Work_id");
        var get_Work_order_details_Res = await client.get(
            get_Work_order_details_uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get_Work_order_details api", get_Work_order_details_Res);
        if (get_Work_order_details_Res.statusCode == 200) {
          return getWorkorderdetailsModelFromJson(
              get_Work_order_details_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///
  Future get_Work_order_list_for_accelerated(Work_Order_status3) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Work_order_list_for_accelerated_uri =
            Uri.parse("${ApiEndpoints.Work_order_List_Url}$Work_Order_status3");

        var get_Work_order_list_for_accelerated_Res = await client.get(
            get_Work_order_list_for_accelerated_uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("Accelerated Work order list api",
            get_Work_order_list_for_accelerated_Res);
        if (get_Work_order_list_for_accelerated_Res.statusCode == 200) {
          return getWorkOrderListModelFromJson(
              get_Work_order_list_for_accelerated_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_Work_order_list_for_completed(Work_Order_status4) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Work_order_list_for_completed_Uri =
            Uri.parse("${ApiEndpoints.Work_order_List_Url}$Work_Order_status4");

        var get_Work_order_list_for_completed_Uri_Res = await client.get(
            get_Work_order_list_for_completed_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("completed Work order list api",
            get_Work_order_list_for_completed_Uri_Res);
        if (get_Work_order_list_for_completed_Uri_Res.statusCode == 200) {
          return getWorkOrderListModelFromJson(
              get_Work_order_list_for_completed_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_Work_order_list_for_unaccepted(SE_Work_Order_status1) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Work_order_list_for_unaccepted_Uri = Uri.parse(
            "${ApiEndpoints.SE_Work_order_List_Url}$SE_Work_Order_status1");
        var get_SE_Work_order_list_for_unaccepted_Res = await client.get(
            get_SE_Work_order_list_for_unaccepted_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("SE_unaccepted Work order list api",
            get_SE_Work_order_list_for_unaccepted_Res);
        if (get_SE_Work_order_list_for_unaccepted_Res.statusCode == 200) {
          return getSeWorkOrderListModelFromJson(
              get_SE_Work_order_list_for_unaccepted_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_Work_order_list_for_Pending(SE_Work_Order_status2) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Work_order_list_for_Prnding_Uri = Uri.parse(
            "${ApiEndpoints.SE_Work_order_List_Url}$SE_Work_Order_status2");
        var get_SE_Work_order_list_for_Prnding_Res = await client.get(
            get_SE_Work_order_list_for_Prnding_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("SE_Pending Work order list api",
            get_SE_Work_order_list_for_Prnding_Res);
        if (get_SE_Work_order_list_for_Prnding_Res.statusCode == 200) {
          return getSeWorkOrderListModelFromJson(
              get_SE_Work_order_list_for_Prnding_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_Work_order_list_for_Rejected(SE_Work_Order_status3) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Work_order_list_for_accelerated_Uri = Uri.parse(
            "${ApiEndpoints.SE_Work_order_List_Url}$SE_Work_Order_status3");
        var get_SE_Work_order_list_for_accelerated_Res = await client.get(
            get_SE_Work_order_list_for_accelerated_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("SE_Rejected Work order list api",
            get_SE_Work_order_list_for_accelerated_Res);
        if (get_SE_Work_order_list_for_accelerated_Res.statusCode == 200) {
          return getSeWorkOrderListModelFromJson(
              get_SE_Work_order_list_for_accelerated_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_Work_order_list_for_Completed(SE_Work_Order_status4) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Work_order_list_for_Completed_Uri = Uri.parse(
            "${ApiEndpoints.SE_Work_order_List_Url}$SE_Work_Order_status4");
        var get_SE_Work_order_list_for_Completed_Res = await client.get(
            get_SE_Work_order_list_for_Completed_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("SE_Rejected Work order list api",
            get_SE_Work_order_list_for_Completed_Res);
        if (get_SE_Work_order_list_for_Completed_Res.statusCode == 200) {
          return getSeWorkOrderListModelFromJson(
              get_SE_Work_order_list_for_Completed_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_technician_summary(Work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_technician_summary_Uri =
        Uri.parse("${ApiEndpoints.get_technician_summary}$Work_id");
        var get_technician_summary_Response = await client.get(
            get_technician_summary_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get_technician_summary api", get_technician_summary_Response);
        if (get_technician_summary_Response.statusCode == 200) {
          return getTechnicianSummaryModelFromJson(get_technician_summary_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_escalate_data(Work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_escalate_data_Uri =
        Uri.parse("${ApiEndpoints.get_SE_escalate_data}$Work_id");
        var get_escalate_data_Response = await client.get(
            get_escalate_data_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("get_escalate_data api", get_escalate_data_Response);
        if (get_escalate_data_Response.statusCode == 200) {
          return getEscalateDataModelFromJson(get_escalate_data_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }


  ///================================================================================================================================///
  Future get_Parts_list(work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Parts_list_Uri =
            Uri.parse("${ApiEndpoints.get_parts_Url}${work_id}");
        var get_Parts_list_Uri_Res = await client.get(get_Parts_list_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get Parts list api", get_Parts_list_Uri_Res);
        if (get_Parts_list_Uri_Res.statusCode == 200) {
          return getPartsModelFromJson(get_Parts_list_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  /// Api for get profile detail
  Future get_Profile_Details() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Profile_Details_Url =
            Uri.parse(ApiEndpoints.Profile_detail_Url);
        var get_Profile_Details_Response = await client.get(
            get_Profile_Details_Url,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("Get Profile details api", get_Profile_Details_Response);
        if (get_Profile_Details_Response.statusCode == 200) {
          return getProfileDetailsModelFromJson(
              get_Profile_Details_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_Profile_Details() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Profile_Details_Url =
            Uri.parse(ApiEndpoints.SE_Profile_detail_Url);
        var get_SE_Profile_Details_Response = await client.get(
            get_SE_Profile_Details_Url,
            headers: await headerWithContentTypeSE());
        MYAPILOGS(
            "Get SE Profile details api", get_SE_Profile_Details_Response);
        if (get_SE_Profile_Details_Response.statusCode == 200) {
          return getProfileSeDetailsModelFromJson(
              get_SE_Profile_Details_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future get_User_status() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_USer_status_Uri = Uri.parse(ApiEndpoints.get_user_status_Url);
        var get_USer_status_Uri_Res = await client.get(get_USer_status_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get User status api", get_USer_status_Uri_Res);
        if (get_USer_status_Uri_Res.statusCode == 200) {
          return getUserStatusModelFromJson(get_USer_status_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_status() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_status_Uri = Uri.parse(ApiEndpoints.get_SE_status_Url);
        var get_SE_status_Uri_Res = await client.get(get_SE_status_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("get SE status api", get_SE_status_Uri_Res);
        if (get_SE_status_Uri_Res.statusCode == 200) {
          return getUserStatusModelFromJson(get_SE_status_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future get_leave_calender() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_leave_calender_Uri =
            Uri.parse(ApiEndpoints.get_leave_calender_Url);
        var get_leave_calender_Uri_Res = await client.get(
            get_leave_calender_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get leave calender api", get_leave_calender_Uri_Res);
        if (get_leave_calender_Uri_Res.statusCode == 200) {
          return getLeaveCalendarModelFromJson(get_leave_calender_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future get_dashboard_data() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_dashboard_data_Uri =
            Uri.parse(ApiEndpoints.get_dashboard_data_Url);

        var get_dashboard_data_Response = await client.get(
            get_dashboard_data_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get dashboard data api", get_dashboard_data_Response);
        if (get_dashboard_data_Response.statusCode == 200) {
          return getDashboardDataModelFromJson(
              get_dashboard_data_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_SE_dashboard_data() async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_dashboard_data_Uri =
            Uri.parse(ApiEndpoints.SE_Dashboard_data_Url);
        var get_SE_dashboard_data_Response = await client.get(
            get_SE_dashboard_data_Uri,
            headers: await headerWithoutContentTypeSE());
        MYAPILOGS("get SE dashboard data api", get_SE_dashboard_data_Response);
        if (get_SE_dashboard_data_Response.statusCode == 200) {
          return getSeDashbordDataModelFromJson(
              get_SE_dashboard_data_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future eng_get_payout_by_month_list() async {
    try {
      if (await isConnectedToInternet()) {
        Uri eng_get_payout_by_month_list_Uri =
            Uri.parse(ApiEndpoints.get_payout_by_month_Url);
        var eng_get_payout_by_month_list_Response = await client.get(
            eng_get_payout_by_month_list_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get eng_get_payout_by_month_list api",
            eng_get_payout_by_month_list_Response);
        if (eng_get_payout_by_month_list_Response.statusCode == 200) {
          return getPayoutDataModelFromJson(
              eng_get_payout_by_month_list_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future eng_get_view_details_payout_list(month, year) async {
    try {
      if (await isConnectedToInternet()) {
        Uri eng_get_view_details_payout_list_Uri = Uri.parse(
            "${ApiEndpoints.get_payout_by_month2_Url}month=${month}&year=${year}");

        var eng_get_view_details_payout_list_Uri_Res = await client.get(
            eng_get_view_details_payout_list_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("eng_get_view_details_payout_list api",
            eng_get_view_details_payout_list_Uri_Res);
        if (eng_get_view_details_payout_list_Uri_Res.statusCode == 200) {
          return getPayoutViewDetailsModelFromJson(
              eng_get_view_details_payout_list_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future eng_get_transaction_list(Payout_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri eng_get_transaction_list_list_Uri =
            Uri.parse("${ApiEndpoints.get_payout_by_month3_Url}$Payout_id");

        var eng_get_transaction_list_Uri_Res = await client.get(
            eng_get_transaction_list_list_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("eng_get_transaction_list_Uri_Res api",
            eng_get_transaction_list_Uri_Res);
        if (eng_get_transaction_list_Uri_Res.statusCode == 200) {
          return getPayoutTransactionListModelFromJson(
              eng_get_transaction_list_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future SE_get_transaction_list(Payout_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri SE_get_transaction_list_Uri =
            Uri.parse("${ApiEndpoints.SE_get_payout_detail_Url}$Payout_id");

        var SE_get_transaction_list_Uri_Res = await client.get(
            SE_get_transaction_list_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS(
            "SE_get_transaction_list api", SE_get_transaction_list_Uri_Res);
        if (SE_get_transaction_list_Uri_Res.statusCode == 200) {
          return getPayoutSeTransactionListModelFromJson(
              SE_get_transaction_list_Uri_Res.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future SE_payout_list() async {
    try {
      if (await isConnectedToInternet()) {
        Uri SE_payout_list_Uri = Uri.parse(ApiEndpoints.SE_payout_list_Url);
        var SE_payout_list_Response = await client.get(SE_payout_list_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("get SE_payout_list api", SE_payout_list_Response);
        if (SE_payout_list_Response.statusCode == 200) {
          return getSePayoutListFromJson(SE_payout_list_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future get_Add_Parts_list(Work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Add_Parts_list_Uri =
            Uri.parse("${ApiEndpoints.get_Add_Parts_list_Url}$Work_id");
        var get_Add_Parts_list_Response = await client.get(
            get_Add_Parts_list_Uri,
            headers: await headerWithContentTypeENG());
        MYAPILOGS("get Add Parts List api", get_Add_Parts_list_Response);
        if (get_Add_Parts_list_Response.statusCode == 200) {
          return getAddPartsListModelFromJson(get_Add_Parts_list_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  Future get_Add_SE_Parts_list(Work_id) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_Add_SE_Parts_list_Uri =
            Uri.parse("${ApiEndpoints.get_Add_Parts_list_Url}$Work_id");
        var get_Add_SE_Parts_list_Response = await client.get(
            get_Add_SE_Parts_list_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("get SE Add Parts List api", get_Add_SE_Parts_list_Response);
        if (get_Add_SE_Parts_list_Response.statusCode == 200) {
          return getAddPartsListModelFromJson(
              get_Add_SE_Parts_list_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///

  Future get_SE_Call_logs_list(SE_ZegoUserId) async {
    try {
      if (await isConnectedToInternet()) {
        Uri get_SE_Call_logs_list_Uri =
            Uri.parse("${ApiEndpoints.get_SE_Call_logs_Url}${SE_ZegoUserId}");
        var get_SE_Call_logs_list_Response = await client.get(
            get_SE_Call_logs_list_Uri,
            headers: await headerWithContentTypeSE());
        MYAPILOGS("get SE Call logs List api", get_SE_Call_logs_list_Response);
        if (get_SE_Call_logs_list_Response.statusCode == 200) {
          return getSeCallLogsListFromJson(get_SE_Call_logs_list_Response.body);
        } else {
          Result.error("no internet connection");
        }
      } else {
        customFlutterToast("Check your internet...");
      }
    } catch (_) {}
  }

  ///================================================================================================================================///
}

MYAPILOGS(api, response) {
  debugPrint("API Name   $api");
  debugPrint(response.statusCode.toString());
  debugPrint(response.body.toString());
}
