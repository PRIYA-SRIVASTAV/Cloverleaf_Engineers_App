import 'package:dmms/Constants/colorConstants.dart';
import 'package:dmms/Constants/textstyleConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:sizer/sizer.dart';

import '../CommonScreen/DrawerNavBar.dart';

class metersPage extends StatefulWidget {
  const metersPage({super.key});

  @override
  State<metersPage> createState() => _metersPageState();
}

class _metersPageState extends State<metersPage> {
  var getResult ='QR Code Result';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meters",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w500),),
          actions: [
            IconButton(onPressed: (){
              scanQRCode();
            }, icon:Icon(Icons.qr_code_scanner,size: 20.sp,color: Colors.white,)),
          ],
          leading: Builder(
            builder: (context)=>
                IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu,color: Colors.white,)),

          ),
          backgroundColor: appThemeColor,
          elevation: 0,

        ),
        drawer: const AppDrawer(),
        backgroundColor: appThemeColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: TabBar(
                  labelStyle: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor:Colors.white ,
                  tabs: const[
                    Tab(
                      text: "All Meters",
                    ),
                    Tab(
                      text: "Meter Groups",
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 69.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                child:  Padding(
                  padding: EdgeInsets.all(15),
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.search_rounded,color: Colors.black54,),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Search Meters",
                                hintStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54)
                              ),
                            )
                          ),
                          SizedBox(height: 10.h,),
                          Text("No Meters Available",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.search_rounded,color: Colors.black54,),
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Search Groups",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54)
                                ),
                              )
                          ),
                          SizedBox(height: 10.h,),
                          Text("No Group Available",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
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
      getResult = 'Failed to scan QR Code.';
    }
  }
}
