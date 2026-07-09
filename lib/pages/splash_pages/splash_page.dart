import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _progress;
  late final AnimationController _rayController;

  static const Color _redColor = Color(0xFFFF6B6B);
  static const Color _bgColor = Color(0xFF00BCFF);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:5 ),
    );
    _progress = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigator.pushReplacement(context, ...);
      }
    });

    // Nurlar (sunburst) uchun sekin aylanuvchi animatsiya
    _rayController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _rayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Aylanuvchi sunburst fon
          AnimatedBuilder(
            animation: _rayController,
            builder: (context, child) {
              return CustomPaint(
                painter: _SunburstPainter(
                  rotation: _rayController.value * 2 * math.pi,
                ),
              );
            },
          ),

          // Asosiy kontent (logo + progress bar)
          Column(
            children: [
              // Logo markazda
              Expanded(
                  child: Positioned(
                    top: 296.h,
                    right: 85.w,
                    child: Container(
                      width: 220.w,
                      height: 171.h,
                      margin: .all(20),
                      child: Image.asset("assets/app/img.png"),
                    ),
                  ),
              ),

              // Pastdagi progress bar bloki
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Loading... va foiz
                    AnimatedBuilder(
                      animation: _progress,
                      builder: (context, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Loading...",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "${(_progress.value * 100).round()}%",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 12.h),

                    // Progress bar - oq border, qizil to'lish, ko'k track
                    AnimatedBuilder(
                      animation: _progress,
                      builder: (context, child) {
                        return Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1568C1),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: _progress.value.clamp(0.0, 1.0),
                                child: Container(color: _redColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Sunburst (quyosh nurlari) effektini chizadigan painter.
/// Ikkita och/to'q ko'k rang navbatlashib, markazdan chetga qarab nurlar chiziladi.
class _SunburstPainter extends CustomPainter {
  final double rotation;

  _SunburstPainter({required this.rotation});

  static const int _rayCount = 16;
  static const Color _lightRay = Color(0xFF1FC2FF);
  static const Color _darkRay = Color(0xFF00A8E8);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.longestSide;
    final anglePerRay = (2 * math.pi) / _rayCount;

    for (int i = 0; i < _rayCount; i++) {
      final startAngle = rotation + i * anglePerRay;
      final paint = Paint()
        ..color = i.isEven ? _lightRay : _darkRay
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..lineTo(
          center.dx + radius * math.cos(startAngle),
          center.dy + radius * math.sin(startAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          anglePerRay,
          false,
        )
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SunburstPainter oldDelegate) {
    return oldDelegate.rotation != rotation;
  }
}