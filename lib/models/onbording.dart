import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double progress; // 0.0 dan 1.0 gacha
  final VoidCallback onClose;
  final VoidCallback onSkip;

  const OnboardingAppBar({
    super.key,
    required this.progress,
    required this.onClose,
    required this.onSkip,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:Color(0xFFF7F9FC),
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            // Yopish tugmasi
            GestureDetector(
              onTap: onClose,
              child: Icon(
                Icons.close_rounded,
                color: const Color(0xFF1D293D),
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),

            // Progress bar
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: .all(color: Colors.black54),
                  borderRadius: .circular(20.r)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8.h,
                    backgroundColor: Color(0xFFF7F9FC),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFFFF7A00),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Skip tugmasi
            GestureDetector(
              onTap: onSkip,
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2196F3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}