import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/models/buttun.dart';

import '../../colors/colors.dart';
import '../../models/onbording.dart';

class Onboarding3Page extends StatefulWidget {
  const Onboarding3Page({super.key});

  @override
  State<Onboarding3Page> createState() => _Onboarding3PageState();
}

class _Onboarding3PageState extends State<Onboarding3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(
        progress: 0.50,
        onClose: () => Navigator.pop(context),
        onSkip: () {},
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
                    child: Text("Nice to meet you! I’ll teach you math in a fun way! Let's move on to the next question!",
                      textAlign: .center,
                      style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                      width: 200.w,
                      height: 123.h,
                      child: Image.asset("assets/register_imgs/img.png"))
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
              onTab: () {},
              height: 52.h,
              width: 310.w, txcolor: Colors.white,

            ),
          ),
        ],
      ),
    );
  }
}