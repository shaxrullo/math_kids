import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Input maydonining holati
enum InputFieldStatus { placeholder, filled, error }

class CustomInputField extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final InputFieldStatus status;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.status = InputFieldStatus.placeholder,
    this.errorText,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  });

  // --- Ranglar ---
  Color get _bgColor {
    switch (status) {
      case InputFieldStatus.placeholder:
        return const Color(0xFFF3F6FB);
      case InputFieldStatus.filled:
        return const Color(0xFFEDF1F7);
      case InputFieldStatus.error:
        return const Color(0xFFFCE9E9);
    }
  }

  Color get _textColor {
    switch (status) {
      case InputFieldStatus.placeholder:
        return const Color(0xFF9AA5B1);
      case InputFieldStatus.filled:
        return const Color(0xFF1B2430);
      case InputFieldStatus.error:
        return const Color(0xFFE05353);
    }
  }

  Border? get _border {
    if (status == InputFieldStatus.placeholder) {
      return Border.all(
        color: const Color(0xFF7C3AED),
        width: 1.5,
        style: BorderStyle
            .solid, // pastroqda DottedBorder bilan almashtirsa bo'ladi
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1B2430),
          ),
        ),
        SizedBox(height: 8.h),

        // Input maydoni
        Container(
          width: 358.w,
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: _bgColor,
            borderRadius: BorderRadius.circular(14.r),
            border: _border,
          ),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: _textColor,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hintText ?? 'Placeholder',
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9AA5B1),
              ),
            ),
          ),
        ),

        // Error matni (agar bo'lsa)
        if (status == InputFieldStatus.error && errorText != null) ...[
          SizedBox(height: 4.h),
          Text(
            errorText!,
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFFE05353)),
          ),
        ],
      ],
    );
  }
}
//
// /// Foydalanish namunasi
// class InputFieldDemo extends StatelessWidget {
//   const InputFieldDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.all(20.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const CustomInputField(
//               label: 'Label',
//               status: InputFieldStatus.placeholder,
//             ),
//             SizedBox(height: 24.h),
//             const CustomInputField(
//               label: 'Label',
//               status: InputFieldStatus.filled,
//               hintText: 'Filled',
//             ),
//             SizedBox(height: 24.h),
//             const CustomInputField(
//               label: 'Label',
//               status: InputFieldStatus.error,
//               hintText: 'Filled',
//               errorText: 'Xatolik matni shu yerda',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }