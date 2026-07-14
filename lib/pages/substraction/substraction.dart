// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/constlar/supabase.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/models/test/test.dart';
import 'package:math_kids/pages/question/quetion.dart';

class Substraction extends StatefulWidget {
  String text;
  Substraction({super.key, required this.text});

  @override
  State<Substraction> createState() => _SubstractionState();
}

class _SubstractionState extends State<Substraction> {
  List<Test> testlar = [];

  Future<void> testQuery() async {
    final response = await supabase
        .from('test')
        .select()
        .eq('category', widget.text);

    testlar = response.map((e) => Test.fromJson(e)).toList();
  }

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
                          "${widget.text}",
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Quetion(level: index+1, text: widget.text),
                ),
              );
            },
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
