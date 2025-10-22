// 🔹 Custom widget for choice containers
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget MultiSelect({
  required String title,
  required List<String> options,
  required String? selectedValue,
  required Function(String) onSelected,
}) {
  return Container(
    width: 500.w,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: const Color(0xff74A73D), width: 1.2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        10.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 6.h,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              labelStyle: GoogleFonts.nunito(
                color: selectedValue == option ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w600,
              ),
              selected: selectedValue == option,
              selectedColor: const Color(0xff74A73D),
              backgroundColor: Colors.grey.shade200,
              onSelected: (_) => onSelected(option),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
                side: BorderSide(
                  color: selectedValue == option
                      ? const Color(0xff74A73D)
                      : Colors.grey.shade400,
                  width: 1.0,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}
