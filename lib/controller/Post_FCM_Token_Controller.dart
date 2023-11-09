import 'package:cloverleaf_project/core/apiCall.dart';
import '../utils/helperWidget.dart';

class Post_FCM_Token_Controller{
  Eng_Post_FCM_Token_Controller_method(FCM_token,zego_user_id)async{
    var r = await ApiCalling().ENG_Post_FCM_Token(FCM_token,zego_user_id);
    print("-------Eng FCM Token-------> ${r}");
    if(r["status"].toString()=="true"){
      print("FCM Token Updated");
     // customFlutterToast(r['message'].toString());
    }
  }
  SE_Post_FCM_Token_Controller_method(FCM_token,zego_user_id)async{
    var r = await ApiCalling().SE_Post_FCM_Token(FCM_token,zego_user_id);
    print("-------SE FCM Token-------> ${r}");
    if(r["status"].toString()=="true"){
      print("FCM Token Updated");
      //customFlutterToast(r['message'].toString());
    }
  }
}