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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Bag"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Card
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image:  DecorationImage(
                      image: NetworkImage(widget.products.image), // change to NetworkImage if needed
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.products.name,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        widget.products.description,
                        style: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade600),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text("Size: 42", style: TextStyle(fontSize: 13.sp)),
                          SizedBox(width: 10.w),
                          Text("Qty: 1", style: TextStyle(fontSize: 13.sp)),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Delivery by 10 May 20XX",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.favorite_border, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20.h),

            // Apply Coupons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  Icon(Icons.local_offer_outlined, color: Colors.grey.shade700),
                  SizedBox(width: 10.w),
                  Text("Apply Coupons", style: TextStyle(fontSize: 14.sp)),
                  const Spacer(),
                  Text("Select",
                      style: TextStyle(
                          color:  Colors.pink[400],
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp)),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Payment Details
            newtext(),
            SizedBox(height: 10.h),

            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  _priceRow("Order Amounts", "₹7,000.00"),
                  _priceRow("Convenience", "Know More", rightColor: Colors.red),
                  _priceRow("Delivery Fee", "Free",
                      rightColor: Colors.green.shade700),
                  const Divider(),
                  _priceRow("Order Total", "₹7,000.00",
                      bold: true, fontSize: 15.sp),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "EMI Available   Details",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade700),
              ),
            ),

            SizedBox(height: 25.h),

            // Proceed to Payment Button
            Container(
              width: double.infinity,
              height: 30.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.pink[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)),
                ),
                child: Text(
                  "Proceed to Payment",
                  style: TextStyle(fontSize: 15.sp, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10.h),
            Center(
              child: Text(
                "₹7,000.00  •  View Details",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text newtext() {
    return Text("Order Payment Details",
              style:
                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600));
  }

  Widget _priceRow(String title, String value,
      {Color? rightColor, bool bold = false, double? fontSize}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: fontSize ?? 13.sp, color: Colors.black)),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize ?? 13.sp,
              color: rightColor ?? Colors.black,
              fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
