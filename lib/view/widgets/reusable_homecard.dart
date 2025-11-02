import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final String image;
  final Color bgColor;

  const ReusableCard({
    super.key,
    required this.title,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 112.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.black54, width: 1.w),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          5.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.start,
            style: GoogleFonts.nunito(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),

          Image.asset(image, height: 60.h, width: 60.w, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
