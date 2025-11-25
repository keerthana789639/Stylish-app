

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Checkout extends StatefulWidget {
   final dynamic products;
  const Checkout({super.key, this.products});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  int selectedIndex = -1;   // for selecting payment method

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Image.asset("assets/images.png", height: 90.h),
            SizedBox(height: 10.h),
            Text(
              "Payment Successful!",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          "Your transaction has been completed successfully.",
          style: TextStyle(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        double originalPrice = widget.products.originalPrice.toDouble();
    double discountPercentage = double.tryParse(widget.products.
    discount) ?? 0;
    double finalPrice =
        originalPrice - (originalPrice * discountPercentage / 100);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ORDER SUMMARY CARD
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
              ),
              child: Column(
                children: [
                  summaryRow("Price", "₹${originalPrice.toStringAsFixed(0)}"),
                  SizedBox(height: 10.h),
                  summaryRow("Discount",  "${discountPercentage.toStringAsFixed(0)}%"),
                  Divider(color: Colors.grey[300], thickness: 1, height: 25.h),
                  summaryRow("Total",   "₹${finalPrice.toStringAsFixed(0)}", isTotal: true),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Text(
              "Payment Methods",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),

            // PAYMENT METHODS LIST
            paymentTile(0, "assets/visa 1.png", ""),
            SizedBox(height: 15.h),
            paymentTile(1, "assets/paypal.png", ""),
            SizedBox(height: 15.h),
            paymentTile(2, "assets/maestro 1.png", ""),
            SizedBox(height: 15.h),
            paymentTile(3, "assets/applepay.png", ""),
SizedBox(height: 25.h,)     ,       ElevatedButton(
              onPressed: () {
                if (selectedIndex == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select a payment method"))
                  );
                } else {
                  showSuccessDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 35.h),
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget summaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: isTotal ? 16.sp : 14.sp, fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500),
        ),
        Text(
          value,
          style: TextStyle(fontSize: isTotal ? 16.sp : 14.sp, fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500),
        ),
      ],
    );
  }

  Widget paymentTile(int index, String icon, String number) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: isSelected ? 8 : 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(icon, height: 28.h),
                SizedBox(width: 12.w),
                Text(number, style: TextStyle(fontSize: 14.sp)),
              ],
            ),

            // selection indicator
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

