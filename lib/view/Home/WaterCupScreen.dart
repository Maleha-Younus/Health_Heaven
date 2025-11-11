import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/Controller/Water_provider.dart';
import 'package:provider/provider.dart';

class WaterCupsScreen extends StatelessWidget {
  const WaterCupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final waterProvider = Provider.of<WaterProvider>(context);
    final int totalCups = 20;
    int filledCups = waterProvider.filledCups;

    return Scaffold(
      backgroundColor: const Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                "Sipping my\nWay to Health\nOne Glass an\nHour",
                style: GoogleFonts.nunito(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            20.verticalSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAFA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Water Intake",
                        style: GoogleFonts.nunito(
                          fontSize: 16.sp,
                          color: const Color.fromARGB(255, 22, 39, 4),
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        "$filledCups cups / $totalCups cups",
                        style: GoogleFonts.nunito(
                          fontSize: 22.sp,
                          color: const Color.fromARGB(255, 22, 39, 4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      20.verticalSpace,
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(top: 10.h),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.8,
                              ),
                          itemCount: totalCups,
                          itemBuilder: (context, index) {
                            bool isFilled = index < filledCups;
                            return GestureDetector(
                              onTap: () {
                                int newCups = isFilled ? index : index + 1;
                                waterProvider.setCups(newCups);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.water_drop,
                                    size: 40.sp,
                                    color: isFilled
                                        ? const Color(0xff74A73D)
                                        : Colors.grey.shade300,
                                  ),
                                  Text(
                                    "1 cup",
                                    style: GoogleFonts.nunito(
                                      fontSize: 14.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
