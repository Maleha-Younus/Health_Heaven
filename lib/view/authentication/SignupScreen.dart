import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/authentication/createProfile.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';
import 'package:healthy_heaven/view/widgets/custom_textfields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              Center(
                child: Hero(
                  tag: 'card',
                  child: AnimatedSize(
                    duration: Duration(milliseconds: 500), // Animation duration
                    curve: Curves.easeInOut, // Animation curve
                    child: Card(
                      color: Color(0xffFAFAFA),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/logo.png",
                                height: 180.h, // control logo height
                                fit: BoxFit.fitHeight,
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
                                "Sign Up",
                                style: GoogleFonts.nunito(
                                  fontSize: 25.sp,
                                  color: Color(0xff74A73D),
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
                            Ui_Button(tap: () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateProfile(),
                          ),
                        );
                            }, text: "Sign Up"),

                            15.verticalSpace,
                          ],
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
