import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/models/buttun.dart';

import '../../colors/colors.dart';

class Congrats4Page extends StatelessWidget {
  const Congrats4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 150.h),

              // Brain illustration
              SizedBox(
                width: 220.w,
                height: 130.h,
                child: Image.asset("assets/learn/brain2.png"),
              ),

              SizedBox(height: 32.h),

              // Title
              Text(
                "Congratulations",
                style: GoogleFonts.lilitaOne(
                  fontSize: 32.sp,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 12.h),

              // Subtitle
              Text(
                "You successfully completed lesson! Don't\ngive up, go the next lesson",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 32.h),

              // Stat cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.surfacePrimary,
                        border: Border(
                            top: BorderSide(
                                color: AppColors.borderSecondary, width: 2.w
                            ),
                            right: BorderSide(
                                color: AppColors.borderSecondary, width: 2.w
                            ),
                          left: BorderSide(
                              color: AppColors.borderSecondary, width: 2.w
                          ),
                          bottom:BorderSide(
                              color: AppColors.borderSecondary, width: 4.w
                          )
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.access_time_filled, color: Colors.orange, size: 24.sp),
                          SizedBox(height: 8.h),
                          Text(
                            "10:30",
                            style: GoogleFonts.lilitaOne(
                              fontSize: 18.sp,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: AppColors.surfacePrimary,
                        border: Border(
                            top: BorderSide(
                                color: AppColors.borderSecondary, width: 2.w
                            ),
                            right: BorderSide(
                                color: AppColors.borderSecondary, width: 2.w
                            ),
                            left: BorderSide(
                                color: AppColors.borderSecondary, width: 2.w
                            ),
                            bottom:BorderSide(
                                color: AppColors.borderSecondary, width: 4.w
                            )
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.lightGreen, size: 24.sp),
                          SizedBox(height: 8.h),
                          Text(
                            "+100XP",
                            style: GoogleFonts.lilitaOne(
                              fontSize: 18.sp,
                              color: Colors.lightGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Go To Lessons button — logika shu yerda
              buttun(
                color: AppColors.brandContent,
                txcolor: Colors.white,
                text: "Go To Lessons",
                onTab: () {
                  Navigator.pop(context, true); // Learn3Page'ga true qaytadi
                },
                height: 56.h,
                width: double.infinity,
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}