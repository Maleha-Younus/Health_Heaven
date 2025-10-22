import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_heaven/view/Home/Settings.dart';
import 'package:healthy_heaven/view/Home/ShareAppBottomsheet.dart';
import 'package:healthy_heaven/view/widgets/bottom_navbar.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF8F4FE),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Space for your logo / user info
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 120.h, // control logo height
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Drawer Items List
            Expanded(
              child: ListView(
                children: [
                  DrawerItem(
                    icon: Icons.home_outlined,
                    text: "Home",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NavBarScreen(initialIndex: 0),
                        ),
                      );
                    },
                  ),
                  DrawerItem(
                    icon: Icons.restaurant_menu_outlined,
                    text: "Meal",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NavBarScreen(initialIndex: 1),
                        ),
                      );
                    },
                  ),
                  DrawerItem(icon: Icons.person, text: "Profile"),

                  DrawerItem(
                    icon: Icons.share_outlined,
                    text: "Share App",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (context) => const ShareBottomSheet(),
                      );
                    },
                  ),

                  DrawerItem(
                    icon: Icons.settings_outlined,
                    text: "Settings",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),
                  DrawerItem(icon: Icons.help_outline, text: "Help & Feedback"),
                ],
              ),
            ),

            // 🔹 Logout Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff46BA40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff74A73D)),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xff28252F),
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }
}
