import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';

class Substraction extends StatelessWidget {
  const Substraction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(width: 6, color: AppColors.brandBorder),
        ),
        backgroundColor: AppColors.surfaceBrand,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 267.h),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              mainAxisSize: .min,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .start,
                      children: [
                        Text(
                          "Addition",
                          style: GoogleFonts.lilitaOne(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Complete levels and earn XP, \nup your rank",
                          style: GoogleFonts.lilitaOne(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "1 / 30 level",
                          style: GoogleFonts.lilitaOne(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Image.asset("assets/homepage_image/math (1).png"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                    top: 16.h,
                    right: 16.w,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: LinearProgressIndicator(
                        value: 0.1,
                        borderRadius: BorderRadius.circular(12),
                        minHeight: 16,
                        color: AppColors.brandBorder,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 354.h,
                  child: AlertDialog(
                  
                    title: Text(
                      "Difficulty",
                      style: GoogleFonts.lilitaOne(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: .min,
                      children: [
                        ListTile(
                          title: Text(
                            "Easy",
                            style: GoogleFonts.lilitaOne(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          trailing: Icon(Icons.circle_outlined),
                        ),
                        ListTile(
                          title: Text(
                            "Normal",
                            style: GoogleFonts.lilitaOne(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          trailing: Icon(Icons.circle_outlined),
                        ),
                        ListTile(
                          title: Text(
                            "Hard",
                            style: GoogleFonts.lilitaOne(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          trailing: Icon(Icons.circle_outlined),
                        ),
                      ],
                    ),
                    actions: [
                      buttun(
                        color: AppColors.borderSecondary,
                        txcolor: AppColors.textPrimary,
                        text: "Cancel",
                        onTab: () =>Navigator.pop(context),
                        height: 44.h,
                        width: 136.w,
                      ),
                      buttun(
                        color: AppColors.brandBorder,
                        txcolor: AppColors.textWhite,
                        text: "Start",
                        onTab: () {},
                        height: 44.h,
                        width: 136.w,
                      ),
                    ],
                  ),
                );
              },
            ),
            child: Container(
              margin: .symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border(
                  bottom: BorderSide(
                    width: 6,
                    color: AppColors.borderSecondary,
                  ),
                ),
              ),
              child: ListTile(
                contentPadding: .all(16.r),
                title: Text(
                  "Level ${index + 1}",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                subtitle: Text(
                  "5 questions",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                trailing: Image.asset("assets/app/Group.png"),
              ),
            ),
          );
        },
      ),
    );
  }
}
