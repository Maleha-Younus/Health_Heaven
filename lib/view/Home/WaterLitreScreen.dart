import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/authentication/LoginScreen.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class WaterLitreScreen extends StatefulWidget {
  const WaterLitreScreen({super.key});

  @override
  State<WaterLitreScreen> createState() => _WaterLitreScreenState();
}

class _WaterLitreScreenState extends State<WaterLitreScreen> {
  final ValueNotifier<double> _progressNotifier = ValueNotifier(0);
  double _currentLitres = 0.0; // 🔹 Current intake in litres
  final double _goalLitres = 2.7; // 🔹 Daily goal

  void _addLitre() {
    setState(() {
      if (_currentLitres < _goalLitres) {
        _currentLitres += 0.3; // 🔹 Each button press adds 0.3 litre
        if (_currentLitres > _goalLitres) {
          _currentLitres = _goalLitres;
        }
        _progressNotifier.value = (_currentLitres / _goalLitres) * 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    const LoginScreen(), // replace with your screen
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sipping my\nWay to Health\nOne Litre at a\nTime",
                      style: GoogleFonts.nunito(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Hero(
                  tag: 'card',
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Container(
                      height: 500.h,
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
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.verticalSpace,
                              Text(
                                "Today's Water Intake",
                                style: GoogleFonts.nunito(
                                  fontSize: 15.sp,
                                  color: const Color.fromARGB(255, 22, 39, 4),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                "${_currentLitres.toStringAsFixed(1)} litre / ${_goalLitres.toStringAsFixed(1)} litre",
                                style: GoogleFonts.nunito(
                                  fontSize: 20.sp,
                                  color: const Color.fromARGB(255, 22, 39, 4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              30.verticalSpace,
                              Center(
                                child: SimpleCircularProgressBar(
                                  size: 180,
                                  valueNotifier: _progressNotifier,
                                  progressStrokeWidth: 12,
                                  backStrokeWidth: 12,
                                  progressColors: const [
                                    Color(0xff74A73D),
                                    Color(0xffB0D97E),
                                  ],
                                  backColor: Colors.grey.shade200,
                                  mergeMode: true,
                                  onGetText: (double value) {
                                    return Text(
                                      '${value.toInt()}%',
                                      style: GoogleFonts.nunito(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff74A73D),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              40.verticalSpace,
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff74A73D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40.w,
                                      vertical: 10.h,
                                    ),
                                  ),
                                  onPressed: _addLitre,
                                  child: Text(
                                    "Add 0.3 Litre",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              20.verticalSpace,
                              Center(
                                child: Text(
                                  _currentLitres >= _goalLitres
                                      ? "🎉 Goal Achieved! Stay Hydrated!"
                                      : "Keep Going! You're doing great 💧",
                                  style: GoogleFonts.nunito(
                                    fontSize: 16.sp,
                                    color: const Color(0xff74A73D),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
