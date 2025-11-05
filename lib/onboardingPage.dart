import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylish_app/landingPage.dart';
import 'package:stylish_app/login.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  PageController pageController = PageController();
  int count = 0;
  List pages = [
    {
      "img": "assets/Catalogue-amico.png",
      "title": "Choose Products",
      "text":
          " Amet minim mollit non deserunt ullamco eat \n      sit aliqua dolor do amet sint.velit offcia \n             consequat duis enim velit mollit",
    },
    {
      "img": "assets/Mobile payments-amico (1).png",
      "title": "Make Payment",
      "text":
          "  Amet minim mollit non deserunt ullamco eat \n      sit aliqua dolor do amet sint.velit offcia \n             consequat duis enim velit mollit ",
    },
    {
      "img": "assets/Order ride-amico (1).png",
      "title": "Get Your Order",
      "text":
          " Amet minim mollit non deserunt ullamco eat \n      sit aliqua dolor do amet sint.velit offcia \n             consequat duis enim velit mollit",
    },
  ];
  void nextbutton() {
    if (count < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
    else{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Landingpage()));

    }
  }

  void previewbutton() {
    if (count > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${count + 1}/3",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  count < pages.length - 1
                      ? GestureDetector(onTap: (){
                                  Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),);


                      },
                        child: Text(
                            "Skip",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp
                            ),
                          ),
                      )
                      : SizedBox(),
                ],
              ),

              SizedBox(
                height: 500.h,
                child: PageView.builder(
                  itemCount: pages.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      count = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(pages[index]["img"], height: 330,fit:BoxFit.fill),
                        ),SizedBox(height: 30.h,),
                        Text(
                          pages[index]["title"],
                          style: TextStyle(
                            fontSize: 22.sp,
                            color: Color(0xFF0A0E21),
                            fontWeight: FontWeight.w900,
                          ),
                        ),SizedBox(height: 15.h,),
                        Text(
                          pages[index]["text"],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color.fromARGB(255, 29, 34, 37),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                ),


                
              ),SizedBox(height: 70.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [count>0?
                  TextButton(
                    onPressed: () {
                      previewbutton();
                    },
                    child: Text(
                      "Prev",
                      style: TextStyle(
                     color:  const Color.fromARGB(255, 14, 1, 1),
                        fontSize: 12..sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ) : const SizedBox(),

  
    Row(
      children: List.generate(3, (index) {
        return 
        count==index?
  Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 12.h,
          width: 27.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:  Colors.black ,
           
          ),
        ):

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          height: 12,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    ),



                  TextButton(
                    onPressed: () {
                    
                      nextbutton();
                    },
                    child: Text(
                      count < pages.length - 1 ? "Next" : "Get Started",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 0, 0),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


