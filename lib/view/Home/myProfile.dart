import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/authentication/createProfile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = {
      "name": "John Marie",
      "email": "John@gmail.com",
      "age": "25",
      "gender": "male",
      "height": "165 cm",
      "weight": "60 kg",
      "activity": "Lightly Active",
      "goal": "Maintain Weight",
      "diet": "Vegetarian",
      "allergy": "None",
      "description":
          "Dedicated to maintaining a healthy lifestyle with balanced nutrition and regular activity.",
    };

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xff74A73D),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateProfile()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 90.h, color: const Color(0xff74A73D)),
              Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xff74A73D),
                        width: 4.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/Ellipse 79.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          60.verticalSpace,
          Text(
            userProfile["name"]!,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              color: const Color(0xff74A73D),
              fontWeight: FontWeight.w700,
            ),
          ),
          5.verticalSpace,
          Text(
            userProfile["email"]!,
            style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
          ),
          25.verticalSpace,

          // Info Section
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle("Personal Information"),
                  _infoTile(Icons.cake, "Age", userProfile["age"]!),
                  _infoTile(Icons.person, "Gender", userProfile["gender"]!),
                  15.verticalSpace,
                  _sectionTitle("Physical Details"),
                  _infoTile(Icons.height, "Height", userProfile["height"]!),
                  _infoTile(
                    Icons.monitor_weight,
                    "Weight",
                    userProfile["weight"]!,
                  ),
                  15.verticalSpace,
                  _sectionTitle("Lifestyle Preferences"),
                  _infoTile(
                    Icons.fitness_center,
                    "Activity Level",
                    userProfile["activity"]!,
                  ),
                  _infoTile(Icons.flag, "Goal", userProfile["goal"]!),
                  _infoTile(Icons.restaurant, "Diet", userProfile["diet"]!),
                  _infoTile(
                    Icons.warning_amber_rounded,
                    "Allergies",
                    userProfile["allergy"]!,
                  ),
                  15.verticalSpace,
                  _sectionTitle("Description"),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      userProfile["description"]!,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: const Color(0xff74A73D)),
      title: Text(
        label,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        value,
        style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 10.h),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontSize: 17.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff333333),
        ),
      ),
    );
  }
}
