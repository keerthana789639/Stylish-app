import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:stylish_app/listingProducts.dart';
import 'package:stylish_app/provider/productListing.dart';

class Updatedetails extends StatefulWidget {
  final dynamic productid;
  const Updatedetails({super.key, this.productid});

  @override
  State<Updatedetails> createState() => _UpdatedetailsState();
}

class _UpdatedetailsState extends State<Updatedetails> {
 
       TextEditingController nameController = TextEditingController();
  TextEditingController hashtagController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController categoryController = TextEditingController();

  TextEditingController originalpriceController = TextEditingController();
  TextEditingController dicountController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  TextEditingController productadetailsController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController reviewsCountController = TextEditingController();
  


  Future <void> putApi(id)async{
    String url= "https://coffee-app-backend-c3n7.onrender.com/myfiles/edit/$id";
    try{
var response = await http.put(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": nameController.text,
          "hastag":hashtagController.text,
          "description":descriptionController.text,
          "image":imageController.text,
          "originalPrice":originalpriceController.text,
          "discount":dicountController.text,
          "productDetails":productadetailsController.text,
          "rating":ratingController.text,
          "reviewCount":reviewsCountController.text,

          





        }),
      );
      var data = jsonDecode(response.body);
      print(data);
         print(response.statusCode);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("api success");

    }}
    catch(e){
      print("ERROR $e");
    };
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.productid.name;
    imageController.text = widget.productid.image;
    originalpriceController.text = widget.productid.originalPrice.toString();
   descriptionController.text = widget.productid.description;
  hashtagController.text = widget.productid.hashtag;
 dicountController.text = widget.productid.discount.toString();
  productadetailsController.text = widget.productid.productDetails;
  ratingController.text = widget.productid.rating.toString();
  reviewsCountController.text = widget.productid.reviewsCount.toString();
   categoryController.text = widget.productid.category;


  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(  body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              TextFormField(controller: nameController,
                decoration: InputDecoration(labelText: "name",labelStyle: TextStyle(color: Colors.black),
                
              
              ),
             ),
          
              TextFormField(controller:descriptionController ,
                decoration: InputDecoration(labelText: "description",
              
              )),
          
           
              TextFormField(controller: hashtagController,
                decoration: InputDecoration(labelText: "hashtag",
              
              )),
          
              TextFormField(controller: imageController,
                decoration: InputDecoration(labelText: "image",
              
              )),
          
              TextFormField(controller:originalpriceController ,
                decoration: InputDecoration(labelText: "originalprice",
              
              )),
          
              TextFormField(controller: dicountController,
                decoration: InputDecoration(labelText: "dicount",
              
              )),
          
              TextFormField(controller:categoryController,
                decoration: InputDecoration(labelText: "category",
              
              )),
            
          
              TextFormField(controller: productadetailsController,
                decoration: InputDecoration(labelText: "productDetails",
              
              )),
            
          
              TextFormField(controller: ratingController,
                decoration: InputDecoration(
                labelText: "rating",
              
              )),
            
          
              TextFormField(controller: reviewsCountController,
                decoration: InputDecoration(labelText: "reviewsCount",
              
              )),
           
              ElevatedButton(onPressed: ()async{ 
           await     putApi(widget.productid.id);
              print("Button pressing");
Navigator.push(context, MaterialPageRoute(builder: (context)=>Listingproducts()));
              }, child: Text("submit"))
            
               ] ),
        ),
      ),
    );
  }
}