// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:stylish_app/imageProvider.dart';

// class Personal extends StatefulWidget {
//   const Personal({super.key});

//   @override
//   State<Personal> createState() => _PersonalState();
// }

// class Validators {
//   static String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) return "Please enter your email";
//     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
//       return "Enter a valid email";
//     return null;
//   }

//   static String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) return "Please enter your password";
//     if (value.length < 6) return "Password must be at least 6 characters";
//     return null;
//   }

//   static String? validatePincode(String? value) {
//     if (value == null || value.isEmpty) return "Please enter pincode";
//     if (!RegExp(r'^[0-9]{6}$').hasMatch(value))
//       return "Enter a valid 6-digit pincode";
//     return null;
//   }

//   static String? validateNotEmpty(String? value, String fieldName) {
//     if (value == null || value.isEmpty) return " Enter your $fieldName ";
//     return null;
//   }
// }

//  bool _obscurePassword = true;
//   String? _selectedState;
//   List<String> _states = ['Tamil Nadu', 'Kerala', 'Karnataka', 'Maharashtra'];

// class _PersonalState extends State<Personal> {

//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController pincodeController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController bankAccountController = TextEditingController();
//   TextEditingController accountHolderController = TextEditingController();
//   TextEditingController ifscController = TextEditingController();
//   //  File?image;
//   // Future imagepicking()async{
//   //   ImagePicker picker = ImagePicker();
//   //   final pick=await picker.pickImage(source:ImageSource.gallery );
//   //   if(pick!=null){
//   //     setState(() {
//   //       image=File(pick.path);
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final img = Provider.of<Imagepro>(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(backgroundColor:  Color.fromRGBO(241, 214, 214, 1),
//         leading: InkWell(onTap: () {
//           Navigator.pop(context);
//         },
//           child: Icon(Icons.arrow_back_ios,
//           ),
//         ),
//         centerTitle: true,
//         title: Text(
//           "Check Out",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19.sp),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Stack(clipBehavior: Clip.none,
//                     children: [
//                       Container(
//                         height: 90,
//                         width: 90,
//                         decoration: BoxDecoration(
//                           color: Colors.blue,
//                           borderRadius: BorderRadius.circular(100),
//                           image: DecorationImage(image: img.image==null?AssetImage("assets/landingimage.jpg"):
//                            FileImage(img.image!,),fit: BoxFit.cover)
//                         ),

//                       ),
//                       Positioned(
//                         bottom: 4,
//                         right: -10,
//                         child:CircleAvatar(radius: 17,
//                           backgroundColor: const Color.fromARGB(255, 246, 247, 248),
//                          // backgroundImage:

//                           child:
//                           IconButton(
//                           onPressed: () {
//                            img.imagepicking();
//                           },
//                           icon: Icon(Icons.camera_alt,color: const Color.fromARGB(255, 5, 5, 5),),
//                         ),)

//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 30.h),
//                 Text(
//                   "Personal details",
//                   style: TextStyle(
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 30.h),
//                 text("Email Address"),
//                 SizedBox(height: 10.h),

//                 input_parameters(
//                   controller: emailController,
//                   validator: Validators.validateEmail,
//                 ),
//                 SizedBox(height: 30.h),

//                 text("Password"),
//                 SizedBox(height: 10.h),

//                 input_parameters(
//                   controller: passwordController,
//                   validator: Validators.validatePassword,
//                   obscureText: _obscurePassword,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscurePassword = !_obscurePassword;
//                       });
//                     },
//                   ),
//                 ),
//                 Align(alignment: Alignment.bottomRight,
//                   child: Text(
//                     "Change password",
//                     // style: TextStyle(
//                     //   fontWeight: FontWeight.w600,
//                     //   fontSize: 16.sp,
//                     //   color: Color(0xFFF83758),
//                     // ),
//                     style: TextStyle(

//                           fontWeight: FontWeight.w400,
//                           fontSize: 12.sp,

//                           decoration: TextDecoration.underline, color: Color(0xFFF83758),

//                         ),
//                   ),

//                 ),SizedBox(height: 35.h,),
//                 Container(height: 1.h,width: 500.w,color: Colors.grey,),SizedBox(height: 20.h,),
//                 Text(
//                   "Business Address Detalis",
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),

