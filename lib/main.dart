import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_kids/pages/admin/admin.dart';
import 'package:math_kids/pages/homepage/homepage.dart';
import 'package:math_kids/pages/homepage/profile/edit.dart';
import 'package:math_kids/pages/homepage/profile/profile.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding6_page.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding_page.dart';
import 'package:math_kids/pages/question/quetion.dart';
import 'package:math_kids/pages/register_pages/sign_In_page.dart';
import 'package:math_kids/pages/register_pages/sign_Up_page.dart';
import 'package:math_kids/pages/splash_pages/splash_page.dart';
import 'package:math_kids/pages/stakes/steak.dart';
import 'package:math_kids/pages/stakes/steakIn.dart';
import 'package:math_kids/pages/coin_pages/coins_page.dart';
import 'package:math_kids/pages/substraction/substraction.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://qpuphyurkgdovloytxmd.supabase.co',
    anonKey: 'sb_publishable_Ie275fiObtcoouNnRhzN6w_lCltB_kH',
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: SignUpPage(),
        );
      },
    ),
  );
}
