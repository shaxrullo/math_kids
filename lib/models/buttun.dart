import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class buttun extends StatelessWidget {
  Color color;
  Color txcolor;
  String text;
  var onTab;
  double height;
  double width;

  buttun({
    required this.color,
    required this.txcolor,
    required this.text,
    required this.onTab,
    required this.height,
    required this.width,
    super.key,
  });

  // Asosiy rangdan pastroq (qorong'iroq) soya rangini hisoblaydi
  Color get _shadowColor {
    final hsl = HSLColor.fromColor(color);
    return hsl
        .withLightness((hsl.lightness - 0.12).clamp(0.0, 1.0))
        .toColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: SizedBox(
        width: width,
        height: height + 6.h,
        child: Stack(
          children: [
            // Pastdagi qorong'iroq soya qatlami
            Positioned(
              top: 6.h,
              left: 0,
              right: 0,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: _shadowColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
            ),

            // Asosiy tugma
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: txcolor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}