// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final supabase = Supabase.instance.client;

  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  Future<void> addQuestion() async {
    try {
      await supabase.from('test').insert({
        'question': questionController.text,
        'option1': option1Controller.text,
        'option2': option2Controller.text,
        'option3': option3Controller.text,
        'correct_answer': option4Controller.text,
        'level': int.parse(levelController.text),
        'category': categoryController.text,
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Question Added")));

      questionController.clear();
      option1Controller.clear();
      option2Controller.clear();
      option3Controller.clear();
      option4Controller.clear();
      levelController.clear();
      categoryController.clear();
    } catch (e) {
      print("objectsdfghjk ${e}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            field(controller: questionController, text: "Question"),
            field(controller: option1Controller, text: "Option1"),
            field(controller: option2Controller, text: "Option2"),
            field(controller: option3Controller, text: "Option3"),
            field(controller: option4Controller, text: "To'g'ri javob"),
            field(controller: levelController, text: "Level"),
            field(controller: categoryController, text: "Category"),
            Spacer(),
            ElevatedButton(
              onPressed: addQuestion,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60.h),
                backgroundColor: Colors.green,
              ),
              child: Text(
                "Add",
                style: GoogleFonts.lilitaOne(
                  color: AppColors.textWhite,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class field extends StatelessWidget {
  String text;
  TextEditingController controller;
  field({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
