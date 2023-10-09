import 'package:cloverleaf_project/core/apiCall.dart';
import '../utils/helperWidget.dart';

class Post_current_location_controller{
  Post_current_location_controller_method(latitude,longitude,address)async{
    var r = await ApiCalling().Post_location(latitude, longitude,address);
    print("||||||||||||||||||$r||||||||||||");
    if(r["status"].toString()=="true"){
      customFlutterToast(r['message'].toString());
    }
  }
}