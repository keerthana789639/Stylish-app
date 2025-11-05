// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class Checkout extends StatefulWidget {

//   const Checkout({super.key});

//   @override
//   State<Checkout> createState() => _CheckoutState();
// }

// class _CheckoutState extends State<Checkout> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:  Color.fromRGBO(241, 214, 214, 1),
//         leading: Icon(Icons.arrow_back_ios),
//         centerTitle: true,
//         title: Text(
//           "Check Out",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Order",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//                 Text(
//                   "₹ 7000",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Shoping",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//                 Text(
//                   "₹ 30",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//               ],
//             ),SizedBox(height: 20.h,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Total",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//                 Text(
//                   "₹ 7030",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),
//               ],
//             ),SizedBox(height: 20.h,),
//             Container(height: 1.h,width: 314.w,color:const Color.fromRGBO(168, 168, 169, 1)),SizedBox(height: 20.h,),
//             Text(
//                   "Payment",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 15.sp,
//                   ),
//                 ),SizedBox(height: 20.h,),

//                  PaymentCard(
//              iconPath: "assets/visa 1.png",
           
              
//               number: "********2109",
//               borderColor:  const Color.fromARGB(255, 240, 237, 238),
//             ),SizedBox(height: 20.h,),
//                  PaymentCard(
//              iconPath: "assets/paypal.png",
           
              
//               number: "********2109",
//               borderColor: const Color.fromARGB(255, 240, 237, 238),
//             ),SizedBox(height: 20.h,),
//                  PaymentCard(
//              iconPath: "assets/maestro 1.png",
           
              
//               number: "********2109",
//               borderColor:  const Color.fromARGB(255, 240, 237, 238),
//             ),SizedBox(height: 20.h,),
//                  PaymentCard(
//              iconPath: "assets/applepay.png",
           
              
//               number: "********2109",
//               borderColor: const Color.fromARGB(255, 240, 237, 238),
//             ),SizedBox(height: 30.h,), ElevatedButton(
//                   onPressed: () {
                
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(365.w, 40.h),
//                     backgroundColor: Color.fromARGB(255, 239, 102, 124),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusGeometry.circular(5),
//                     ),
//                   ),
//                   child: Text(
//                     "Continue",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
            

//           ],
//         ),
//       ),
//     );
//   }
// }


// class PaymentCard extends StatelessWidget {
//   final String iconPath;
  
//   final String number;
//   final Color borderColor;

//   const PaymentCard({
//     super.key,
//     required this.iconPath,
    
//     required this.number,
//     required this.borderColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: borderColor, width: 1.3),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Image.asset(iconPath, height: 20.h),
              
//             ],
//           ),
//           Text(number),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  void alert(){
  showDialog(context: context, 
  builder:(BuildContext context ){
    return AlertDialog(backgroundColor: Colors.white,
    
  title: Image.asset("assets/images.png",height: 100.h,),
  content: Text("            Payment done successfully",style: TextStyle(fontWeight: FontWeight.w700),),
  
  actions: [Row
  (mainAxisAlignment: MainAxisAlignment.center,
    children: [
    ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text("Ok")),
    ],
  ),]
 );
  
}); }

  
  
  
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(

        
      // leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),
      //   onPressed: (){Navigator.pop(context);


      //   }, ),
        centerTitle: true,
        title: Text(
          "Payment",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: const Color.fromARGB(255, 13, 7, 7)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Order Summary Card
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6, offset: Offset(0, 3))],
              ),
              child: Column(
                children: [
                  summaryRow("Order", "₹ 7000"),
                  SizedBox(height: 10.h),
                  summaryRow("Shipping", "₹ 30"),
                  Divider(color: Colors.grey[300], thickness: 1, height: 25.h),
                  summaryRow("Total", "₹ 7030", isTotal: true),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            Text("Payment Methods", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black87)),
            SizedBox(height: 20.h),

            PaymentCard(iconPath: "assets/visa 1.png", number: "**** 2109", borderColor: Colors.grey.shade300),
            SizedBox(height: 15.h),
            PaymentCard(iconPath: "assets/paypal.png", number: "**** 2109", borderColor: Colors.grey.shade300),
            SizedBox(height: 15.h),
            PaymentCard(iconPath: "assets/maestro 1.png", number: "**** 2109", borderColor: Colors.grey.shade300),
            SizedBox(height: 15.h),
            PaymentCard(iconPath: "assets/applepay.png", number: "**** 2109", borderColor: Colors.grey.shade300),

            Spacer(),

            Center(
              child: ElevatedButton(
                onPressed: () {alert();

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.h),
                  backgroundColor: Colors.pink[400],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text("Continue", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: isTotal ? 16.sp : 14.sp, fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500)),
        Text(value, style: TextStyle(fontSize: isTotal ? 16.sp : 14.sp, fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500)),
      ],
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String iconPath;
  final String number;
  final Color borderColor;

  const PaymentCard({
    super.key,
    required this.iconPath,
    required this.number,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconPath, height: 25.h),
              SizedBox(width: 10.w),
            ],
          ),
          Text(number, style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
