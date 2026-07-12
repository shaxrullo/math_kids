import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FailureScreen extends StatelessWidget {
  int soni;
  int time;
  FailureScreen({super.key, required this.soni, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/app/Icon (1).png',
                      height: 180.h,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.psychology,
                          size: 150.r,
                          color: Colors.pinkAccent,
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'FAIL!',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight
                            .w900, // Rasmdagidek qalinroq bo'lishi uchun
                        color: Colors.redAccent,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Level not completed',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard(
                          icon: Icons.access_time_filled,
                          iconColor: Colors.orange,
                          text: '$time',
                          textColor: Colors.orange,
                        ),
                        _buildStatCard(
                          icon: Icons.assignment,
                          iconColor: Colors.purpleAccent,
                          text: '$soni of 5',
                          textColor: Colors.purpleAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Tugma bosilgandagi harakat
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00B2FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Go to levels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          18.sp, // Shrift o'lchami ham moslashuvchan bo'ldi
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Yordamchi metod ichidagi o'lchamlarni ham ScreenUtil'ga mosladik
  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String text,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r), // .r qo'shildi
          border: Border.all(
            color: Colors.grey.withOpacity(0.15),
            width: 1.5.w,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: 28.r), // .r qo'shildi
            SizedBox(height: 8.h),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp, // .sp qo'shildi
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
