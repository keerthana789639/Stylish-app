import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_app/bottomBar.dart';
import 'package:stylish_app/login.dart';
import 'package:stylish_app/personal.dart';
import 'package:stylish_app/product.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount == null) return null;

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(
        credentials,
      );

      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool eye = false;




  Future<void> signupApi() async {
    final url = "https://coffee-app-backend-c3n7.onrender.com/signup";
    print("aaaaaaa");
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailControler.text,

          "password": passwordControler.text,
        }),
      );
      
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("SUCCESS");

        final keerthy = await SharedPreferences.getInstance();
    await  keerthy.setString("token",data["token"] );
    
      } else {
        (print("API ERROR"));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"]),
        backgroundColor: Colors.pinkAccent,
        duration: Duration(seconds: 3),
        
        ));

      }
      
    } catch (e) {
      print("CATCH ERROR");
      print("Exception:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an \naccount",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(height: 35.h),
                TextFormField(
                  controller: emailControler,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(Icons.person_2),
                    labelText: "Username or Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " please enter your Username or email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  obscureText: !eye,
                  controller: passwordControler,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_sharp),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30.h),
                TextFormField(
                  obscureText: !eye,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(243, 243, 243, 1),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          eye = !eye;
                        });
                      },
                      icon: eye
                          ? Icon(Icons.remove_red_eye_sharp)
                          : Icon(Icons.visibility_off_outlined),
                    ),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                Text(
                  " By clicking the Register button, you agree \n  to the public offer",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                ),

                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Login()),
                      // );
                      signupApi();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(360, 50),
                    backgroundColor: Color(0xFFF83758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                  ),
                  child: Text(
                    "Create An Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "-OR Continue With-",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await signWithGoogle();

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Bottombar()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: Image.asset(
                          "assets/google 1.png",
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),

                    CircleAvatar(
                      radius: 25,
                      child: Image.asset(
                        "assets/apple 1 (1).png",
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                    SizedBox(width: 8.w),

                    CircleAvatar(
                      radius: 25,
                      child: Image.asset(
                        "assets/facrbook.png",
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create An Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },

                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFFF83758),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
