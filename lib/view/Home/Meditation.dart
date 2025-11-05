import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isMeditating = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed && isMeditating) {
              _controller.forward();
            }
          });

    _animation = Tween<double>(
      begin: 100,
      end: 160,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMeditation() {
    setState(() {
      isMeditating = !isMeditating;
    });
    if (isMeditating) {
      _controller.forward();
    } else {
      _controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff74A73D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daily Meditation\nKeeps you Happy\nand Healthy",
                style: GoogleFonts.nunito(
                  fontSize: 26.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/meditation.png",
                          height: 150.h,
                        ),
                        15.verticalSpace,
                        Text(
                          "Deep Breathing",
                          style: GoogleFonts.nunito(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff263b08),
                          ),
                        ),
                        15.verticalSpace,

                        /// Animated breathing circle
                        Expanded(
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) {
                                return Container(
                                  height: _animation.value,
                                  width: _animation.value,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: const RadialGradient(
                                      colors: [
                                        Color(0xffb5e48c),
                                        Color(0xff74A73D),
                                      ],
                                      center: Alignment.center,
                                      radius: 0.9,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      isMeditating ? "Breathe" : "Ready?",
                                      style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        25.verticalSpace,
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff74A73D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 60.w,
                              vertical: 14.h,
                            ),
                          ),
                          onPressed: _toggleMeditation,
                          child: Text(
                            isMeditating ? "Stop" : "Start Meditation",
                            style: GoogleFonts.ubuntu(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
