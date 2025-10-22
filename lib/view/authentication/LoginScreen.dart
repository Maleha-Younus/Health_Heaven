import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/authentication/ForgotPassword.dart';
import 'package:healthy_heaven/view/authentication/SignupScreen.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';
import 'package:healthy_heaven/view/widgets/bottom_navbar.dart';
import 'package:healthy_heaven/view/widgets/custom_textfields.dart';

/*
   Design Principles used in this LoginScreen:

  1. Composition Principle:
     - This screen is built by combining small widgets (Row, Column, Card, 
       CustomTextField, CustomButton) into one larger UI.
     - Flutter itself encourages Composition over Inheritance.

  2. SRP (Single Responsibility Principle):
     - Each custom widget has one clear responsibility.
       Example: CustomTextField only handles text input UI.

  3. DRY (Don’t Repeat Yourself):
     - Reusable widgets like CustomTextField and CustomSolidButton 
       are created once and reused across the app.

  4. Declarative UI:
     - The UI is directly described based on the current state.
       Example: Checkbox value is controlled by the bool "isChecked".

  5. StatefulWidget Pattern:
     - Local state (isChecked) is managed with setState().
     - This is a basic form of state management in Flutter.
*/

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                                scale: 2.h,
                                "assets/images/logo.png",
                                height: 150.h, // control logo height
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
                                "Login",
                                style: GoogleFonts.nunito(
                                  fontSize: 25.sp,
                                  color: Color(0xff74A73D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            10.verticalSpace,

                            //SRP (Single Responsibility Principle)
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
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  activeColor: Color(0xff74A73D), // tick color
                                  checkColor:
                                      Colors.white, // inside check color
                                ),

                                Text(
                                  "Remember Me",
                                  style: GoogleFonts.nunito(
                                    color: const Color(0xff28252F),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 55.w),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: GoogleFonts.nunito(
                                        fontSize: 12.sp,
                                        color: Color(0xff74A73D),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            10.verticalSpace,
                            //  DRY principle: CustomSolidButton reused across app
                            Ui_Button(
                              tap: () {
                                 Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const NavBarScreen(initialIndex: 0),
                            ),
                          );
                              },
                              text: "Login",
                            ),
                            20.verticalSpace,

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    color: Color(0xff74A73D),
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Sign Up here",
                                      style: TextStyle(
                                        color: Color(0xff74A73D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
