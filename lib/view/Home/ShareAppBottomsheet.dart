import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  _ShareBottomSheetState createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFF9F5FF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 24.w),
              Text(
                'Share App',
                style: GoogleFonts.ubuntu(
                  color: const Color(0xff28252F),
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          spreadRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.close,
                      color: Color(0xff570AD4),
                      weight: 2.3,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialButton(
                imagePath: "assets/images/fb.png",
                label: "Facebook",
              ),
              SocialButton(
                imagePath: "assets/images/whatsapp-128-svgrepo-com 1.png",
                label: "Whatsapp",
              ),
              SocialButton(
                imagePath: "assets/images/instagram-1-svgrepo-com (2) 1.png",
                label: "Instagram",
              ),
              SocialButton(
                imagePath: "assets/images/twitter-154-svgrepo-com 1.png",
                label: "Twitter",
              ),
            ],
          ),

          15.verticalSpace,

          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
// social button widget

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String label;

  const SocialButton({Key? key, required this.imagePath, required this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath, scale: 3.sp),
        10.verticalSpace,
        Text(
          label,
          style: GoogleFonts.ubuntu(
            color: const Color(0xff232323),
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
