import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/Home/Meditation.dart';
import 'package:healthy_heaven/view/Home/WaterIntake.dart';
import 'package:healthy_heaven/view/Home/WaterIntakePanel2.dart';
import 'package:healthy_heaven/view/Home/notification.dart';
import 'package:healthy_heaven/view/widgets/reusable_homecard.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Try Advice\n in the App',
      'image': 'assets/images/image 2.png',
      'color': const Color(0xffc1db9f),
    },
    {
      'title': 'Weight loss \nPlan',
      'image': 'assets/images/image 3 (1).png',
      'color': const Color(0xffd9d9d9),
    },
    {
      'title': 'Healthy Diet\n Planner',
      'image': 'assets/images/Group 7.png',
      'color': const Color(0xffd17b0f),
    },
    {
      'title': 'AI Food\n Scan',
      'image': 'assets/images/Group 8.png',
      'color': const Color(0xffc39fdb),
    },
  ];

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: const Color(0xff74A73D),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 110,
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selected date: ${pickedDate.toLocal()}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green.shade700,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Hero(
              tag: 'card',
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Card(
                  color: const Color(0xffFAFAFA),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 25.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hi dear 👋 !\nStay healthy always...\nAnalyze your Food’s Nutrition...",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        25.verticalSpace,

                        /// ✅ Two containers in a row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: HomeContainer(
                                img: "assets/images/WaterDrop.png",
                                title: "Water Intake",
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: HomeContainer(
                                img: "assets/images/meditation.png",
                                title: "Deep Breathing",
                              ),
                            ),
                          ],
                        ),

                        30.verticalSpace,

                        /// ✅ 🟩 Animated Daily Progress Section
                        Text(
                          "Your Daily Progress",
                          style: GoogleFonts.nunito(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        10.verticalSpace,
                        CircularPercentIndicator(
                          radius: 70.w, // size of circle
                          lineWidth: 8.w, // thickness
                          percent: 0.65, // 65% example
                          animation: true,
                          animationDuration: 1200,
                          center: Text(
                            "65%",
                            style: GoogleFonts.nunito(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          progressColor: const Color(0xff6AA817),
                          backgroundColor: Colors.grey.shade300,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        10.verticalSpace,
                        Text(
                          "You’re 65% closer to your daily goals 🎯",
                          style: GoogleFonts.nunito(
                            fontSize: 15.sp,
                            color: Colors.black54,
                          ),
                        ),

                        30.verticalSpace,

                        /// ✅ Premium features section
                        Text(
                          "Try more features in Premium Version...",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        20.verticalSpace,

                        /// ✅ Horizontal scroll with reusable cards
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: items.map((item) {
                              return Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: ReusableCard(
                                  title: item['title'],
                                  image: item['image'],
                                  bgColor: item['color'],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  final String title;
  final String img;
  const HomeContainer({required this.img, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (title == "Water Intake") {
                return const WaterIntake();
              } else {
                return const MeditationScreen();
              }
            },
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xff6AA817), width: 2.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, height: 60.h, width: 60.w),
              10.verticalSpace,
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
