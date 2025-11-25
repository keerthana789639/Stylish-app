

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/checkOut.dart';

class ShoppingBagPage extends StatefulWidget {
  final dynamic products;
  const ShoppingBagPage({super.key, this.products});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  @override
  Widget build(BuildContext context) {

    double originalPrice = widget.products.originalPrice.toDouble();
    double discountPercentage = double.tryParse(widget.products.
    discount) ?? 0;
    double finalPrice =
        originalPrice - (originalPrice * discountPercentage / 100);
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        title: const Text("Shopping Bag"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // -----------------------------------------------------
            // PRODUCT CARD (Modern UI)
            // -----------------------------------------------------
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.network(
                      widget.products.image,
                      height: 110.h,
                      width: 95.w,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.products.name,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.products.description,
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Sizes: ${widget.products.sizes}",
                                  style: TextStyle(
                                      fontSize: 13.sp,fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(137, 7, 5, 5)),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  "Qty: 1",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: const Color.fromARGB(136, 14, 0, 0)),
                                ),
                              ],
                            ),
                            Icon(Icons.favorite_border,
                                color: Colors.grey.shade500)
                          ],
                        ),

                        SizedBox(height: 9.h),
                        Text(
                          "Delivery in 2 days",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // -----------------------------------------------------
            // APPLY COUPONS BAR
            // -----------------------------------------------------
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.local_offer_outlined,
                      color: Colors.pink.shade400),
                  SizedBox(width: 10.w),
                  Text(
                    "Apply Coupons",
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    "Select",
                    style: TextStyle(
                        color: Colors.pink.shade400,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // -----------------------------------------------------
            // PAYMENT DETAILS HEADING
            // -----------------------------------------------------
            Text(
              "Order Payment Details",
              style:
                  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 12.h),

            // -----------------------------------------------------
            // PAYMENT BOX
            // -----------------------------------------------------
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Column(
                children: [
                  _priceTile("Order Amount","₹${originalPrice.toStringAsFixed(0)}",),
                  _priceTile("discount amount", "${discountPercentage.toStringAsFixed(0)}% Off",

                      rightColor: Colors.red),
                  _priceTile("Delivery Fee", "FREE",
                      rightColor: Colors.green.shade700),
                  Divider(),
                  _priceTile("Order Total",   "₹${finalPrice.toStringAsFixed(0)}",
                      isBold: true, size: 15.sp),
                ],
              ),
            ),

            SizedBox(height: 12.h),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Text(
            //     "EMI Available • Details",
            //     style: TextStyle(
            //       fontSize: 12.sp,
            //       color: Colors.grey.shade600,
            //     ),
            //   ),
            // ),

            SizedBox(height: 25.h),

            // -----------------------------------------------------
            // BOTTOM PAYMENT BUTTON
            // -----------------------------------------------------
            SizedBox(
              width: double.infinity,
              height: 45.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout( products: widget.products)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 12.h),
            Center(
              child: Text(
                 "₹${finalPrice.toStringAsFixed(0)} • Final Price",
                style: TextStyle(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------
  Widget _priceTile(String title, String value,
      {Color? rightColor, bool isBold = false, double? size}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: size ?? 14.sp),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: size ?? 14.sp,
              color: rightColor ?? Colors.black,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

