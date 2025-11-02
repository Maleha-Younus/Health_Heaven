import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_heaven/view/Home/DailyEvent.dart';
import 'package:healthy_heaven/view/Home/WaterIntakePanel2.dart';
import 'package:healthy_heaven/view/Home/home.dart';
import 'package:healthy_heaven/view/authentication/LoginScreen.dart';
import 'package:healthy_heaven/view/authentication/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view_model/Nav_barController.dart';
import 'package:healthy_heaven/view_model/nutrition_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavbarController()),
            ChangeNotifierProvider(create: (_) => NutritionViewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.nunitoTextTheme(),
            ),
            home: LoginScreen(),
          ),
        );
      },
    );
  }
}
