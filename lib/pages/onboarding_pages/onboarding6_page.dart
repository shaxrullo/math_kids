import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/buttun.dart';
import '../../models/onbording.dart';

enum Gender { boy, girl }

class Onboarding6Page extends StatefulWidget {
  const Onboarding6Page({super.key});

  @override
  State<Onboarding6Page> createState() => _Onboarding6PageState();
}

class _Onboarding6PageState extends State<Onboarding6Page> {
  Gender? _selectedGender = Gender.boy;

  static const Color _boyAccentColor = Color(0xFF1DBF73);
  static const Color _girlAccentColor = Color(0xFFD4537E);
  static const Color _girlColor = Color(0xFF1D293D); // tanlanmagan holat rangi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: OnboardingAppBar(
        progress: 1,
        onClose: () => Navigator.pop(context),
        onSkip: () {},
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: Text(
                    "What's your gender?",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D293D),
                    ),
                  ),
                ),
                SizedBox(height: 48.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _genderOption(
                      gender: Gender.boy,
                      label: "I'm a Boy",
                      accentColor: _boyAccentColor,
                      image: 'assets/avatars/img.png',
                    ),
                    SizedBox(width: 48.w),
                    _genderOption(
                      gender: Gender.girl,
                      label: "I'm a Girl",
                      accentColor: _girlAccentColor,
                      image: 'assets/avatars/img_1.png',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Pastdagi tugmalar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: buttun(
                    color: const Color(0xFFE3E8EF),
                    text: "Previous",
                    onTab: () => Navigator.pop(context),
                    height: 56.h,
                    width: double.infinity, txcolor: Colors.black,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: buttun(
                    color: const Color(0xFF00BCFF),
                    text: "Next",
                    onTab: () {
                      // Keyingi sahifaga o'tish
                    },
                    height: 56.h,
                    width: double.infinity, txcolor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _genderOption({
    required Gender gender,
    required String label,
    required Color accentColor,
    required String image,
  }) {
    final bool isSelected = _selectedGender == gender;

    return GestureDetector(
      onTap: () => setState(() => _selectedGender = gender),
      child: Column(
        children: [
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE3E8EF),
              border: Border.all(
                color: isSelected ? accentColor : const Color(0xFFD3D8E0),
                width: isSelected ? 3 : 1.5,
              ),
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: 12.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: isSelected ? accentColor : _girlColor,
            ),
          ),
        ],
      ),
    );
  }
}