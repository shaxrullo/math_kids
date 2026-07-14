import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/pages/coin_pages/coins_page.dart';
import 'package:math_kids/pages/learn_pages/learn2_page.dart';
import 'package:math_kids/pages/learn_pages/learn3_page.dart';
import 'package:math_kids/pages/learn_pages/learn_page.dart';
void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner:false,
          home: LearnPage(),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
