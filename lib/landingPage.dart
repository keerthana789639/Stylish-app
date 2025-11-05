import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stylish_app/login.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/landingimage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: 





            
            
             Padding(
               padding: const EdgeInsets.only(top: 500,left: 15,right: 15),
               child: Column(//mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                Text(
                  "      You want\n Authentic, here\n         you go!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),SizedBox(height: 10,),
                Text(
                  "Find it here Bye it now",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),SizedBox(height: 35,),
                SizedBox(height: 55,width: 279,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(4),
                      ),
                      backgroundColor: Color(0xFFF83758),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                           ],
                         ),
             ),
    
      ),
    );
  }
}
