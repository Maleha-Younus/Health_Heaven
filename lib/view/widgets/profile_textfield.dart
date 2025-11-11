import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final Widget? suffix;
  final TextInputType keyboardType;

  const AppTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.suffix,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //  Better padding for typing comfort
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),

        hintText: hintText,
        hintStyle: GoogleFonts.ubuntu(
          color: const Color(0xff777184),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),

        //  Optional icons
        prefixIcon: icon != null
            ? Icon(icon, color: const Color(0xff570AD4))
            : null,
        suffixIcon: suffix,

        //  Better borders for consistent UI
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xffDADADA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xff74A73D), width: 1.5),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
