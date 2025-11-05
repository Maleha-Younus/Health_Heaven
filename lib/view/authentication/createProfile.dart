import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthy_heaven/view/widgets/Ui_Button.dart';
import 'package:healthy_heaven/view/widgets/bottom_navbar.dart';
import 'package:healthy_heaven/view/widgets/dropdown.dart';
import 'package:healthy_heaven/view/widgets/profile_image.dart';
import 'package:healthy_heaven/view/widgets/profile_textfield.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String? selectedGender;
  String? selectedActivity;
  String? selectedGoal;
  String? selectedDiet;
  String? selectedAllergy;
  String? selectedHeightUnit;
  String? selectedWeightUnit;

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> activities = [
    'Sedentary',
    'Lightly Active',
    'Active',
    'Very Active',
  ];
  final List<String> goals = ['Lose Weight', 'Maintain Weight', 'Gain Muscle'];
  final List<String> diets = [
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
    'Keto',
    'Other',
  ];
  final List<String> allergies = [
    'None',
    'Nuts',
    'Dairy',
    'Gluten',
    'Seafood',
    'Other',
  ];
  final List<String> heightUnits = ['cm', 'ft/in'];
  final List<String> weightUnits = ['kg', 'lbs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff74A73D),
      appBar: AppBar(
        title: Text(
          "Create Profile",
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Column(
        children: [
          20.verticalSpace,
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    10.verticalSpace,
                    ProfileImage(),
                    30.verticalSpace,
                    _buildSectionTitle("Personal Information"),
                    10.verticalSpace,
                    const AppTextField(hintText: "Full Name"),
                    16.verticalSpace,
                    const AppTextField(
                      hintText: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    16.verticalSpace,
                    const AppTextField(
                      hintText: "Age",
                      keyboardType: TextInputType.number,
                    ),
                    16.verticalSpace,
                    CustomDropdownField(
                      hint: "Select Gender",
                      items: genders,
                      selectedValue: selectedGender,
                      onChanged: (val) => setState(() => selectedGender = val),
                    ),
                    25.verticalSpace,

                    _buildSectionTitle("Physical Details"),
                    10.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            hintText: "Height",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomDropdownField(
                            hint: "Unit",
                            items: heightUnits,
                            selectedValue: selectedHeightUnit,
                            onChanged: (val) =>
                                setState(() => selectedHeightUnit = val),
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            hintText: "Weight",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: CustomDropdownField(
                            hint: "Unit",
                            items: weightUnits,
                            selectedValue: selectedWeightUnit,
                            onChanged: (val) =>
                                setState(() => selectedWeightUnit = val),
                          ),
                        ),
                      ],
                    ),
                    25.verticalSpace,

                    _buildSectionTitle("Lifestyle Preferences"),
                    10.verticalSpace,
                    CustomDropdownField(
                      hint: "Activity Level",
                      items: activities,
                      selectedValue: selectedActivity,
                      onChanged: (val) =>
                          setState(() => selectedActivity = val),
                    ),
                    16.verticalSpace,
                    CustomDropdownField(
                      hint: "Health Goal",
                      items: goals,
                      selectedValue: selectedGoal,
                      onChanged: (val) => setState(() => selectedGoal = val),
                    ),
                    16.verticalSpace,
                    CustomDropdownField(
                      hint: "Diet Preference",
                      items: diets,
                      selectedValue: selectedDiet,
                      onChanged: (val) => setState(() => selectedDiet = val),
                    ),
                    16.verticalSpace,
                    CustomDropdownField(
                      hint: "Allergies (if any)",
                      items: allergies,
                      selectedValue: selectedAllergy,
                      onChanged: (val) => setState(() => selectedAllergy = val),
                    ),
                    35.verticalSpace,

                    Ui_Button(
                      text: "CONTINUE",
                      tap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const NavBarScreen(initialIndex: 0),
                          ),
                        );
                      },
                    ),
                    15.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff333333),
        ),
      ),
    );
  }
}
