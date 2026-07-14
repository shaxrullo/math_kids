import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/models/buttun.dart';
import 'package:math_kids/models/test/test.dart';
import 'package:math_kids/pages/question/lastpage.dart';
import 'package:math_kids/pages/question/paint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Quetion extends StatefulWidget {
  const Quetion({super.key});

  @override
  State<Quetion> createState() => _QuetionState();
}

class _QuetionState extends State<Quetion> {
  int soni = 0;
  int togriSoni = 0;
  int xatoSoni = 0;
  List<Test> tests = [];
  bool pageUpdate = false;
  int? selectedIndex;
  int seconds = 60;
  int ishlatilganTime = 0;
  int secondsLast = 1;
  Timer? timer;
  bool? isCorrect;
  final supabase = Supabase.instance.client;
  int maxQuestions = 5;

  Future<void> getTests() async {
    final response = await supabase.from('test').select().order('id');

    tests = response.map((e) => Test.fromJson(e)).toList();

    loadQuestion();

    setState(() {});
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
          ishlatilganTime++;
          secondsLast++;
        });
      } else {
        timer.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FailureScreen(soni: soni, time: ishlatilganTime),
          ),
        );
        print("Time is over");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getTests();
    startTimer();
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  List<String> options = [];

  void loadQuestion() {
    if (soni >= tests.length) return;

    options = [
      tests[soni].option1,
      tests[soni].option2,
      tests[soni].option3,
      tests[soni].correctAnswer,
    ];

    options.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (tests.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        elevation: 12,
        scrolledUnderElevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
        ),
        toolbarHeight: 72.h,

        leading: Icon(Icons.close),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Time Left",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.access_time_filled_sharp,
                  color: AppColors.warningBorder,
                ),
                Text(
                  "${seconds}",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: AppColors.warningBorder,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.warningBorder,
              backgroundColor: AppColors.borderWhite,
              value: (60 - seconds) / 60,
              minHeight: 14.h,
            ),
            SizedBox(height: 20.h),
            Container(
              height: 200.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.successBorder,
                border: Border(
                  bottom: BorderSide(width: 6, color: Colors.black),
                  left: BorderSide(width: 3, color: Colors.black),
                  right: BorderSide(width: 3, color: Colors.black),
                  top: BorderSide(width: 3, color: Colors.black),
                ),
              ),
              child: Text(
                tests[soni].question,
                style: GoogleFonts.lilitaOne(
                  fontWeight: FontWeight.w600,
                  fontSize: 48,
                  color: AppColors.textWhite,
                  height: 2,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 210.h,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  print(options);
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        selectedIndex = index;
                        isCorrect = options[index] == tests[soni].correctAnswer;

                        if (isCorrect == true) {
                          togriSoni++;
                        } else {
                          xatoSoni++;
                        }
                      });
                      await Future.delayed(const Duration(milliseconds: 700));
                      if (soni >= maxQuestions - 1) {
                        timer?.cancel();

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FailureScreen(
                              soni: togriSoni,
                              time: ishlatilganTime,
                            ),
                          ),
                        );
                        return;
                      }

                      // Keyingi savol
                      setState(() {
                        soni++;
                        selectedIndex = null;
                        isCorrect = null;
                        loadQuestion();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.borderPrimary,
                        border: Border.all(
                          color: selectedIndex == index
                              ? (isCorrect! ? Colors.green : Colors.red)
                              : AppColors.borderSecondary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        options[index],
                        style: GoogleFonts.lilitaOne(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                helper(
                  onHit: () {
                    if (soni >= maxQuestions - 1) {
                      timer?.cancel();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FailureScreen(
                            soni: togriSoni + 1,
                            time: ishlatilganTime,
                          ),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      togriSoni++;
                      soni++;
                      loadQuestion();
                    });
                  },
                ),
                SizedBox(width: 15.w),
                ElevatedButton(
                  onPressed: () => showDialog(
                    builder: (context) => BoardDialog(),
                    context: context,
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60.w, 60.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    backgroundColor: AppColors.brandContent,
                    foregroundColor: AppColors.textWhite,
                  ),
                  child: Icon(Icons.mode_edit_outline_rounded),
                ),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

class helper extends StatelessWidget {
  VoidCallback onHit;
  helper({super.key, required this.onHit});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.textWhite,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/app/Frame 17.png"),

                  SizedBox(height: 16.h),
                  Text(
                    "You have 3 chances for getting a hint! If you click \"Get Hint\", your question will be completed automatically.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lilitaOne(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  SizedBox(height: 24.h),

                  Row(
                    children: [
                      Expanded(
                        child: buttun(
                          width: 172.w,
                          color: AppColors.textWhite,
                          txcolor: AppColors.textPrimary,
                          text: "Close",
                          onTab: () => Navigator.pop(context),
                          height: 52.h,
                        ),
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: buttun(
                          color: AppColors.brandContent,
                          txcolor: AppColors.textWhite,
                          text: "Get Hint",
                          onTab: () {
                            Navigator.pop(context);
                            onHit();
                          },
                          height: 52.h,
                          width: 172.w,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(60.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.brandContent,
        foregroundColor: AppColors.textWhite,
      ),
      child: Icon(Icons.arrow_forward_ios),
    );
  }
}
