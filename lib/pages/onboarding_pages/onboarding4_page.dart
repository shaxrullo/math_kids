import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding5_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';
import '../../models/buttun.dart';
import '../../models/onbording.dart';

class Onboarding4Page extends StatefulWidget {
  const Onboarding4Page({super.key});

  @override
  State<Onboarding4Page> createState() => _Onboarding4PageState();
}

class _Onboarding4PageState extends State<Onboarding4Page> {
  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final List<int> _days = List.generate(31, (i) => i + 1);
  final List<int> _years = List.generate(50, (i) => 1980 + i);

  int _selectedDay = 25; // ko'rsatilgan qiymat
  int _selectedMonthIndex = 11; // Dec
  int _selectedYearIndex = 27; // 1980 + 27 = 2007

  static const double _itemHeight = 56;
  String get date =>
      "$_selectedDay ${_months[_selectedMonthIndex]} ${_years[_selectedYearIndex]}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: OnboardingAppBar(
        progress: 0.67,
        onClose: () => Navigator.pop(context),
        onSkip: () {
          if (date.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Steak()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ism kiritng',
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.textWhite,
                  ),
                ),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.black54,
              ),
            );
          }
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: Text(
                    "How old are you?",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1D293D),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),

                // Kun / Oy / Yil pickerlari
                SizedBox(
                  height: _itemHeight * 3,
                  child: ScrollConfiguration(
                    behavior: const _NoGlowScrollBehavior(),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CupertinoPicker(
                                itemExtent: _itemHeight,
                                scrollController: FixedExtentScrollController(
                                  initialItem: _selectedDay - 1,
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() => _selectedDay = index + 1);
                                },
                                selectionOverlay: const SizedBox.shrink(),
                                children: _days.map((d) {
                                  final isSelected = d == _selectedDay;
                                  return _pickerItem(d.toString(), isSelected);
                                }).toList(),
                              ),
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                itemExtent: _itemHeight,
                                scrollController: FixedExtentScrollController(
                                  initialItem: _selectedMonthIndex,
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() => _selectedMonthIndex = index);
                                },
                                selectionOverlay: const SizedBox.shrink(),
                                children: _months.asMap().entries.map((e) {
                                  final isSelected =
                                      e.key == _selectedMonthIndex;
                                  return _pickerItem(e.value, isSelected);
                                }).toList(),
                              ),
                            ),
                            Expanded(
                              child: CupertinoPicker(
                                itemExtent: _itemHeight,
                                scrollController: FixedExtentScrollController(
                                  initialItem: _selectedYearIndex,
                                ),
                                onSelectedItemChanged: (index) {
                                  setState(() => _selectedYearIndex = index);
                                },
                                selectionOverlay: const SizedBox.shrink(),
                                children: _years.asMap().entries.map((e) {
                                  final isSelected =
                                      e.key == _selectedYearIndex;
                                  return _pickerItem(
                                    e.value.toString(),
                                    isSelected,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                        // Yuqori chiziq
                        Positioned(
                          top: _itemHeight,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            color: const Color(0xFF00BCFF),
                          ),
                        ),
                        // Pastki chiziq
                        Positioned(
                          top: _itemHeight * 2,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 2,
                            color: const Color(0xFF00BCFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Pastdagi tugmalar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: buttun(
                    color: const Color(0xFF00BCFF),
                    text: "Next",
                    onTab: () {
                      if (date.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Onboarding5Page(),
                          ),
                        );
                        print("Sizning tug'ilgan sanangiz: ${date}");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Sanani kiritning',
                              style: GoogleFonts.lilitaOne(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: AppColors.textWhite,
                              ),
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black54,
                          ),
                        );
                      }
                    },
                    height: 56.h,
                    width: double.infinity,
                    txcolor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pickerItem(String text, bool isSelected) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSelected ? 26.sp : 22.sp,
          fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
          color: isSelected ? const Color(0xFF1D293D) : const Color(0xFFB4BBC7),
        ),
      ),
    );
  }
}

// Overscroll glow (rang o'zgarish) effektini o'chiradi
class _NoGlowScrollBehavior extends ScrollBehavior {
  const _NoGlowScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}
