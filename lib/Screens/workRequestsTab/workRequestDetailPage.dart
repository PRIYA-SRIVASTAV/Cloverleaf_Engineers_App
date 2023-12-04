
import 'package:dmms/Constants/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';


class workRequestDetailPage extends StatefulWidget {
  const workRequestDetailPage({super.key});

  @override
  State<workRequestDetailPage> createState() => _workRequestDetailPageState();
}

class _workRequestDetailPageState extends State<workRequestDetailPage> {
  // File? imageFile;
  var getResult ='QR Code Result';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Work Request",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
          leading: Builder(
            builder: (context)=>IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          ),
          backgroundColor: appThemeColor,
          elevation: 0,
        ),
        backgroundColor: appThemeColor,
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),

            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Problem Statement",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                      SizedBox(width: 1.w,),
                      Text("*",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: appThemeColor),)
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Container(
                    child:  TextFormField(
                      decoration: InputDecoration(
                        // label: Text("Enter Your name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Pump Problem"
                      ),

                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Text(
                    "Photos",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp),
                  ),

                  // Column(
                  //   children: [
                  //     SizedBox(
                  //       height: 0.5.h,
                  //     ),
                  //     imageFile == null
                  //         ? Container(
                  //       height: 20.h,
                  //       width: double.infinity,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.grey)),
                  //       child: InkWell(
                  //         onTap: () async {
                  //           Map<Permission, PermissionStatus>
                  //           statuses = await [
                  //             Permission.storage,
                  //             Permission.camera,
                  //           ].request();
                  //           if (statuses[Permission.storage]!
                  //               .isGranted &&
                  //               statuses[Permission.camera]!
                  //                   .isGranted) {
                  //             showImagePicker(context);
                  //           } else {
                  //             print('No Permission provided');
                  //           }
                  //         },
                  //         child: Center(
                  //             child: Text("Attach Screenshot")),
                  //       ),
                  //     )
                  //         : ClipRRect(
                  //       borderRadius: BorderRadius.circular(150.0),
                  //       child: Image.file(
                  //         imageFile!,
                  //         height: 300.0,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 1.h,),
                  Container(
                    width: 100.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54,width: 0.3.w),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 80.w,
                            height: 17.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image_outlined,color: Colors.blueAccent,size: 40.sp,),
                                Text("Upload asset Image",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.blueAccent),)
                              ],
                            ),
                            
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text("Description",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 1.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      // label: Text("Enter Your name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: "Enter Problem Description"
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(height: 2.h,),
                  Text("Asset",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      Container(
                        width: 80.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54,width: 0.3.w),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Flat bed Diecutter",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                              Icon(Icons.keyboard_arrow_down,color: Colors.black87,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      InkWell(
                        onTap: (){
                          scanQRCode();
                        },
                          child: Icon(Icons.qr_code_scanner,color: appThemeColor,size: 25.sp,))
                    ],
                  ),
                  SizedBox(height:2.h),
                  Text("Comments",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                  SizedBox(height: 1.h,),
                  Container(
                    height: 20.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54,width: 0.3.w)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text("No Comments",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500,color: Colors.black54),),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.black54),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(cursorColor: appThemeColor,
                            decoration: InputDecoration(
                              focusColor: appThemeColor,
                              hintText: "Add a comment",
                              suffixIcon: InkWell(
                                  onTap: (){},
                                  child: Icon(Icons.send, color: appThemeColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                  Container(

                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black54,width: 0.3.w),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("Approved",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),)),
                      ),
                    ),
                  )
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void scanQRCode() async{
    try{
      final qrCode =  await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if(!mounted) return;

      setState(() {
        getResult=qrCode;
      });

      print("QRCode_Result:--");
      print(qrCode);
    }on PlatformException{
      var getResult = 'Failed to scan QR Code.';
    }
  }


  // final picker = ImagePicker();
  //
  // void showImagePicker(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Card(
  //           child: Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: MediaQuery.of(context).size.height / 5.2,
  //             margin: const EdgeInsets.only(top: 8.0),
  //             padding: const EdgeInsets.all(12),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Expanded(
  //                     child: InkWell(
  //                       child: Column(
  //                         children: [
  //                           Icon(
  //                             Icons.image,
  //                             size: 60.0,
  //                           ),
  //                           SizedBox(
  //                             height: 12.0,
  //                           ),
  //                           Text(
  //                             "Gallery",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontSize: 16, color: Colors.black),
  //                           )
  //                         ],
  //                       ),
  //                       onTap: () {
  //                         _imgFromGallery();
  //                         Navigator.pop(context);
  //                       },
  //                     )),
  //                 Expanded(
  //                     child: InkWell(
  //                       child: Column(
  //                         children: [
  //                           Icon(
  //                             Icons.camera_alt,
  //                             size: 60.0,
  //                           ),
  //                           SizedBox(
  //                             height: 12.0,
  //                           ),
  //                           Text(
  //                             "Camera",
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(fontSize: 16, color: Colors.black),
  //                           )
  //                         ],
  //                       ),
  //                       onTap: () {
  //                         _imgFromCamera();
  //                         Navigator.pop(context);
  //                       },
  //                     )),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
  //
  // _imgFromGallery() async {
  //   await picker
  //       .pickImage(source: ImageSource.gallery, imageQuality: 50)
  //       .then((value) {
  //     if (value != null) {
  //       // _cropImage(File(value.path));
  //     }
  //   });
  // }
  //
  // _imgFromCamera() async {
  //   await picker
  //       .pickImage(source: ImageSource.camera, imageQuality: 50)
  //       .then((value) {
  //     if (value != null) {
  //       // _cropImage(File(value.path));
  //     }
  //   });
  // }
}
