import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0xff74A73D),
        toolbarHeight: 60.h,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        title: Text(
          "Nutrition Notifications",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 5.h, right: 10.w),
            child: const Icon(Icons.notifications_active, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          20.verticalSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                final List<Map<String, dynamic>> notifications = [
                  {
                    "icon": Icons.local_dining,
                    "title": "New Nutrition Tip!",
                    "subtitle": "Try adding more protein to your breakfast.",
                  },
                  {
                    "icon": Icons.local_drink,
                    "title": "Stay Hydrated",
                    "subtitle": "You haven’t logged your water intake today.",
                  },
                  {
                    "icon": Icons.food_bank,
                    "title": "Meal Logged",
                    "subtitle":
                        "Your lunch (Rice & Chicken) has been recorded.",
                  },
                  {
                    "icon": Icons.health_and_safety,
                    "title": "Healthy Goal Reached!",
                    "subtitle": "You hit your daily calorie goal!",
                  },
                  {
                    "icon": Icons.restaurant,
                    "title": "New Recipe Added",
                    "subtitle": "Check out a new low-calorie meal option.",
                  },
                ];

                final notification =
                    notifications[index % notifications.length];

                return Column(
                  children: [
                    ListTile(
                      leading: Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff74A73D),
                        ),
                        child: Icon(
                          notification["icon"],
                          color: Colors.white,
                          size: 25.sp,
                        ),
                      ),
                      title: Text(
                        notification["title"],
                        style: GoogleFonts.roboto(
                          color: const Color(0xff74A73D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      subtitle: Text(
                        notification["subtitle"],
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff4F5458),
                        ),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: Color(0xff74A73D),
                            size: 20,
                          ),
                          5.verticalSpace,
                          Text(
                            "5:45 PM",
                            style: GoogleFonts.roboto(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff677081),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                      height: 5,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
