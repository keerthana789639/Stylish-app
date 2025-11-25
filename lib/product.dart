import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylish_app/ads/ads.dart';
import 'package:stylish_app/imageProvider.dart';
import 'package:stylish_app/items.dart';
import 'package:stylish_app/login.dart';
import 'package:stylish_app/personal.dart';
import 'package:stylish_app/productDetailPage.dart';
import 'package:stylish_app/provider/productListing.dart';
import 'package:stylish_app/provider/whishlist.dart';
import 'package:stylish_app/search.dart';

import 'ads/ads.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  int count = 0;
  int? like;
  late Timer timer;
  List categoryList = [];
  String selectedCategory = "";
  List list = [
    "assets/offer-1.jpg",
    "assets/summe_look_blog_banner.png",
    "assets/1__gjo9x4fPSUU6_kKi8GaQQ.jpg",
    "assets/Untitled-2.jpg",
    "assets/59f7cc82759309.63568f216bf2f.webp",
  ];

  void showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return TextButton(
          onPressed: () => Navigator.pop(context),
          child: AlertDialog(
            title: Text("Do your want logout"),
            content: Text(""),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  final keerthy = await SharedPreferences.getInstance();
                  await keerthy.remove("token");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("OK"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("no"),
              ),
            ],

            // Text("OK"),
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> abc = [
    {"img": "assets/images (3).jpeg", "name": "Makeup"},
    {
      "img": "assets/Sa42e27b5cfc24cb69d8be5e102583f7cO.jpg_720x720q80.jpg",
      "name": "mens",
    },
    {
      "img":
          "assets/Tie_Shoulder_Layered_Ruched_Cami_Dress_In_Pink_1024x1024.webp",
      "name": "womens",
    },
    {
      "img": "assets/pngtree-children-clothes-image_2237767.jpg",
      "name": "kids",
    },
    {"img": "assets/8905875578055-18.jpg", "name": "footwear"},
    {
      "img":
          "assets/christmas-fashion-concept-women-accessories-600nw-1470911498.webp",
      "name": "Accessories",
    },
  ];

  List deal = [
    {"img": "assets/download (7).webp", "name": "Handbags", "text": "20 % off"},
    {
      "img": "assets/OIP (38).webp",
      "name": "Apple watches",
      "text": "45 % off",
    },
    {
      "img": "assets/OIP (31).webp",
      "name": "stylish glass",
      "text": "50 % off",
    },
    {"img": "assets/download (11).jpg", "name": "fashion", "text": "40 % off"},
    {"img": "assets/OIP (39).webp", "name": "lip gloss", "text": "50 % off"},
  ];

  // refresh(){
  // WidgetsBinding.instance.addPostFrameCallback((_)async{
  //   Provider.of<GetProducts>(context).product_Api(context);
  //      //print()
  // });

  Future<void> refresh() async {
    Provider.of<GetProducts>(context, listen: false).product_Api(context);
  }

  bool isliked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetProducts>(context, listen: false).product_Api(context);

    timer = Timer.periodic(Duration(seconds: 3), (t) {
      if (count < list.length - 1) {
        setState(() {
          count++;
        });
      } else {
        setState(() {
          count = 0;
        });
      }

      pageController.animateToPage(
        count,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });

    //categorySelection();
  }

  void categorySelection() {
    final backendCatList = Provider.of<GetProducts>(
      context,
      listen: false,
    ).isdata;
    categoryList = backendCatList
        .where((item) => item.category == selectedCategory)
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Items(productList: categoryList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Imagepro>(context);
    final provider = Provider.of<GetProducts>(context);
    final fav = Provider.of<FavoriteProvider>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 114, 121, 222),
            Color.fromARGB(255, 117, 186, 231),
            Color.fromARGB(255, 238, 240, 243),
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: scaffold_key,

        // appBar: AppBar(
        //   leading: CircleAvatar( child: Icon(Icons.menu_sharp)),
        //   centerTitle: true,
        //   title: Image.asset("assets/logoipsum-255 1.png", height: 31),
        //   actions: [CircleAvatar(radius: 30,)],
        // ),
        drawer: Drawer(
          backgroundColor: Color(0xFFB983FF),

          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                SizedBox(height: 60),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: img.image == null
                      ? AssetImage("assets/Mask group (2).png")
                      : FileImage(img.image!),
                ),
                Text("Robert", style: TextStyle(fontSize: 20)),
                SizedBox(height: 20.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.home, size: 20),
                  label: Text("home", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),

                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, size: 20),
                  label: Text("favorite", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.shop_rounded, size: 20),
                  label: Text("orders", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.payment_outlined, size: 20),
                  label: Text("Payment", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings, size: 20),
                  label: Text("Settings", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),
                TextButton.icon(
                  onPressed: () {
                    showAlert();
                  },
                  icon: Icon(Icons.logout, size: 20),
                  label: Text("Logout", style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          color: const Color.fromARGB(255, 235, 204, 214),
          onRefresh: () async {
            await refresh();

            // Optional delay (if needed)
          },

          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          scaffold_key.currentState?.openDrawer();
                        },
                        child: CircleAvatar(
                          radius: 15.h,
                          child: Icon(Icons.menu),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Image.asset("assets/logoipsum-255 1.png", height: 31.h),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Personal()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15.h,
                          backgroundImage: img.image == null
                              ? AssetImage("assets/Mask group (2).png")
                              : FileImage(img.image!),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, right: 10, left: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Search(filter: provider.isdata),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 35.h,
                          width: 340.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.mic),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Featured",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 246, 21, 96),
                          fontSize: 15.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20.h,
                            width: 45.w,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Sort",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Icon(Icons.sort, size: 15),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h, width: 25.w),
                          Container(
                            height: 20.h,
                            width: 45.w,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    SizedBox(width: 6.w),
                                    Icon(Icons.filter_list_alt, size: 12),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 75.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: abc.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategory = abc[index]["name"];
                          });
                          categorySelection();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.r,
                                backgroundImage: AssetImage(abc[index]["img"]),
                              ),
                              SizedBox(height: 5), // space between image & text
                              Text(
                                abc[index]["name"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(
                                    255,
                                    253,
                                    250,
                                    251,
                                  ),
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10.h),

                SizedBox(
                  height: 130.h,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: list.length,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 200.h,
                        width: 340.w,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(list[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return count == index
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            height: 5.h,
                            width: 5.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            height: 5.h,
                            width: 5.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          );
                  }),
                ),

                SizedBox(height: 20.h),
                Container(
                  height: 50.h,
                  width: 343.w,
                  child: Image.asset(
                    "assets/deal of the day.png",
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "   Popular products",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: const Color.fromARGB(255, 249, 247, 247),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 230.h,

                  child: provider.isloading
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 245.h,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.isdata.length,

                          itemBuilder: (context, index) {
                            final products = provider.isdata[index];
                            final likedcount = like == index;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailPage(productid: products),
                                    // on top go to next page
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8),

                                height: 245.h,
                                width: 170.w,

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 130.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                products.image,
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (like == index) {
                                                  like = null;
                                                } else {
                                                  (like = index);
                                                }
                                              });
                                                    //fav.favorite(index,products.id);
                                            },

                                            child: Icon(
                                              Icons.favorite,
                                              color: likedcount
                                                  ? Colors.pinkAccent
                                                  : Colors.blueGrey,

                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.h),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products.name,

                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            products.description,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                          Text(
                                            "₹${products.originalPrice.toString()}",

                                            style: TextStyle(
                                              fontSize: 10.sp,

                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              // Text(
                                              //   products.originalPrice.toString(),

                                              //   style: TextStyle(
                                              //     fontSize: 10.sp,
                                              //     color: Colors.blueGrey,
                                              //     decoration: TextDecoration.lineThrough,
                                              //   ),
                                              // ),
                                              // SizedBox(width: 2.w),
                                              Text(
                                                "₹${products.discount}% off",
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.pinkAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 20,
                                            width: 40,

                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(05),
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  products.rating.toString(),

                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color.fromRGBO(
                                                      7,
                                                      2,
                                                      3,
                                                      1,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 2),
                                                Icon(
                                                  Icons.star,
                                                  size: 13,
                                                  color: Color.fromRGBO(
                                                    18,
                                                    2,
                                                    5,
                                                    1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Row(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 71.h,
                  width: 343.w,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 1)],
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/183362677f20edafc96efa0bc82904f360f38fd3 (1).png",
                        height: 60.h,
                        width: 75.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Special Offers ",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "              We make sure you get the \n              offer you need at best prices",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Ads(),
                SizedBox(height: 10.h),
                Container(
                  height: 170.h,
                  width: 340.w,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Image.asset(
                    "assets/mac.png",
                    height: 150.h,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/deal of the day (1).png"),
                ),
                SizedBox(height: 15),
                Text(
                  "Top Selections",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200.h,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 200,

                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(5),
                                width: 150.w,
                                height: 130.h,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(deal[index]["img"]),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              deal[index]["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                            ),
                            Text(
                              deal[index]["text"],
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 188, 117, 117),
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                Container(
                  height: 220.h,
                  width: 343.w,
                  child: Image.asset(
                    "assets/Group 33769.png",
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                // SizedBox(height: 35.h),
                // Container(
                //   height: 374.h,
                //   width: 350.w,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     image: DecorationImage(
                //       image: AssetImage("assets/Frame 33755.png"),
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
