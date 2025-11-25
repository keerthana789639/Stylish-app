import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/modalClass.dart';
import 'package:stylish_app/productDetailPage.dart';
import 'package:stylish_app/search.dart';
import 'package:stylish_app/shoppingList.dart';

class Items extends StatefulWidget {
  final dynamic productList;
  const Items({super.key,  this.productList});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  
  @override
  Widget build(BuildContext context) {

    
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [
 
  Color.fromARGB(255, 114, 168, 230),
  Color.fromARGB(255, 67, 146, 230),
  Color.fromARGB(255, 179, 207, 244),



      ],
    ),),
      child: Scaffold(
        appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 85, 162, 249),
        
        title: Text(" Items",style: TextStyle(color: const Color.fromARGB(255, 232, 9, 83)),),centerTitle: true,),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
          //    SizedBox(height: 2.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Search(filter: [""],)),
                  );
                },
                child: Container(
                  height: 35.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5.sp),
                        Text(
                          "Search products",
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                        Spacer(),
                        Icon(Icons.mic),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "58,971 + items",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,color: const Color.fromARGB(255, 246, 21, 96),
                      fontSize: 15.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 24.h,
                        width: 55.w,
      
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "  Sort",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(Icons.sort, size: 15),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h, width: 25.w),
                      Container(
                        height: 24.h,
                        width: 55.w,
      
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text(
                              " Filter",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(Icons.filter_list_alt, size: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),SizedBox(height: 10.h,),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
      
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 174.w / 260.h, // width / height ratio
                  ),
                  itemCount: widget.productList.length,

      
                  shrinkWrap: true,
      
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
      
                    final products = widget.productList[index];
                    return InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(productid:widget.productList[index] ,)));
                    },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        // height: 245.h,
                      
                        // width: 164.w
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 136.h,
                                width: 163.w,
                                
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(products.image),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                                                SizedBox(height: 5.h,),
                              Text(
                                products.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                                                
                              Text(
                                products.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                 "₹${products.originalPrice.toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
