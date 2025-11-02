import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;

  const CustomDropdownField({
    Key? key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      value: selectedValue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 14.h),

       suffixIcon: Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Icon(
        Icons.arrow_drop_down, // or any icon you prefer
        color: Colors.grey.shade700,
        size: 22.sp,
      ),
    ),

    suffixIconConstraints: const BoxConstraints(
      minHeight: 24,
      minWidth: 24,
    ),
  
      ),
      iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: TextStyle(fontSize: 14.sp)),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
