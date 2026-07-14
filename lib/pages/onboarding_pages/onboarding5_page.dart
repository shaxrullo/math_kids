import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding6_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';

import '../../colors/colors.dart';
import '../../models/onbording.dart';

class Onboarding5Page extends StatefulWidget {
  const Onboarding5Page({super.key});

  @override
  State<Onboarding5Page> createState() => _Onboarding5PageState();
}

class _Onboarding5PageState extends State<Onboarding5Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(
        progress: 0.83,
        onClose: () => Navigator.pop(context),
        onSkip: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Steak()),
          );
        },
      ),
      body: Column(
        children: [
          SizedBox(
            height: 635.h,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      "Before we direct you to your profile, let’s clarify the last question!",
                      textAlign: .center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 200.w,
                    height: 123.h,
                    child: Image.asset("assets/register_imgs/img_1.png"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            height: 102.h,
            child: buttun(
              color: const Color(0xFF00BCFF),
              text: "CONTINUE",
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding6Page()),
                );
              },
              height: 52.h,
              width: 310.w,
              txcolor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
