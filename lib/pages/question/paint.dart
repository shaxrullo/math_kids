import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Foydalanish:
/// showDialog(
///   context: context,
///   builder: (context) => const BoardDialog(),
/// );
class BoardDialog extends StatelessWidget {
  const BoardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Board",
              style: GoogleFonts.lilitaOne(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const DrawingBoard(),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE1E7EF),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  minimumSize: Size(double.infinity, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                child: Text(
                  "Close",
                  style: GoogleFonts.lilitaOne(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
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

/// Paint dasturi kabi qo'l harakati bilan chizish uchun taxta.
/// Foydalanuvchi barmog'i / sichqoncha bilan sudrab chizadi.
class DrawingBoard extends StatefulWidget {
  const DrawingBoard({
    super.key,
    this.backgroundColor = const Color(0xFF15A04C),
    this.strokeColor = Colors.white,
    this.strokeWidth = 6,
  });

  final Color backgroundColor;
  final Color strokeColor;
  final double strokeWidth;

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {
  // Har bir chiziq alohida nuqtalar ro'yxati (bir barmoq bosib-ko'targuncha)
  final List<List<Offset>> _strokes = [];

  void _startStroke(Offset point) {
    setState(() {
      _strokes.add([point]);
    });
  }

  void _addPoint(Offset point) {
    setState(() {
      _strokes.last.add(point);
    });
  }

  void _clear() {
    setState(() {
      _strokes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(color: widget.backgroundColor),
        ),
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanStart: (details) => _startStroke(details.localPosition),
            onPanUpdate: (details) => _addPoint(details.localPosition),
            child: CustomPaint(
              painter: _DrawingPainter(
                strokes: _strokes,
                color: widget.strokeColor,
                strokeWidth: widget.strokeWidth,
              ),
              size: Size.infinite,
            ),
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Material(
            color: Colors.black.withOpacity(0.25),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: _clear,
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(Icons.refresh, color: Colors.white, size: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawingPainter extends CustomPainter {
  _DrawingPainter({
    required this.strokes,
    required this.color,
    required this.strokeWidth,
  });

  final List<List<Offset>> strokes;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) {
        // Yagona tegish - nuqta chizish
        if (stroke.isNotEmpty) {
          canvas.drawCircle(
            stroke.first,
            strokeWidth / 2,
            paint..style = PaintingStyle.fill,
          );
          paint.style = PaintingStyle.stroke;
        }
        continue;
      }
      final path = Path()..moveTo(stroke.first.dx, stroke.first.dy);
      for (int i = 1; i < stroke.length; i++) {
        path.lineTo(stroke[i].dx, stroke[i].dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DrawingPainter oldDelegate) => true;
}