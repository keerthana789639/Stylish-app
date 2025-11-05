
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish_app/account.dart';
import 'package:stylish_app/admin.dart';
import 'package:stylish_app/bottomBar.dart';
import 'package:stylish_app/checkOut.dart';
import 'package:stylish_app/forgetPassword.dart';
import 'package:stylish_app/imageProvider.dart';
import 'package:stylish_app/items.dart';
import 'package:stylish_app/landingPage.dart';
import 'package:stylish_app/login.dart';
import 'package:stylish_app/onboardingPage.dart';
import 'package:stylish_app/personal.dart';
import 'package:stylish_app/product.dart';
import 'package:stylish_app/productDetailPage.dart';
import 'package:stylish_app/search.dart';
import 'package:stylish_app/provider/productListing.dart';
import 'package:stylish_app/shoppingBagPage.dart';
import 'package:stylish_app/shoppingList.dart';
import 'package:stylish_app/splashScreen.dart';





void main()async{
  WidgetsFlutterBinding();
    await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return  
        
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>Imagepro()),
              ChangeNotifierProvider(create: (context)=>GetProducts())
            ],
           child: MaterialApp(
            
                   debugShowCheckedModeBanner: false,
                   
                   home:Bottombar
                   ()
                 ),
         );
      },
      
    );
  }
}




