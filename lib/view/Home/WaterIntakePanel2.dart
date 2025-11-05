import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/Home/WaterCupScreen.dart';
import 'package:healthy_heaven/view/Home/WaterLitreScreen.dart';
import 'package:healthy_heaven/view/authentication/LoginScreen.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';
import 'package:healthy_heaven/view/widgets/WaterIntakeContainer.dart';

class WaterIntakePanel2 extends StatefulWidget {
  const WaterIntakePanel2({super.key});

  @override
  State<WaterIntakePanel2> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<WaterIntakePanel2> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
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
                              10.verticalSpace,
                              Container(
                                padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
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
                                  "The needed water intake",
                                  style: GoogleFonts.nunito(
                                    fontSize: 20.sp,
                                    color: Color.fromARGB(255, 22, 39, 4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Align(
                                alignment: Alignment.centerLeft,

                                child: Text(
                                  "Your body needs 7 liters of hydration, which is equivalent to 12 cups",
                                  style: GoogleFonts.nunito(
                                    fontSize: 15.sp,
                                    color: Color.fromARGB(255, 22, 39, 4),
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  WaterIntakeContainer(
                                    tap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WaterCupsScreen(),
                                        ),
                                      );
                                    },
                                    title: "12 Cups",
                                    imagePath: "assets/images/cups.png",
                                  ),
                                  10.horizontalSpace,
                                  WaterIntakeContainer(
                                    tap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WaterLitreScreen(),
                                        ),
                                      );
                                    },
                                    title: "7 Liters",
                                    imagePath: "assets/images/Litres.png",
                                  ),
                                ],
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
    );
  }
}
