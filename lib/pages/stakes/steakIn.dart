import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/servises/services.dart';
import 'package:table_calendar/table_calendar.dart';

class Steakin extends StatefulWidget {
  const Steakin({super.key});

  @override
  State<Steakin> createState() => _SteakinState();
}

class _SteakinState extends State<Steakin> {
  final _service = StreakService();

  int _streak = 0;
  Set<DateTime> _activeDays = {};
  bool _loading = true;
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final result = await _service.fetchStreakData();
      final List activity = result["activity"] as List;

      // Har bir login_date ni DateTime ga o'tkazib, Set ga qo'shamiz
      final Set<DateTime> days = {};
      for (final item in activity) {
        final dt = DateTime.parse(item["login_date"]);
        // Soatni nolga tenglashtirish (faqat kun muhim)
        days.add(DateTime(dt.year, dt.month, dt.day));
      }

      setState(() {
        _streak = result["streak"] as int;
        _activeDays = days;
        _loading = false;
      });
    } catch (e) {
      if (mounted) {
        setState(() => _loading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Ma'lumot yuklanmadi: $e")));
      }
    }
  }

  bool _isActiveDay(DateTime day) {
    return _activeDays.contains(DateTime(day.year, day.month, day.day));
  }

  Widget _buildDayCell(DateTime day, {bool isToday = false}) {
    final active = _isActiveDay(day);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.local_fire_department_rounded,
          color: active ? Colors.deepOrange : const Color(0xFFCBD5E1),
          size: 22.sp,
        ),
        SizedBox(height: 2.h),
        Text(
          '${day.day}',
          style: TextStyle(
            fontWeight: isToday ? FontWeight.w900 : FontWeight.w600,
            color: isToday ? const Color(0xFF00BCFF) : const Color(0xFF1E293B),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

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
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Yuqori card — bugungi holat
                Container(
                  padding: EdgeInsets.all(16.r),
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.surfacePrimary,
                        width: 6,
                      ),
                    ),
                    color: AppColors.borderPrimary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/app/Character 10.png",
                            height: 60.h,
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Text(
                              "Complete one lesson or level to \nget today's streak!",
                              style: GoogleFonts.lilitaOne(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
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

                // Streak status sarlavhasi
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      const Spacer(),
                      Image.asset("assets/app/Lightn.png", height: 24.h),
                      SizedBox(width: 4.w),
                      Text(
                        "$_streak ${_streak == 1 ? 'Day' : 'Days'}",
                        style: GoogleFonts.lilitaOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColors.warningBorder,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8.h),

                // Calendar — real data bilan
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F7FA),
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 2,
                      ),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2025, 1, 1),
                      lastDay: DateTime.utc(2027, 12, 31),
                      focusedDay: _focusedDay,
                      onPageChanged: (day) {
                        setState(() => _focusedDay = day);
                      },
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      rowHeight: 55,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: false,
                        titleTextStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) =>
                            _buildDayCell(day),
                        todayBuilder: (context, day, focusedDay) =>
                            _buildDayCell(day, isToday: true),
                        outsideBuilder: (context, day, focusedDay) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_fire_department_rounded,
                              color: const Color(0xFFE2E8F0),
                              size: 22.sp,
                            ),
                            Text(
                              '${day.day}',
                              style: TextStyle(
                                color: const Color(0xFFCBD5E1),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
