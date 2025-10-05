import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healthy_heaven/view/widgets/custom_textfields.dart';

class WaterIntake extends StatefulWidget {
  const WaterIntake({super.key});

  @override
  State<WaterIntake> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<WaterIntake> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 231, 228, 228),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // 👈 Back button color set to white
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sipping my\nWay to Health\nOne Glass an\nHour",
                      style: GoogleFonts.nunito(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Hero(
                  tag: 'card',
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 500), // Animation duration
                    curve: Curves.easeInOut, // Animation curve
                    child: Container(
                      height: 500.h,
                      child: Card(
                        color: const Color(0xffFAFAFA),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                        ),

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                                alignment: Alignment.topLeft,
                                child: Image.asset(
                                  "assets/images/WaterDrop.png",
                                  height: 60.h, // control logo height
                                ),
                              ),
                              Container(
                                height: 2.h,
                                width: double.infinity,
                                color: const Color(0xff74A73D),
                                margin: EdgeInsets.only(bottom: 10.h),
                              ),
                              5.verticalSpace,
                              Align(
                                alignment: Alignment.centerLeft,

                                child: Text(
                                  "Water Intake",
                                  style: GoogleFonts.nunito(
                                    fontSize: 25.sp,
                                    color: Color.fromARGB(255, 22, 39, 4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              CustomTextField(
                                hintText: 'E-mail',
                                icon: "assets/images/email.png",
                                isPassword: false,
                              ),
                              10.verticalSpace,
                              CustomTextField(
                                hintText: 'Password',
                                icon: "assets/images/email.png",
                                isPassword: true,
                              ),
                              10.verticalSpace,
                              CustomTextField(
                                hintText: 'Confirm Password',
                                icon: "assets/images/email.png",
                                isPassword: true,
                              ),

                              15.verticalSpace,

                              // Ui_Button(tap: () {}, text: "Sign Up"),
                            ],
                          ),
                        ),
                      ),
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
