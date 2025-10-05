import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Ui_Button extends StatelessWidget {
  final String text;
  final VoidCallback tap;
  const Ui_Button({super.key, required this.text, required this.tap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: Color(0xff74A73D),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
