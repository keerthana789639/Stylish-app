import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_app/imageProvider.dart';
import 'package:http/http.dart'as http;

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  File? image;
     TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController hashtagController = TextEditingController();
  TextEditingController originalpriceController = TextEditingController();
  TextEditingController dicountController = TextEditingController();
  TextEditingController sizesController = TextEditingController();

  TextEditingController productadetailsController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController reviewsCountController = TextEditingController();
  

  Future <void>uploadingApi()async{
     final keerthy = await SharedPreferences.getInstance();
   final key = await  keerthy.getString("token");

    final url="https://coffee-app-backend-c3n7.onrender.com/upload";
    try{var response=await http.MultipartRequest("POST", Uri.parse(url));
    response.headers["Authorization"]="Bearer $key";
    response.fields["name"]=nameController.text;
    response.fields["descriptions"]=descriptionController.text;
    response.files.add(await http.MultipartFile.fromPath("file", image!.path));

    response.fields["hashtag"]=hashtagController.text;
    response.fields["originalprice"]=originalpriceController.text;
    response.fields["dicount"]=dicountController.text;
    
    response.fields["sizes"]=sizesController.text;

    response.fields["productDetails"]= productadetailsController.text;
    response.fields["rating"]=ratingController.text;
    response.fields["reviews"]=reviewsCountController.text;
  
var res = await response.send();

final data = await http.Response.fromStream(res);

final decode = jsonDecode(data.body);

if(data.statusCode==200||data.statusCode==201){
  print("Api success");
  
}
else{
  (print("error   ${decode["message"]}"));
  }
    }catch(e){
print("catch error  $e");
    }

    

    
  }
  
  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Imagepro>(context);
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              TextFormField(controller: nameController,
                decoration: InputDecoration(labelText: "name",labelStyle: TextStyle(color: Colors.black)
              
              )),
          
              TextFormField(controller:descriptionController ,
                decoration: InputDecoration(labelText: "description",
              
              )),
          
            ElevatedButton(onPressed: (){img.imagepicking();
            setState(() {
              image = img.image;
            });
              
            }, child: Text("selected Image")),
              TextFormField(controller: hashtagController,
                decoration: InputDecoration(labelText: "hashtag",
              
              )),
          
              TextFormField(controller:originalpriceController ,
                decoration: InputDecoration(labelText: "originalprice",
              
              )),
          
              TextFormField(controller: dicountController,
                decoration: InputDecoration(labelText: "dicount",
              
              )),
          
              TextFormField(controller: sizesController,
                decoration: InputDecoration(labelText: "sizes",
              
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
           
              ElevatedButton(onPressed: (){ uploadingApi();
              print("Button pressing");

              }, child: Text("submit"))
            
               ] ),
        ),
      ),
    );
  }
}
