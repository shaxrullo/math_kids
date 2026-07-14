import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/stakes/steak.dart';

import '../../colors/colors.dart';

class Onboarding7Page extends StatefulWidget {
  const Onboarding7Page({super.key});

  @override
  State<Onboarding7Page> createState() => _Onboarding7PageState();
}

class _Onboarding7PageState extends State<Onboarding7Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      "Alex, we’re happy to see you in Math Kids! Start your journey!",
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
                    child: Image.asset("assets/register_imgs/3.png"),
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
              text: "START JOURNEY!",
              onTab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Steak()),
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
