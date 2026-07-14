import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/constlar/supabase.dart';
import 'package:math_kids/pages/onboarding_pages/onboarding_page.dart';
import 'package:math_kids/pages/register_pages/sign_In_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/buttun.dart';
import '../../models/custom_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      _showSnack("Email va parolni kiriting");
      return;
    }

    if (_passwordController.text.trim().length < 6) {
      _showSnack("Parol kamida 6 ta belgidan iborat bo'lishi kerak");
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null) {
        await supabase.from("users").upsert({
          "id": response.user!.id,
          "streak": 0,
          "login_date": DateTime.now().toIso8601String().split("T").first,
        });

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding()),
          );
        }
      }
    } on AuthException catch (e) {
      if (mounted) _showSnack(e.message);
    } catch (e) {
      if (mounted) _showSnack(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00BCFF),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 105.h,
          left: 16.w,
          right: 16.w,
          bottom: 16.h,
        ),
        child: Container(
          width: 358.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Text(
                  "Create Account!",
                  style: GoogleFonts.lilitaOne(
                    fontSize: 30.sp,
                    color: const Color(0xFF1D293D),
                  ),
                ),
              ),
              SizedBox(
                width: 200.w,
                height: 48.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 42.w,
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/avatars/img.png"),
                      ),
                    ),
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("assets/avatars/img.png"),
                    ),
                    Positioned(
                      right: 42.w,
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/avatars/img.png"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 310.w,
                height: 84.h,
                child: CustomInputField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: _emailController,
                  status: InputFieldStatus.filled,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                width: 310.w,
                height: 84.h,
                child: CustomInputField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  status: InputFieldStatus.filled,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 310.w,
                height: 52.h,
                child: buttun(
                  color: const Color(0xFF00DC82),
                  text: _isLoading ? 'Loading...' : 'CREATE ACCOUNT',
                  onTab: _isLoading ? () {} : signUp,
                  height: 52.h,
                  width: 310.w,
                  txcolor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.lilitaOne(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF9AA5B1),
                    ),
                    children: [
                      const TextSpan(text: "Already have an account?  "),
                      TextSpan(
                        text: "Sign In",
                        style: GoogleFonts.lilitaOne(
                          color: const Color(0xFF2196F3),
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
