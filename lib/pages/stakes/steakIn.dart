import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:table_calendar/table_calendar.dart'; // paketni import qilish

class Steakin extends StatelessWidget {
  const Steakin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Streaks",
          style: GoogleFonts.lilitaOne(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: .all(16),
            margin: .all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border(
                bottom: BorderSide(color: AppColors.surfacePrimary, width: 6),
              ),
              color: AppColors.borderPrimary,
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  mainAxisAlignment: .start,
                  children: [
                    Image.asset("assets/app/Character 10.png"),
                    SizedBox(width: 16.w),
                    Text(
                      "Complete one lesson or level to \nget today’s streak!",
                      style: GoogleFonts.lilitaOne(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                buttun(
                  color: AppColors.brandBorder,
                  txcolor: Colors.white,
                  text: "Go to Lessons",
                  onTab: () {},
                  height: 52.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  "Streak Status",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                Spacer(),
                Image.asset("assets/app/Lightn.png"),
                Text(
                  "2 Days",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.warningBorder,
                  ),
                ),
              ],
            ),
          ),
          // SIZ AYTGAN JOY:
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F7FA),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2025, 1, 1),
                lastDay: DateTime.utc(2026, 12, 31),
                focusedDay: DateTime(2025, 6, 1),
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 55,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: false,
                  titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    // Olovcha rangini boshqarish uchun (2025-yil iyun oyining 1 va 2-kunlari misolida)
                    bool isActive = (day.day == 1 || day.day == 2) && day.month == 6;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: isActive ? Colors.orange : const Color(0xFF94A3B8),
                          size: 24,
                        ),
                        const SizedBox(height: 2),
                        Text('${day.day}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                      ],
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    bool isActive = (day.day == 1 || day.day == 2) && day.month == 6;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: isActive ? Colors.orange : const Color(0xFF94A3B8),
                          size: 24,
                        ),
                        const SizedBox(height: 2),
                        Text('${day.day}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}