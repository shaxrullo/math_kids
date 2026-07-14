import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/homepageModel.dart';
import 'package:math_kids/pages/substraction/substraction.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        elevation: 12,
        scrolledUnderElevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
        toolbarHeight: 72.h,
        leading: CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage("assets/avatars/img.png"),
        ),
        title: Text(
          "Alex",
          style: GoogleFonts.lilitaOne(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(6.dg),
            height: 38.h,
            width: 128.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.borderSecondary,
            ),
            child: Row(
              children: [
                Image.asset("assets/app/Coin.png"),
                Expanded(
                  child: Text(
                    "99000",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lilitaOne(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Image.asset("assets/app/Add.png"),
              ],
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 202.h,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.borderSecondary,
              ),
              child: Column(
                children: [
                  SizedBox(
                    child: SizedBox(
                      height: 88.h,
                      child: Row(
                        mainAxisAlignment: .start,
                        children: [
                          Image.asset("assets/app/Character 5.png"),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              mainAxisAlignment: .center,
                              children: [
                                Text(
                                  "1 day",
                                  style: GoogleFonts.lilitaOne(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: AppColors.warningBorder,
                                  ),
                                ),
                                Text(
                                  "Complete practice or tutorial",
                                  style: GoogleFonts.lilitaOne(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Image.asset("assets/app/Lightning.png"),
                  Text(
                    "Start Practice",
                    style: GoogleFonts.lilitaOne(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: AppColors.bgBrand,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              final lis = list[index];
              return Container(
                margin: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.h,
                  bottom: 8.h,
                ),
                padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: lis.color,
                  border: Border(
                    bottom: BorderSide(
                      width: 5.h,
                      color: AppColors.borderBrandLight,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lis.title,
                            style: GoogleFonts.lilitaOne(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Complete levels and earn XP, \nup your rank",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lilitaOne(
                              height: 1.5,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Substraction(text: lis.title),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: lis.elevatedColor,
                              minimumSize: Size(77.w, 60.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Text(
                              "Level ${lis.level}",
                              style: GoogleFonts.lilitaOne(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: SizedBox(
                        width: 110.w,
                        height: 110.h,
                        child: Image.asset(lis.image, fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
