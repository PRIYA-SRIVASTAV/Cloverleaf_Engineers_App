import 'package:dmms/Constants/colorConstants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class floatPartScreen extends StatefulWidget {
  const floatPartScreen({super.key});

  @override
  State<floatPartScreen> createState() => _floatPartScreenState();
}

class _floatPartScreenState extends State<floatPartScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController sNoController = TextEditingController();
  TextEditingController facController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController bCodeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: appThemeColor,
          title: Text("Create Part",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: Colors.white),),
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        backgroundColor: appThemeColor,
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25)
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                hintText: "Enter Name",

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Facility",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                hintText: "Select an item",
                                suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black87,)

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),

                                  ),
                                  // hintText: "Select Facility",
                                  // suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black87,)

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Type",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter Location",

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Batch Code",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter BarCode",

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("QR Code",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter Category",

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Store Location",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter BarCode",

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Part Location",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter Category",

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Available Count",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter BarCode",

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Threshould Count",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter Category",

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cost Per Piece",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter BarCode",

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bar Code",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                // hintText: "Enter Category",

                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Vendor",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                hintText: "Select an item",
                                suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black87,)

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Asset",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),

                                ),
                                hintText: "Select an item",
                                suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black87,)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w500,color: Colors.black87),),
                            SizedBox(height: 1.h,),
                            TextFormField(
                              controller: typeController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black54,width: 0.3.w),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),

                                  ),
                                  hintText: "Select an item",
                                  suffixIcon: Icon(Icons.arrow_drop_down,color: Colors.black87,)

                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 5.w,),

                    ],
                  ),
                  SizedBox(height: 2.h,),




                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          child: Text("Cancel",style: TextStyle(color: Colors.redAccent,fontSize: 10.sp,fontWeight: FontWeight.w500),),
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Container(
                        width: 40.w,
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(appThemeColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.w500),),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}
