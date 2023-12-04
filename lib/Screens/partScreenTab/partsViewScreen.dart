
import 'package:dmms/Screens/partScreenTab/partCardViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../Constants/colorConstants.dart';
import '../../Constants/string.dart';
import '../CommonScreen/DrawerNavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../assetsTab/asstesCardViewPage.dart';

class partViewScreen extends StatefulWidget {
  const partViewScreen({super.key});

  @override
  State<partViewScreen> createState() => _partViewScreenState();
}

class _partViewScreenState extends State<partViewScreen> {
  var getResult ='QR Code Result';

  final List<Map<String, dynamic>> _allAssets = [
    {
      "id": 1,
      "partName": "Bearing",
      "facility": "Shopfloor",
      "availableCount": "2"
    },
    {
      "id": 2,
      "partName": "Bearing-6204-2Z",
      "facility": "Shopfloor",
      "availableCount": "5"
    },
    {
      "id": 3,
      "partName": "Potentio Meter",
      "facility": "Shopfloor",
      "availableCount": "3"
    },
    {
      "id": 4,
      "partName": "Bearing Small",
      "facility": "Shopfloor",
      "availableCount": "56"
    },
    {
      "id": 5,
      "partName": "Proximity Switch",
      "facility": "Shopfloor",
      "availableCount": "2"
    },
    {
      "id": 6,
      "partName": "Proximity Switch",
      "facility": "Shopfloor",
      "availableCount": "2"
    },
  ];

  List<Map<String, dynamic>> _foundAssets = [];

  @override
  void initState() {
    _foundAssets = _allAssets;
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAssets;
    } else {
      results = _allAssets
          .where((user) =>
          user["partName"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundAssets = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: appThemeColor,
        title: Text(
          "Parts",
          style: GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w500,color: Colors.white),
          // GoogleFonts.roboto(
        ),
        actions: [
          IconButton(
              onPressed: () {
                scanQRCode();
              },
              icon: Icon(
                Icons.qr_code_scanner,
                size: 20.sp,
                color: Colors.white,
              )),
        ],
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu,color: Colors.white,)),
        ),
      ),
      drawer: const AppDrawer(),
      backgroundColor: appThemeColor,
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(30.0),
              topRight: Radius.circular(30.0)
          ),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search, color: Colors.black54),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search Assets",
                      hintStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: 2.h,),
              Expanded(
                child: ListView.builder(
                  itemCount: _foundAssets.length,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 2),
                        child: Container(
                          width: 100.w,
                          height: 12.h,

                          decoration: BoxDecoration(

                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                blurRadius: 20.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: const Offset(
                                  5.0, // Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  partCardViewScreen()),
                              );
                            },
                            child: Card(color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 2,
                              key: ValueKey(_foundAssets[index]["id"]),
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     _foundAssets[index]['partName'],
                                     style: GoogleFonts.openSans(
                                         fontSize: 10.sp,
                                         fontWeight: FontWeight.w700,
                                         color: Colors.black87),
                                   ),
                                   SizedBox(height: 0.5.h,),
                                 Row(
                                   children: [
                                     Text("Facility",style: GoogleFonts.openSans(
                                         fontSize: 10.sp,
                                         fontWeight: FontWeight.w700,
                                         color: Colors.black54),),
                                     SizedBox(width: 2.w,),
                                     Text(
                                       _foundAssets[index]['facility'],
                                       style: GoogleFonts.openSans(
                                           fontSize: 10.sp,
                                           fontWeight: FontWeight.w700,
                                           color: Colors.black87),
                                     ),
                                   ],
                                 ),
                                   SizedBox(height: 0.5.h,),
                                  Row(
                                    children: [
                                      Text("Available Count",style: GoogleFonts.openSans(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black54),),
                                      SizedBox(width: 2.w,),
                                      Text(
                                        _foundAssets[index]['availableCount'],
                                        style: GoogleFonts.openSans(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  )
                                 ],
                               ),
                             ),
                            ),
                          ),
                        ),
                      );
                }),
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
