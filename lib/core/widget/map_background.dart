import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class MapBackground extends StatelessWidget {
  final bool showRoute;

  const MapBackground({
    super.key,
    this.showRoute = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MapPainter(showRoute: showRoute),
      child: Container(),
    );
  }
}

class _MapPainter extends CustomPainter {
  final bool showRoute;

  _MapPainter({required this.showRoute});

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()..color = const Color(0xFF08101F);
    canvas.drawRect(Offset.zero & size, bgPaint);

    final roadPaint = Paint()
      ..color = const Color(0xFF212A3A)
      ..style = PaintingStyle.fill;

    final blockPaint = Paint()
      ..color = const Color(0xFF2B3445)
      ..style = PaintingStyle.fill;

    final softBlockPaint = Paint()
      ..color = const Color(0xFF3C4350).withOpacity(.55)
      ..style = PaintingStyle.fill;

    final yellowRoad = Paint()
      ..color = AppColors.primary.withOpacity(.88)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final tinyDot = Paint()..color = const Color(0xFF786AFF).withOpacity(.45);

    final planes = Paint()..color = Colors.white.withOpacity(.07);

    // Big road / structures
    final blocks = [
      Rect.fromLTWH(24, 120, 110, 92),
      Rect.fromLTWH(160, 90, 150, 120),
      Rect.fromLTWH(62, 248, 140, 100),
      Rect.fromLTWH(230, 242, 150, 110),
      Rect.fromLTWH(26, 392, 155, 124),
      Rect.fromLTWH(212, 404, 168, 120),
      Rect.fromLTWH(100, 560, 112, 90),
    ];

    for (var rect in blocks) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(18)),
        blockPaint,
      );
    }

    final roads = [
      Rect.fromLTWH(0, 220, size.width, 20),
      Rect.fromLTWH(144, 0, 20, size.height),
      Rect.fromLTWH(0, 370, size.width, 18),
      Rect.fromLTWH(210, 0, 16, size.height),
    ];

    for (var rect in roads) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(12)),
        roadPaint,
      );
    }

    for (int i = 0; i < 18; i++) {
      final dx = 18 + (i % 6) * 62.0;
      final dy = 150 + (i ~/ 6) * 110.0;
      canvas.drawCircle(Offset(dx + 12, dy + 12), 4.2, tinyDot);
    }

    for (int i = 0; i < 8; i++) {
      final rect = Rect.fromLTWH(
        16 + (i % 4) * 88,
        640 + (i ~/ 4) * 70,
        62,
        44,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(12)),
        softBlockPaint,
      );
    }

    final plane1 = Path()
      ..moveTo(40, 70)
      ..lineTo(80, 56)
      ..lineTo(70, 76)
      ..lineTo(102, 88)
      ..lineTo(98, 98)
      ..lineTo(66, 90)
      ..lineTo(76, 118)
      ..lineTo(64, 122)
      ..lineTo(52, 96)
      ..lineTo(34, 104)
      ..close();
    canvas.drawPath(plane1, planes);

    final plane2 = Path()
      ..moveTo(250, 150)
      ..lineTo(288, 136)
      ..lineTo(280, 154)
      ..lineTo(306, 166)
      ..lineTo(302, 176)
      ..lineTo(274, 168)
      ..lineTo(282, 192)
      ..lineTo(270, 196)
      ..lineTo(260, 172)
      ..lineTo(242, 180)
      ..close();
    canvas.drawPath(plane2, planes);

    if (showRoute) {
      final path = Path()
        ..moveTo(70, 300)
        ..lineTo(120, 300)
        ..lineTo(170, 350)
        ..lineTo(250, 350)
        ..lineTo(300, 430)
        ..lineTo(225, 520);

      canvas.drawPath(path, yellowRoad);
      canvas.drawCircle(const Offset(70, 300), 9, Paint()..color = AppColors.primary);
      canvas.drawCircle(
        const Offset(225, 520),
        11,
        Paint()
          ..color = Colors.transparent
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5
          ..color = AppColors.primary,
      );
    } else {
      final cubeRect = Rect.fromLTWH(130, 240, 80, 120);
      canvas.drawRRect(
        RRect.fromRectAndRadius(cubeRect, const Radius.circular(4)),
        Paint()..color = AppColors.primaryDeep,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MapPainter oldDelegate) {
    return oldDelegate.showRoute != showRoute;
  }
}