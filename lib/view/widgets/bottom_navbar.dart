import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_heaven/view/Home/Meal.dart';
import 'package:healthy_heaven/view/Home/drawer.dart';
import 'package:healthy_heaven/view/Home/home.dart';
import 'package:healthy_heaven/view_model/Nav_barController.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatefulWidget {
  final int initialIndex;

  const NavBarScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final bottomController = context.read<NavbarController>();
      bottomController.changeIndex(widget.initialIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomController = context.watch<NavbarController>();

    final List<NavItem> navItems = [
      NavItem(icon: "assets/images/home.png", label: "Home", index: 0),
      NavItem(icon: "assets/images/Group 11.png", label: "Meal", index: 1),
      NavItem(
        icon: "assets/images/Message circle.png",
        label: "Message",
        index: 2,
      ),
      NavItem(icon: "assets/images/Icon (1).png", label: "Profile", index: 3),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffD2FF96),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 7,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navItems
                .map((navItem) => _buildNavItem(navItem))
                .toList(),
          ),
        ),
      ),

      body: _getBody(bottomController.selectedIndex),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const MealScreen();
      default:
        return const HomeScreen();
    }
  }

  Widget _buildNavItem(NavItem navItem) {
    final bottomController = context.watch<NavbarController>();
    final bool isSelected = navItem.index == bottomController.selectedIndex;

    return GestureDetector(
      onTap: () {
        bottomController.changeIndex(navItem.index);
      },
      child: Container(
        width: 70.w,
        height: 70.h,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ Green Circle with Icon
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff74A73D)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  navItem.icon,
                  width: 25.w,
                  height: 25.h,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
            5.verticalSpace,
            // ✅ Label Text
            Text(
              navItem.label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xff74A73D) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;
  final int index;

  NavItem({required this.icon, required this.label, required this.index});
}
