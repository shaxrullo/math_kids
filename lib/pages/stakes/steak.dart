import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/stakes/animate.dart';

class Steak extends StatelessWidget {
  const Steak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 32.h),
                child: SizedBox(
                  height:
                      200.h, // <-- Stack/ConfettiFlamePage uchun aniq balandlik
                  child: const ConfettiFlamePage(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  "1 Day",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w400,
                    fontSize: 38.sp,
                  ),
                ),
              ),
              Text(
                "This is your first streak! Next time you must complete tutorial or practice to reach",
                style: GoogleFonts.lilitaOne(
                  height: 1,
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                height: 100.h, // <-- 91 dan 100 ga oshirildi
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0XFFF1F5F9),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // <-- shart
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mon",
                            style: GoogleFonts.lilitaOne(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.deepOrange,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 122.h,),
              buttun(
                color: Color(0xFF00BCFF),
                txcolor: Colors.white,
                text: "Continue",
                onTab: () {},
                height: 52.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
