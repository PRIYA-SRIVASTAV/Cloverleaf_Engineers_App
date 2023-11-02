import 'package:cloverleaf_project/core/apiCall.dart';

class Post_FCM_Token_Controller{
  Post_FCM_Token_Controller_method(FCM_token)async{
    var r = await ApiCalling().Post_FCM_Token(FCM_token);
    print("-------FCM Token-------> ${r}");
    if(r["status"].toString()=="true"){
      print("FCM Token Updated");
      //customFlutterToast(r['message'].toString());
    }
  }
}