//                 SizedBox(height: 30.h),
//                 text("Pincode"),
//                 SizedBox(height: 10.h),

//                 input_parameters(
//                   controller: pincodeController,
//                   validator: Validators.validatePincode,
//                 ),
//                 SizedBox(height: 30),
//                 text("Address"),

//                 SizedBox(height: 10.h),
//                 input_parameters(
//                   controller: addressController,
//                   validator: (value) =>
//                       Validators.validateNotEmpty(value, "address"),
//                 ),
//                 SizedBox(height: 30.h),
//                 text("City"),
//                 SizedBox(height: 10.h),
//                 input_parameters(
//                   controller: cityController,
//                   validator: (value) =>
//                       Validators.validateNotEmpty(value, "City"),
//                 ),
//                 SizedBox(height: 30.h),
//                 text("State"),
//                 SizedBox(height: 10.h),
//                  DropdownButtonFormField<String>(
//                   value: _selectedState,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(9),
//                     ),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                   ),
//                   hint: Text('Select State'),
//                   items: _states.map((state) => DropdownMenuItem(
//                     value: state,
//                     child: Text(state),
//                   )).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedState = value;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return "Please select a state";
//                     return null;
//                   },
//                 ),
//                 // input_parameters(
//                 //   controller: stateController,
//                 //   validator: (value) =>
//                 //       Validators.validateNotEmpty(value, "State"),
//                 // ),
//                 SizedBox(height: 32.h),
//                  Container(height: 1.h,width: 500.w,color: Colors.grey,),SizedBox(height: 20.h,),

//                 Text(
//                   "Bank Account Detalis",
//                   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(height: 20.h),

//                 text("Country"),

//                 SizedBox(height: 10.h),

//                 input_parameters(
//                   controller: countryController,
//                   validator: (value) =>
//                       Validators.validateNotEmpty(value, "country"),
//                 ),
//                 SizedBox(height: 30.h),

//                 text("Bank Account Number"),
//                 SizedBox(height: 10),
//                 input_parameters(
//                   controller: bankAccountController,
//                   validator: (value) =>
//                       Validators.validateNotEmpty(value, "Bank Account Number"),
//                 ),
//                 SizedBox(height: 30.h),

//                 text("Account Holder's Name"),
//                 SizedBox(height: 10.h),
//                 input_parameters(
//                   controller: accountHolderController,
//                   validator: (value) => Validators.validateNotEmpty(
//                     value,
//                     "Account Holder's Name",
//                   ),
//                 ),
//                 SizedBox(height: 30.h),

//                 text("IFSC Code"),
//                 SizedBox(height: 10.h),
//                 input_parameters(
//                   controller: ifscController,
//                   validator: (value) =>
//                       Validators.validateNotEmpty(value, "IFSC Code"),
//                 ),

//                 SizedBox(height: 30.h),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (formKey.currentState!.validate()) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Personal()),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(365, 50),
//                     backgroundColor: Color(0xFFF83758),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadiusGeometry.circular(5),
//                     ),
//                   ),
//                   child: Text(
//                     "Save",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Text text(text) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
//     );
//   }

//   TextFormField input_parameters({
//     required TextEditingController controller,
//     required String? Function(String?) validator, // <-- Validator as parameter
//     bool obscureText = false,
//     Widget? suffixIcon,
//      String? hintText,

//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,

//       decoration: InputDecoration(
//         //   label: label,
//         filled: true,
//         fillColor: Colors.white,
//         suffixIcon: suffixIcon,

//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
//       ),
//       validator: validator,
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stylish_app/imageProvider.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Please enter your email";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
      return "Enter a valid email";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Please enter your password";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  static String? validatePincode(String? value) {
    if (value == null || value.isEmpty) return "Please enter pincode";
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value))
      return "Enter a valid 6-digit pincode";
    return null;
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) return "Enter your $fieldName";
    return null;
  }
}

