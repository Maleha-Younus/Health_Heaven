import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutApp extends StatelessWidget {
  
  AboutApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //  Back button color set to white
        ),
        backgroundColor: const Color(0xff74A73D),
        title: Text("About App", style: GoogleFonts.ubuntu(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          10.verticalSpace,

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Text(
                loremText,
                style: GoogleFonts.ubuntu(
                  color: const Color(0xff28252F),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String loremText = '''
Health Heaven is your personal companion for a balanced and nutritious lifestyle. 
This app helps you make smarter food choices by providing accurate nutrition analysis 
for your meals. Simply enter your ingredients or meal items, and Healthy Heaven will 
display essential nutritional values such as calories, protein, fat, and carbohydrates.

Our goal is to make healthy eating easier and more accessible for everyone. Whether 
you’re trying to lose weight, maintain a healthy diet, or simply understand what’s in 
your food, Healthy Heaven gives you the insights you need.

Key features include:
• Meal nutrition analysis powered by intelligent food data APIs  
• Easy meal tracking and visualization of daily intake  
• Personalized recommendations for healthier food options  
• Clean and simple interface for effortless use  

Healthy Heaven promotes mindful eating and encourages users to take small, 
consistent steps toward a healthier lifestyle.  
Your health journey begins here — one meal at a time.

''';
