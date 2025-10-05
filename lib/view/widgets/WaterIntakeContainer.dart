import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WaterIntakeContainer extends StatelessWidget {
  final VoidCallback tap;
  final String title;
  final String imagePath;
  const WaterIntakeContainer({
    super.key,
    required this.title,
    required this.imagePath, required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
        // width: 150.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black26, width: 2.w),
        ),
        child: Column(
          children: [
            30.verticalSpace,
            Image.asset(imagePath, width: 50.w, height: 50.h),
            10.verticalSpace,
            Center(
              child: Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
