import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/Home/WaterIntakePanel2.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';

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
    return SafeArea(
      child: Scaffold(
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
                      duration: Duration(
                        milliseconds: 500,
                      ), // Animation duration
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
                                15.verticalSpace,
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 0.h,
                                    bottom: 0.h,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Image.asset(
                                    "assets/images/WaterDrop.png",
                                    height: 60.h, // control logo height
                                  ),
                                ),
                                10.verticalSpace,
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
                                Align(
                                  alignment: Alignment.centerLeft,

                                  child: Text(
                                    "Start to record and track your water intake daily based on your needs and stay hydrated ",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15.sp,
                                      color: Color.fromARGB(255, 22, 39, 4),
                                    ),
                                  ),
                                ),
                                15.verticalSpace,
                                TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: "Body Weight in Kg",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(10.w),
                                    ),
                                    // suffixIcon:
                                    //     isPassword ? null : Icon(Icons.check_circle, color: Colors.green),
                                    filled: true,

                                    fillColor: Color(0xffF6F7F9),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xff74A73D),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Color(0xff74A73D),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                      horizontal: 20,
                                    ),
                                  ),
                                ),
                                15.verticalSpace,

                                Ui_Button(
                                  tap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WaterIntakePanel2(),
                                      ),
                                    );
                                  },
                                  text: "Done",
                                ),
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
      ),
    );
  }
}
