import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/pages/homepage/allPages.dart';
import 'package:math_kids/pages/stakes/animate.dart';
import 'package:math_kids/servises/services.dart';

class Steak extends StatefulWidget {
  const Steak({super.key});

  @override
  State<Steak> createState() => _SteakState();
}

class _SteakState extends State<Steak> {
  final service = StreakService();

  int streak = 0;

  List activity = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final result = await service.loadStreak();

    streak = result["streak"];

    activity = result["activity"];

    loading = false;

    setState(() {});
  }

  final week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  bool isCompleted(int weekday) {
    for (final item in activity) {
      final date = DateTime.parse(item["login_date"]);

      if (date.weekday == weekday) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 60.h, bottom: 32.h),
                child: SizedBox(
                  height: 200.h,
                  child: const ConfettiFlamePage(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 10.h),
                child: Text(
                  "$streak Day",
                  style: GoogleFonts.lilitaOne(fontSize: 38.sp),
                ),
              ),
              Text(
                "This is your first streak! Next time you must complete tutorial or practice to reach",
                style: GoogleFonts.lilitaOne(
                  height: 1,
                  fontSize: 16.sp,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              Container(
                height: 100.h,
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0XFFF1F5F9),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final completed = isCompleted(index + 1);

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(week[index]),

                          Icon(
                            Icons.local_fire_department,
                            color: completed
                                ? Colors.deepOrange
                                : Colors.grey.shade400,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 122.h),
              buttun(
                color: const Color(0xFF00BCFF),
                txcolor: Colors.white,
                text: "Continue",
                onTab: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Allpages()),
                  );
                },
                height: 52.h,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
