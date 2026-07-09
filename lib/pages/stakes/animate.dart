import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfettiFlamePage extends StatelessWidget {
  const ConfettiFlamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 358.w,
        height: 200.h,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Markazdagi olov ikonkasi
            const Icon(
                  Icons.local_fire_department,
                  color: Colors.orange,
                  size: 90,
                )
                .animate()
                .scale(
                  begin: const Offset(0.3, 0.3),
                  end: const Offset(1, 1),
                  duration: 500.ms,
                  curve: Curves.elasticOut,
                )
                .fadeIn(duration: 300.ms),

            // Konfetilar - pastdan chap-tepaga va o'ng-tepaga otiladi
            ..._buildConfetti(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildConfetti() {
    final random = Random();
    final colors = [
      Colors.orange,
      Colors.pink,
      Colors.blue,
      Colors.teal,
      Colors.red,
      Colors.purple,
      Colors.amber,
    ];

    // Otilish nuqtasi - olovning pastki markazi
    const originLeft = 179.0;
    const originTop = 150.0;

    return List.generate(14, (index) {
      final goesRight = index.isEven;

      // Tepaga qarab burchak: 20°-80° oralig'ida (0° = gorizontal, 90° = vertikal tepa)
      final degrees = 20 + random.nextDouble() * 60;
      final theta = degrees * pi / 180;

      final distance = 80 + random.nextDouble() * 110;
      final dx = cos(theta) * distance * (goesRight ? 1 : -1);
      final dy = -sin(theta) * distance; // manfiy = tepaga

      final size = 6.0 + random.nextDouble() * 10;
      final color = colors[random.nextInt(colors.length)];
      final delay = random.nextInt(150);
      final isBar = random.nextBool();

      final Widget piece = isBar
          ? Container(
              width: size,
              height: size * 1.6,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            )
          : ClipPath(
              clipper: _RibbonClipper(),
              child: Container(width: size * 2, height: size, color: color),
            );

      final Widget animatedPiece = piece
          .animate()
          .fadeIn(delay: delay.ms, duration: 150.ms)
          .move(
            begin: Offset.zero,
            end: Offset(dx, dy),
            delay: delay.ms,
            duration: 700.ms,
            curve: Curves.easeOutCubic,
          )
          .rotate(
            begin: 0,
            end: (goesRight ? 1 : -1) * (1.5 + random.nextDouble() * 2),
            delay: delay.ms,
            duration: 700.ms,
          )
          .fadeOut(delay: (delay + 400).ms, duration: 300.ms);

      return Positioned(left: originLeft, top: originTop, child: animatedPiece);
    });
  }
}

// To'lqinsimon lenta shaklidagi konfeti uchun clipper
class _RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width / 4, 0, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height,
      size.width,
      size.height / 2,
    );
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 3 / 4,
      size.height * 1.2,
      size.width / 2,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width / 4,
      size.height * 0.3,
      0,
      size.height * 0.7,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}