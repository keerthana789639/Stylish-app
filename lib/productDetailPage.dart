import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish_app/provider/productListing.dart';
import 'package:stylish_app/shoppingBagPage.dart';
import 'package:stylish_app/shoppingList.dart';

class ProductDetailPage extends StatefulWidget {
  final dynamic productid;
  const ProductDetailPage({super.key, this.productid});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<String> getSizesForCategory(String category) {
    // Dress sizes for mens/womens
    if (category == "mens" || category == "womens") {
      return ["XS", "S", "M", "L", "XL"];
    }
    // Footwear sizes
    else if (category == "footwear") {
      return [
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
      ]; // Default footwear sizes
    }

    // For any other category
    return [];
  }

  String selectedSize = "";

  // default selected

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  Provider.of<GetProducts>(context, listen: false).singleproductApi(context,widget.productid);
  }

  @override
  Widget build(BuildContext context) {
    double originalPrice = widget.productid.originalPrice.toDouble();
    double discountPercentage = double.tryParse(widget.productid.discount) ?? 0;
    double finalPrice =
        originalPrice - (originalPrice * discountPercentage / 100);

    //   final provider = Provider.of<GetProducts>(context);
    // var products =
    // provider.issingledata;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Color(0xFFE0E0E0),


        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(onTap: () {
                                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Shoppinglist(),
                        ),
                      );
          },
            
            child: Icon(Icons.shopping_cart_outlined, color: Colors.black)),
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
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.productid.image,
                    ), // your image here
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              // Text(
              //   "$selectedSize",
              //   style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              // ),

              SizedBox(height: 10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // for (var size in ["xs", "s", "m", "L", "xl"])
                    for (var size in getSizesForCategory(
                      widget.productid.category,
                    ))

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        
                        child:
                         ChoiceChip(
                          label: Text(size),
                          selected: selectedSize == size,
                          selectedColor: Color.fromRGBO(253, 110, 135, 1),
                          backgroundColor: Colors.grey[200],
                          onSelected: (bool selected) {
                            setState(() {
                              selectedSize = selected ? size : size;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              // 🏷 Product Title and Price
              Text(
                widget.productid.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.productid.description,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 20,
                width: 40,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(05),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Text(
                      widget.productid.rating.toString(),

                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color.fromRGBO(253, 110, 135, 1),
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.star,
                      size: 13,
                      color: Color.fromRGBO(253, 110, 135, 1),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              Row(
                children: [
                  Text(
                    "₹${originalPrice.toStringAsFixed(0)}",

                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "₹${finalPrice.toStringAsFixed(0)}",

                    style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "${discountPercentage.toStringAsFixed(0)}% Off",

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
              SizedBox(height: 10.h),
              Text(
                widget.productid.productDetails,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShoppingBagPage(products: widget.productid),
                        ),
                      );
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
                  childAspectRatio: 174.w / 250.h, // width / height ratio
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
                    child: Align(
                      alignment: Alignment.topCenter,
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
                          ),
                          Text(
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

}


