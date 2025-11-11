import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/Home/WaterIntake.dart';
import 'package:healthy_heaven/view/authentication/OTPScreen.dart';
import 'package:healthy_heaven/view/authentication/SignupScreen.dart';
import 'package:healthy_heaven/view/authentication/createProfile.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';
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

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 231, 228, 228),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // Back button color set to white
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
                                "Create New Password",
                                style: GoogleFonts.nunito(
                                  fontSize: 25.sp,
                                  color: Color(0xff74A73D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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

                            10.verticalSpace,

                            10.verticalSpace,
                            //  DRY principle: CustomSolidButton reused across app
                            Ui_Button(
                              tap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CreateProfile(),
                                  ),
                                );
                              },
                              text: "Confirm",
                            ),
                            20.verticalSpace,
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
