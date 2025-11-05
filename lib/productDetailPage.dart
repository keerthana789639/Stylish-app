import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish_app/provider/productListing.dart';
import 'package:stylish_app/shoppingBagPage.dart';

class ProductDetailPage extends StatefulWidget {

  final dynamic productid;
  const ProductDetailPage({super.key, this.productid});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  
  String selectedSize = "9 UK";
  // default selected

  final List<String> sizes = ["6 UK", "7 UK", "8 UK", "9 UK"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   //  Provider.of<GetProducts>(context, listen: false).singleproductApi(context,widget.productid);
  }

  @override
  Widget build(BuildContext context) {
 //   final provider = Provider.of<GetProducts>(context);
 // var products = provider.issingledata;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(252, 251, 251, 1),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🖼 Product Image
              Container(
                height: 235.h,
                width: 339.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image:  DecorationImage(
                    image: NetworkImage(
             widget.productid.image
                    ), // your image here
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Size:7uk",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),

              SizedBox(height: 12.h),

              //
              //🔢 Size Selection
              //  Row(children: [ChoiceChip(label: Text("6 uk"), selected:true )],),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var size in ["6 UK", "7 UK", "8 UK", "9 UK", "10 UK"])
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(size),
                          selected:
                              selectedSize ==
                              size, // 🔹 only one is true at a time
                          selectedColor: Color.fromRGBO(
                            253,
                            110,
                            135,
                            1,
                          ), // color when selected
                          backgroundColor: Colors.grey[200],
                          labelStyle: TextStyle(
                            color: selectedSize == size
                                ? Colors.white
                                : Colors.black,
                          ),
                          onSelected: (bool value) {
                            setState(() {
                              selectedSize = size; // ✅ update when clicked
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // 🏷 Product Title and Price
              Text(
               widget.productid.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
widget.productid.description,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.productid.reviewsCount.toString(),
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
              SizedBox(width: 8.w),
              Row(
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    widget.productid.originalPrice.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "₹1,500",
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    widget.productid.discount.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color.fromRGBO(253, 110, 135, 1),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Text(
                "Product Details",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(widget.productid.productDetails,
                style: TextStyle(color: Colors.grey[800], height: 1.4),
              ),
              SizedBox(width: 10.w),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.store, size: 16.sp, color: Colors.black),
                    label: Text(
                      "Nearest Store",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(60.w, 20.h),
                      shape: BeveledRectangleBorder(),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.workspace_premium,
                      size: 16.sp,
                      color: Colors.black,
                    ),
                    label: Text(
                      "VIP",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(70.w, 16.h),
                      shape: BeveledRectangleBorder(),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.assignment_return,
                      size: 16.sp,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Return Policy",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(70.w, 16.h),
                      shape: BeveledRectangleBorder(),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5.h),

              // 🛒 Buttons
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(120, 40),
                      shape: ContinuousRectangleBorder(),
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black26),
                    ),
                    onPressed: () {},

                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart, size: 18),
                        Text("Go to Cart"),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(120.w, 40.h),
                      shape: BeveledRectangleBorder(),
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingBagPage(products: widget.productid,)));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.ads_click_outlined, size: 18.sp),
                        Text("Buy Now"),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.pinkAccent,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Delivery ",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "1 with in Hour",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility,
                      size: 18.sp,
                      color: Colors.black,
                    ),
                    label: Text(
                      "View to Similar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(100.w, 40.h),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.compare_arrows,
                      size: 18.sp,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Add to Compare",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size(80.w, 40.h),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // 🧩 Similar Products
              Text(
                "Similar To",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "58,971 + items",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(width: 80),
                  Container(
                    height: 24.h,
                    width: 61.w,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Sort",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    height: 24.h,
                    width: 61.w,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "fitters",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 174.w / 285.h, // width / height ratio
                ),
                itemCount: 4,
                physics:
                    NeverScrollableScrollPhysics(), // 👈 disable internal scroll
                shrinkWrap: true,

                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Align(alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            height: 136.h,
                            width: 163.w,
                            child: Image.asset(
                              "assets/unsplash_yTBMYCcZQRs.png",
                              fit: BoxFit.fill,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),  Text(
                              "Jordan Stay",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                              ),
                            ),
                           
                            Text(
                              "The classic Air Jordan 12 to\n create a shoe that's fres...",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              '\u20B9 5998.0',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //   Widget _similarProduct(String image, String name, String price) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 10.w),
  //       width: 140.w,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12),
  //         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ClipRRect(
  //             borderRadius:
  //                 const BorderRadius.vertical(top: Radius.circular(12)),
  //             child: Image.asset(image, height: 120.h, fit: BoxFit.cover),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.all(8.w),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(name,
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(fontSize: 13.sp)),
  //                 Text(price,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold, fontSize: 14.sp)),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
}
