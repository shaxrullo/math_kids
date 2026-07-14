import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import '../../models/learan_model.dart';
import 'learn3_page.dart'; // <-- o'zingizdagi to'g'ri path bilan almashtiring

class Learn2Page extends StatefulWidget {
  int modulNumber = 1;
   Learn2Page({
     required this.modulNumber
     ,super.key});

  @override
  State<Learn2Page> createState() => _Learn2PageState();
}

class _Learn2PageState extends State<Learn2Page> {

  final int lessonCount = 6;
  late List<LearanModel2> list;

  @override
  void initState() {
    super.initState();
    list = List.generate(
      lessonCount,
          (index) => LearanModel2(
        theend: false,
        isUnlocked: index == 0, // faqat 1-lesson ochiq boshida
      ),
    );
  }

  void lessonniTugat(int index) {
    setState(() {
      list[index].theend = true;
      if (index + 1 < list.length) {
        list[index + 1].isUnlocked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgLight,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_backspace_outlined)),
        centerTitle: true,
        title: Text(
          "Module ${widget.modulNumber+ 1}",
          style: GoogleFonts.lilitaOne(
            fontSize: 24.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      backgroundColor: AppColors.bgLight,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: 358.w,
                height: 136.h,
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 81.w,
                            height: 62.h,
                            child: Image.asset("assets/learn/img_2.png"),
                          ),
                          Text(
                            "Get  1000XP for completing all\n lessons of this module!",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lilitaOne(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: LinearProgressIndicator(
                          borderRadius: BorderRadius.circular(24.r),
                          value: 0.5,
                          backgroundColor: AppColors.brandLight,
                          color: AppColors.brandContent,
                          minHeight: 16.h,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 52.h,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lessons",
                  style: GoogleFonts.lilitaOne(
                    fontSize: 24.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                Widget statusIcon;
                if (!list[index].isUnlocked) {
                  statusIcon = Icon(
                    Icons.lock,
                    color: AppColors.textSecondary,
                    size: 24.sp,
                  );
                } else if (list[index].theend) {
                  statusIcon = Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                          (i) => Icon(Icons.star, color: Colors.orange, size: 20.sp),
                    ),
                  );
                } else {
                  statusIcon = Icon(
                    Icons.play_circle_fill,
                    color: AppColors.brandContent,
                    size: 32.sp,
                  );
                }
                return GestureDetector(
                  onTap: () async {
                    if (list[index].isUnlocked && !list[index].theend) {
                      final result = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(builder: (context) => Learn3Page(index: index,)),
                      );
                      if (result == true) {
                        lessonniTugat(index);
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border(
                        top: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                        left: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                        right: BorderSide(color: AppColors.borderSecondary, width: 2.w),
                        bottom: BorderSide(color: AppColors.borderSecondary, width: 4.w),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    height: 92.h,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 222.w,
                          height: 59.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Lesson ${index + 1}",
                                style: GoogleFonts.lilitaOne(
                                  fontSize: 20.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                "10 minutes to complete",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textSecondary,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        statusIcon,
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}