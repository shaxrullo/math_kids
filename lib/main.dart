import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/pages/homepage/homepage.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding6_page.dart';
import 'package:math_kids/pages/register_pages/sign_in_page.dart';
import 'package:math_kids/pages/splash_pages/splash_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';
import 'package:math_kids/pages/stakes/steakIn.dart';
import 'package:math_kids/pages/coin_pages/coins_page.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          home: CoinsPage(),

        );
      },
    ),
  );
}