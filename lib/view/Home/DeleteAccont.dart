import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/authentication/SplashScreen.dart';

class DeleteAccountDialogbox extends StatelessWidget {
  const DeleteAccountDialogbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 400.w, minHeight: 211.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70.w,
              height: 70.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff74A73D),
              ),
              child: Icon(
                CupertinoIcons.delete_simple,
                color: Colors.white,
                size: 27.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text.rich(
              TextSpan(
                text: 'Are you sure you want to\n',
                style: GoogleFonts.ubuntu(
                  color: const Color(0xff28252F),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
                children: [
                  TextSpan(
                    text: 'DELETE',
                    style: GoogleFonts.ubuntu(
                      color: const Color(0xffBE1E41),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  TextSpan(
                    text: ' your account?',
                    style: GoogleFonts.ubuntu(
                      color: const Color(0xff28252F),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xff46BA40),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },

                  child: Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffBE1E41),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        "Yes, Delete",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
