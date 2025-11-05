import 'package:flutter/material.dart';
import 'package:stylish_app/admin.dart';
import 'package:stylish_app/checkOut.dart';
import 'package:stylish_app/items.dart';
import 'package:stylish_app/personal.dart';
import 'package:stylish_app/product.dart';
import 'package:stylish_app/productDetailPage.dart';
import 'package:stylish_app/search.dart';
import 'package:stylish_app/shoppingList.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  List product=[Product(),ProductDetailPage(),Items(),Checkout(),Personal()];
  int valu=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:product[valu],
     
  bottomNavigationBar:      BottomNavigationBar(
         currentIndex :valu ,
        onTap: (value) {
          setState(() {
            valu = value;
            
          });
        },
       selectedItemColor:  Colors.pink[400],
       unselectedItemColor: Colors.black,
       
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "card"),
           BottomNavigationBarItem(icon: Icon(Icons.receipt_long,), label: "orders"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "profile"),
          
         ],
       ),
    );
  }
}


