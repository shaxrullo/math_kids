import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Profile",
                style: GoogleFonts.lilitaOne(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.surfaceWhite,
                border: Border(
                  bottom: BorderSide(width: 6, color: AppColors.borderPrimary),
                  left: BorderSide(width: 3, color: AppColors.borderPrimary),
                  right: BorderSide(width: 3, color: AppColors.borderPrimary),
                  top: BorderSide(width: 3, color: AppColors.borderPrimary),
                ),
              ),
              margin: .all(16.r),
              padding: .symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage("assets/avatars/img_1.png"),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    children: [
                      Text(
                        "Alex Johnson",
                        style: GoogleFonts.lilitaOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        "example@gmail.com",
                        style: GoogleFonts.lilitaOne(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "General",
                style: GoogleFonts.lilitaOne(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                height: 70.h,
                width: double.infinity,
                alignment: .center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.surfaceWhite,
                  border: Border(
                    bottom: BorderSide(
                      width: 6,
                      color: AppColors.borderPrimary,
                    ),
                    left: BorderSide(width: 2, color: AppColors.borderPrimary),
                    right: BorderSide(width: 2, color: AppColors.borderPrimary),
                    top: BorderSide(width: 2, color: AppColors.borderPrimary),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.accessibility_sharp),
                  title: Text("data", style: GoogleFonts.lilitaOne(fontWeight: FontWeight.w400, fontSize: 24),),
                  trailing: IconButton(
                    padding: .zero,
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
