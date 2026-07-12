import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD:lib/pages/register_pages/sign_up_page.dart
=======
import 'package:math_kids/constlar/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
>>>>>>> 38e61e2 (yangi narsalar qoshildi):lib/pages/register_pages/sign_In_page.dart

import '../../models/buttun.dart';
import '../../models/custom_input_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00BCFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 105.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Container(
            width: 358.w,
            height: 472.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: Text(
<<<<<<< HEAD:lib/pages/register_pages/sign_up_page.dart
                      "Create Account!",
                      style: GoogleFonts.lilitaOne(
=======
                      "SIGN IN",
                      style: GoogleFonts.lilitaOne(
                        fontWeight: FontWeight.w500,
>>>>>>> 38e61e2 (yangi narsalar qoshildi):lib/pages/register_pages/sign_In_page.dart
                        fontSize: 30.sp,
                        color: const Color(0xFF1D293D),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: SizedBox(
                          width: 200.w,
                          height: 48.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // chap
                              Positioned(
                                left: 42.w,
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset("assets/avatars/img.png"),
                                ),
                              ),

                              // markaz
                              Container(
                                width: 48.w,
                                height: 48.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset("assets/avatars/img.png"),
                              ),

                              // o'ng
                              Positioned(
                                right: 42.w,
                                child: Container(
                                  width: 48.w,
                                  height: 48.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset("assets/avatars/img.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 210.h,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 310.w,
                          height: 84.h,
                          child: CustomInputField(
                            label: 'Email',
                            hintText: 'Enter your email',
                            controller: _passwordController,
                            status: InputFieldStatus.filled,
                          ),
                        ),
                        SizedBox(
                          width: 310.w,
                          height: 84.h,
                          child: CustomInputField(
                            label: 'Password',
                            hintText: 'Enter your password',
                            controller: _emailController,
                            status: InputFieldStatus.filled,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 310.w,
                    child: buttun(
                      color: Color(0xFF00DC82),
                      text: 'SIGN IN',
                      onTab: () {} ,
                      height: 52.h,
                      width: 310.w,
                      txcolor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: .only(top: 16.h),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.lilitaOne(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF9AA5B1),
                        ),
                        children: [
                          const TextSpan(text: "Don't have an account  "),
                          TextSpan(
                            text: "Sign up",
                            style: GoogleFonts.lilitaOne(
                              color: Color(0xFF2196F3),
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
