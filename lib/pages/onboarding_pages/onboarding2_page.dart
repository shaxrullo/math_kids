import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding3_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';

import '../../models/custom_input_field.dart';
import '../../models/onbording.dart';

class Onboarding2Page extends StatefulWidget {
  const Onboarding2Page({super.key});

  @override
  State<Onboarding2Page> createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: OnboardingAppBar(
        progress: 2 / 6,
        onClose: () => Navigator.pop(context),
        onSkip: () {
          if (_nameController.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Steak()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ism kiritng',
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.textWhite,
                  ),
                ),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.black54,
              ),
            );
          }
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  Center(
                    child: Text(
                      "Enter your name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 48.h),

                  // Input
                  CustomInputField(
                    label: "Your Name",
                    hintText: "Ex: Alex",
                    controller: _nameController,
                    status: InputFieldStatus.filled,
                  ),
                ],
              ),
            ),
          ),

          // Pastdagi tugmalar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: buttun(
                      color: AppColors.brandContent,
                      text: "Continue",
                      onTab: () {
                        if (_nameController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Onboarding3Page()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ism kiritng',
                                style: GoogleFonts.lilitaOne(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: AppColors.textWhite,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.black54,
                            ),
                          );
                        }
                      },
                      height: 52.h,
                      width: 310.w,
                      txcolor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
