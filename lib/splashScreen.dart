

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_app/bottomBar.dart';
import 'package:stylish_app/onboardingPage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),()async{
 final keerthy = await SharedPreferences.getInstance();
   final key = await  keerthy.getString("token");

   
   if(key!=null){

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottombar()));
    }
    else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Onboardingpage()));
    }
    
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:  Colors.white,
      body: Center(child:Image.asset("assets/logoipsum-255 1 (1).png",height: 90.h,) ,),
    );
  }
}