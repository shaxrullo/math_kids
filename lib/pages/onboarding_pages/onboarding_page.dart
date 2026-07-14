import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding2_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';

import '../../colors/colors.dart';
import '../../models/onbording.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(
        progress: 0.17,
        onClose: () => Navigator.pop(context),
        onSkip: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Steak()),
        ),
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
                      "Welcome to the Math Kids! Your Math Journey will start here! We have question for you",
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
                    child: Image.asset("assets/register_imgs/2.png"),
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
              onTab: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Onboarding2Page()),
              ),
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
