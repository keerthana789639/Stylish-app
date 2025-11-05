import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Shoppinglist extends StatefulWidget {
  const Shoppinglist({super.key});

  @override
  State<Shoppinglist> createState() => _ShoppinglistState();
}

class _ShoppinglistState extends State<Shoppinglist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 214, 214, 1),
        leading: Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: InkWell(onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>()))
        },
          child: Text(
            "Check Out",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19.sp),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    "Delivary Address",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                ],
              ),SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    height: 79.h,
                    width: 241.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address :",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),SizedBox(height: 3.h,),
                          Text(
                            "216 St Paul's Rd, London N1 2LL, UK",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            "contact:5896317335",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Container(
                    height: 78.h,
                    width: 78.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo_outlined),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                "Shopping List",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19.sp),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  //   height: 191.h,
                  width: 331.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: const Color.fromARGB(255, 184, 178, 178),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 125.h,
                            width: 130.w,child: Image.asset("assets/Mask group (1).png",fit: BoxFit.fill,),
                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(8)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Women’s Casual Wear",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Variations : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(39.w, 17.h),
                                      shape: BeveledRectangleBorder(),
                                    ),
          
                                    child: Text(
                                      "Black",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(39.w, 17.h),
                                      shape: BeveledRectangleBorder(),
                                    ),
                                    child: Text(
                                      "red",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "4********",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 29.h,
                                    width: 84.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 10, spreadRadius: -8),
                                      ],
                                    ),
                                    child: Center(child: Text("₹34.00")),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "50% Off",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color.fromRGBO(253, 110, 135, 1),
                                        ),
                                      ),
                                      Text(
                                        "₹1,500",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(height: 1.h, width: 300.h, color: Colors.grey),
                      SizedBox(height: 20.h),
          
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total order :",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          Text("₹ 34.00",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  //   height: 191.h,
                  width: 331.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: const Color.fromARGB(255, 184, 178, 178),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 125.h,
                            width: 130.w,
                            child: Image.asset("assets/Mask group (2).png",fit: BoxFit.fill,),
                            decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(8)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Women’s Casual Wear",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Variations : ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(39.w, 17.h),
                                      shape: BeveledRectangleBorder(),
                                    ),
          
                                    child: Text(
                                      "Black",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size(39.w, 17.h),
                                      shape: BeveledRectangleBorder(),
                                    ),
                                    child: Text(
                                      "red",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "4********",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 29.h,
                                    width: 84.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 10, spreadRadius: -8),
                                      ],
                                    ),
                                    child: Center(child: Text("₹34.00")),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "50% Off",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Color.fromRGBO(253, 110, 135, 1),
                                        ),
                                      ),
                                      Text(
                                        "₹1,500",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(height: 1.h, width: 300.h, color: Colors.grey),
                      SizedBox(height: 20.h),
          
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total order :",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          Text("₹ 34.00",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
