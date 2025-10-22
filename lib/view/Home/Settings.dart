import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/Home/AboutApp.dart';
import 'package:healthy_heaven/view/Home/DeleteAccont.dart';
import 'package:healthy_heaven/view/Home/PrivacyPolicy.dart';
import 'package:healthy_heaven/view/Home/drawer.dart';
import 'package:healthy_heaven/view/Home/notification.dart';
import 'package:healthy_heaven/view/authentication/CreateNewPassword.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _isNotificationOn = true; // switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: DrawerScreen(),
      backgroundColor: const Color(0xffF8F4FE),
      appBar: AppBar(
        backgroundColor: const Color(0xff74A73D),
        title: Text("Settings", style: GoogleFonts.ubuntu(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ), // 👈 Menu icon white
          onPressed: () {
            _key.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ), // 👈 Notification icon white
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: ListView(
          children: [
            buildSettingTile(
              icon: Icons.notifications,
              title: "Push Notifications",
              trailing: Switch(
                activeColor: const Color(0xff74A73D),
                value: _isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    _isNotificationOn = value;
                  });
                },
              ),
            ),
            buildSettingTile(
              icon: Icons.lock,
              title: "Create New Password",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateNewPasswordScreen(),
                  ),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.delete_sharp,
              title: "Delete Account",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteAccountDialogbox();
                  },
                );
              },
            ),
            buildSettingTile(
              icon: Icons.description,
              title: "Privacy Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PrivacyPolicy(heading: "Privacy Policy"),
                  ),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.description_outlined,
              title: "Terms & Conditions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PrivacyPolicy(heading: "Terms & Conditions"),
                  ),
                );
              },
            ),
            buildSettingTile(
              icon: Icons.info,
              title: "About App",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xff74A73D), size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.ubuntu(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff28252F),
                ),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
