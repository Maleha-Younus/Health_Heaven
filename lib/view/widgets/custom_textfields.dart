import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String icon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Text(hintText, style: TextStyle(fontSize: 16.sp)),
        ),
        10.verticalSpace,
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: Image.asset(icon, width: 20, height: 20),
            ),
            // suffixIcon:
            //     isPassword ? null : Icon(Icons.check_circle, color: Colors.green),
            filled: true,

            fillColor: Color(0xffF6F7F9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1, color: Color(0xff74A73D)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1, color: Color(0xff74A73D)),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}
