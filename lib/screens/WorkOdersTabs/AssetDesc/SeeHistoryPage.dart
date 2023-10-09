import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/colorConstant.dart';
class SeeHistoryPage extends StatefulWidget {
  const SeeHistoryPage({super.key});

  @override
  State<SeeHistoryPage> createState() => _SeeHistoryPageState();
}

class _SeeHistoryPageState extends State<SeeHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Vikas",
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            // Icon to represent the drawer
            onPressed: () {
              Navigator.pop(context); // Open the drawer
            },
          ),
        ),
        backgroundColor: appThemeColor,
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Scheduled PMs"),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 5.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.6)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Select a PM Schedule"),
                  ),
                ),
                SizedBox(height: 2.h,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height:5.h,
                    width: 30.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: Center(child: Text("#Task:0")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 5.h,
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width:0.15.h,color: Colors.red),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 5.h,
                  width: 30.w,
                  child: ElevatedButton(
                    onPressed: () async {
                      // await update_profile_detail_controller()
                      //     .update_profile_detail_controller_method(
                      //     nameController.text,
                      //     phoneController.text,
                      //     address1Controller.text,
                      //     address2Controller.text,
                      //     cityController.text,
                      //     stateController.text,
                      //     zipController.text,
                      //     context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appThemeColor,
                      side: BorderSide.none,
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
