import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stylish_app/account.dart';
import 'package:stylish_app/bottomBar.dart';
import 'package:stylish_app/forgetPassword.dart';
import 'package:stylish_app/personal.dart';
import 'package:stylish_app/product.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool eye = false;

  Future<void> loginapi() async {
    final url = "https://coffee-app-backend-c3n7.onrender.com/login";

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
      print(data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("api success");

        final name = await SharedPreferences.getInstance();
        await name.setString("token", data["token"]);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Bottombar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data["message"]),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        print("api error");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome\nBack!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                ),
                SizedBox(height: 40.h),
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
                      return " please enter your email";
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

                    //  Icon(Icons.remove_red_eye_sharp),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return " please enter password";
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgetpassword(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Color(0xFFF83758),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottombar()));

                    if (formKey.currentState!.validate()) {
                      loginapi();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Bottombar()),
                      // );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(365.w, 40.h),
                    backgroundColor: Color(0xFFF83758),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "-OR Continue With-",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: Image.asset(
                        "assets/google 1.png",
                        height: 24.h,
                        width: 24.w,
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create An Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Account()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Color(0xFFF83758),
                          decoration: TextDecoration.underline,
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
