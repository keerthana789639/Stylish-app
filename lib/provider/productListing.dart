import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stylish_app/modalClass.dart';

import 'package:http/http.dart' as http;

class GetProducts extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;

  List<Product> _isdata = [];
  List<Product> get isdata => _isdata;

  
    Map<String,dynamic> _issingledata = {};
    Map<String,dynamic> get issingledata => _issingledata;

  Future<void> product_Api(BuildContext context) async {
    _isloading = true;
    notifyListeners();
    var response = await http.get(
      Uri.parse("https://coffee-app-backend-c3n7.onrender.com/myfiles"),
    );
    print("API calling");
    final decoded = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        //print("wwww  ${decoded}");
        List<dynamic> resdata = decoded['data'];
       // print("wwww  ${decoded["data"]}");
        _isdata = resdata.map((items) => Product.fromJson(items)).toList();
        print("API SUCCESS");
      } else {
        print("API Fail");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to fetch data"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print("API catch $e");
    //  print("aaaa  ${decoded["data"]}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }

    notifyListeners();
  }

  Future<void> singleproductApi(BuildContext context,id) async {

    _isloading = true;
    notifyListeners();
    var response = await http.get(
      Uri.parse("https://coffee-app-backend-c3n7.onrender.com/myfiles/$id"),
    );
    print("API calling");
    final decoded = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
       
       
      
        _issingledata = decoded;
        print("API SUCCESS");
      } else {
        print("API Fail");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to fetch data"),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print("API catch $e");
    //  print("aaaa  ${decoded["data"]}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }

    notifyListeners();
  }
}
