import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/models/buttun.dart';

import '../../colors/colors.dart';
import 'learn4_page.dart';

class Learn3Page extends StatefulWidget {
  final int index;
  const Learn3Page({super.key, required this.index});

  @override
  State<Learn3Page> createState() => _Learn3PageState();
}

class _Learn3PageState extends State<Learn3Page> {
  int son = 0;

  Future<bool?> showEndLessonDialog(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black54,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              // Title
              const Text(
                'End lesson?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1B2A4A),
                ),
              ),
              const SizedBox(height: 12),

              // Subtitle
              const Text(
                'Are you sure you want to end the lesson?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1B2A4A),
                ),
              ),
              const SizedBox(height: 28),

              // Buttons
              Row(
                children: [
                  buttun(
                    color: AppColors.surfaceSecondary,
                    txcolor: AppColors.textPrimary,
                    text: "No, Cancel!",
                    onTab: () => Navigator.pop(context, false),
                    height: 52,
                    width: 171.w,
                  ),
                  SizedBox(width: 12.w),
                  buttun(
                    color: AppColors.brandContent,
                    txcolor: Colors.white,
                    text: "Yes, end!",
                    onTab: () => Navigator.pop(context, true),
                    height: 52,
                    width: 171.w,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.textPrimary,
        backgroundColor: AppColors.bgLight,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, false),
          icon: Icon(Icons.keyboard_backspace_outlined),
        ),
        centerTitle: true,
        title: Text(
          "Lesson ${widget.index + 1}",
          style: GoogleFonts.lilitaOne(
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.h,
            children: [
              SizedBox(height: 16.h,),
              Container(
                width: 358.w,
                height: 145.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.surfacePrimary,
                  border: Border(
                    top: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    right: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    left: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    bottom: BorderSide(color: AppColors.borderSecondary, width: 4.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "👋 Introduction (2 minutes)",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        "– Today we are learning about addition!\n – Addition means putting things together to\n find out how many we have in total.",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.surfacePrimary,
                  border: Border(
                    top: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    right: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    left: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    bottom: BorderSide(color: AppColors.borderSecondary, width: 4.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Example:",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        "If you have 2 red apples 🍎🍎 and you get 3\n yellow apples 🍏🍏🍏,\n How many apples do you have now?\n2 + 3 = 5! 🍎🍎🍏🍏🍏",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.surfacePrimary,
                  border: Border(
                    top: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    right: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    left: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    bottom: BorderSide(color: AppColors.borderSecondary, width: 4.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.asset("assets/learn/img.png", fit: BoxFit.cover,),
                  ),
                ),
              ),
              Container(
                width: 358.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.surfacePrimary,
                  border: Border(
                    top: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    right: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    left: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                    bottom: BorderSide(color: AppColors.borderSecondary, width: 4.w),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🍎 Main Activity (5–7 minutes)",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        "Look at the picture — there are 2 red apples and 3 yellow apples. \nLet's count all the apples together: 👉 1, 2, 3, 4, 5!\nSo we can say:2 + 3 = 5",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              buttun(
                color: AppColors.brandContent,
                txcolor: Colors.white,
                text: "End lesson",
                onTab: () async {
                  final confirm = await showEndLessonDialog(context);
                  if (confirm == true) {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Congrats4Page(), // <-- o'z sahifa nomingiz
                      ),
                    );
                    if (result == true && context.mounted) {
                      Navigator.pop(context, true); // Learn2Page'ga true qaytaradi
                    }
                  }
                },
                height: 52,
                width: double.infinity,
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }
}