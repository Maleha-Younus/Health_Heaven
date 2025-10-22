import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/widgets/MultiSelect.dart';

class DailyEvent extends StatefulWidget {
  const DailyEvent({super.key});

  @override
  State<DailyEvent> createState() => _DailyeventState();
}

class _DailyeventState extends State<DailyEvent> {
  String? selectedActivity;
  String? selectedMood;
  String? selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Daily\nEvents",
                    style: GoogleFonts.nunito(
                      fontSize: 25.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: Hero(
                  tag: 'card',
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Card(
                      color: const Color(0xffFAFAFA),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.verticalSpace,

                              MultiSelect(
                                title: "Today's Activity",
                                options: [
                                  "Not Exercied",
                                  "Exercised",
                                  "Swimming",
                                  "Walking",
                                  "Running",
                                  "Yoga",
                                  "Gym",
                                ],
                                selectedValue: selectedActivity,
                                onSelected: (value) {
                                  setState(() => selectedActivity = value);
                                },
                              ),

                              15.verticalSpace,
                              MultiSelect(
                                title: "How are you feeling?",
                                options: [
                                  "Happy",
                                  "Tired",
                                  "Stressed",
                                  "Relaxed",
                                  "Anxious",
                                  "Sad",
                                  "Excited",
                                  "Angry",
                                  "Content",
                                  "Bored",
                                  "Motivated",
                                  "Nervous",
                                ],
                                selectedValue: selectedMood,
                                onSelected: (value) {
                                  setState(() => selectedMood = value);
                                },
                              ),

                              15.verticalSpace,
                              MultiSelect(
                                title: "Symptoms",
                                options: [
                                  "Headache",
                                  "Nausea",
                                  "Fatigue",
                                  "Dizziness",
                                  "Cough",
                                  "Fever",
                                  "Sore Throat",
                                  "Shortness of Breath",
                                  "Muscle Aches",
                                  "Congestion",
                                  "Diarrhea",
                                  "Loss of Taste/Smell",
                                  "Chest Pain",
                                  "Abdominal Pain",
                                ],
                                selectedValue: selectedMeal,
                                onSelected: (value) {
                                  setState(() => selectedMeal = value);
                                },
                              ),

                              40.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