class _PersonalState extends State<Personal> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  String? _selectedState;
  List<String> _states = ['Tamil Nadu', 'Kerala', 'Karnataka', 'Maharashtra'];

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pincodeController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final bankAccountController = TextEditingController();
  final accountHolderController = TextEditingController();
  final ifscController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Imagepro>(context);
    return Container(
      decoration:  BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 236, 231, 231), // Light Pink
        Color.fromARGB(255, 241, 239, 241) // Slightly darker
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),

      child: Scaffold(      backgroundColor: Colors.transparent, 
        
        appBar: AppBar(
                backgroundColor: Colors.transparent, 
          elevation: 2,
          leading: BackButton(color: const Color.fromARGB(255, 7, 5, 5)),
          centerTitle: true,
          title: Text(
            "Personal Details",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 10, 10, 10),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Picture
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: img.image != null
                              ? FileImage(img.image!)
                              : null,
                          child: img.image == null
                              ? Icon(Icons.person, size: 50, color: Colors.white)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: -5,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.camera_alt, size: 18),
                              onPressed: () => img.imagepicking(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
      
                  // Section: Account Info
                  sectionTitle("Account Information"),
                  SizedBox(height: 15.h),
                  inputField(
                    "Email Address",
                    controller: emailController,
                    validator: Validators.validateEmail,
                    hint: "Enter your email",
                  ),
                  SizedBox(height: 20.h),
                  inputField(
                    "Password",
                    controller: passwordController,
                    validator: Validators.validatePassword,
                    obscureText: _obscurePassword,
                    hint: "Enter password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Change password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color:
                           Colors.pink[400],
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  divider(
                    
                  ),
      
                  // Section: Business Address
                  sectionTitle("Business Address"),
                  SizedBox(height: 15.h),
                  inputField(
                    "Pincode",
                    controller: pincodeController,
                    validator: Validators.validatePincode,
                    hint: "Enter pincode",
                    keyboardType: TextInputType.number,
                    
                  ),
                  SizedBox(height: 15.h),
                  inputField(
                    "Address",
                    controller: addressController,
                    validator: (val) =>
                        Validators.validateNotEmpty(val, "address"),
                    hint: "Enter your address",
                  ),
                  SizedBox(height: 15.h),
                  inputField(
                    "City",
                    controller: cityController,
                    validator: (val) => Validators.validateNotEmpty(val, "city"),
                    hint: "Enter your city",
                  ),
                  SizedBox(height: 15.h),
                  DropdownButtonFormField<String>(
                    value: _selectedState,
                    decoration: inputDecoration("Select State"),
                    items: _states
                        .map(
                          (state) =>
                              DropdownMenuItem(value: state, child: Text(state)),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => _selectedState = value),
                    validator: (val) => val == null || val.isEmpty
                        ? "Please select a state"
                        : null,
                  ),
                  SizedBox(height: 25.h),
                  divider(),
      
                  // Section: Bank Details
                  sectionTitle("Bank Details"),
                  SizedBox(height: 15.h),
                  inputField(
                    "Country",
                    controller: countryController,
                    validator: (val) =>
                        Validators.validateNotEmpty(val, "country"),
                    hint: "Enter country",
                  ),
                  SizedBox(height: 15.h),
                  inputField(
                    "Bank Account Number",
                    controller: bankAccountController,
                    validator: (val) =>
                        Validators.validateNotEmpty(val, "Bank Account Number"),
                    hint: "Enter account number",
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 15.h),
                  inputField(
                    "Account Holder's Name",
                    controller: accountHolderController,
                    validator: (val) =>
                        Validators.validateNotEmpty(val, "Account Holder's Name"),
                    hint: "Enter holder name",
                  ),
                  SizedBox(height: 15.h),
                  inputField(
                    "IFSC Code",
                    controller: ifscController,
                    validator: (val) =>
                        Validators.validateNotEmpty(val, "IFSC Code"),
                    hint: "Enter IFSC code",
                  ),
      
                  SizedBox(height: 30.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Saved Successfully!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200.w, 30.h),
                        backgroundColor: Colors.pink[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widgets
  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.grey[400], thickness: 1);
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,hintStyle: TextStyle(fontSize: 12.sp),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget inputField(
    String label, {
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8.h),
        SizedBox(height:35.h,
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: inputDecoration(
              hint ?? label,
            ).copyWith(suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
}
