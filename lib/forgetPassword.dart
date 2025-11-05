// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:stylish_app/login.dart';

// class Forgetpassword extends StatefulWidget {
//   const Forgetpassword({super.key});

//   @override
//   State<Forgetpassword> createState() => _ForgetpasswordState();
// }

// class _ForgetpasswordState extends State<Forgetpassword> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController emailControler = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 100, left: 15, right: 15),
//               child: Text(
//                 "Forgot\nPassword?",
//                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Color.fromRGBO(243, 243, 243, 1),
//                   prefixIcon: Icon(Icons.email_outlined),

//                   labelText: "Enter your email address",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(9),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Confirm Password";
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(height: 5),

//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: Text(
//                 "We will send you a message to set or reset \nyour new password",
//                 style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
//               ),
//             ),
//             SizedBox(height: 10.h),

//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate());
                   
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(builder: (context) => Login())
//                     );
                  
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(365.w, 40.h),
//                   backgroundColor: Color(0xFFF83758),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(5),
//                   ),
//                    elevation: 4, 
//                 ),
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/login.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: 1000,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCE4EC),
              Color(0xFFF8BBD0),
              Color(0xFFF48FB1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot\nPassword?",
                style: TextStyle(
                  fontSize: 38.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 50.h),

              // 🔹 White Card
              Container(
                padding: EdgeInsets.all(25.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter your email address",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),

                      Text(
                        "We will send you a message to set or reset your new password",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 25.h),

                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const Login(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF83758),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            elevation: 4,
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
