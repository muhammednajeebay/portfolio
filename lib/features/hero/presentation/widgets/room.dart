
import 'package:flutter/material.dart';

/// Paints simple perspective lines for minimalist background
class SimplePerspectivePainter extends CustomPainter {
  final double opacity;
  final bool isDark;

  SimplePerspectivePainter({
    required this.opacity,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Clean background - pure white for light mode
    final bgPaint = Paint()..style = PaintingStyle.fill;
    bgPaint.color = (isDark ? const Color(0xFF0a0a0a) : const Color(0xFFFFFFFF))
        .withOpacity(opacity);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Perspective lines - subtle to match design
    paint.color =
        (isDark ? Colors.white : Colors.black).withOpacity(0.12 * opacity);

    // Convergence point (where lines meet) - near person/chair area
    final vanishX = size.width * 0.72;
    final vanishY = size.height * 0.72;

    // Bottom left corner to vanishing point
    canvas.drawLine(
      Offset(0, size.height),
      Offset(vanishX, vanishY),
      paint,
    );

    // Bottom right corner to vanishing point
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(vanishX, vanishY),
      paint,
    );

    // Vertical line at vanishing point (corner edge)
    paint.strokeWidth = 1.2;
    paint.color =
        (isDark ? Colors.white : Colors.black).withOpacity(0.15 * opacity);
    canvas.drawLine(
      Offset(vanishX, 0),
      Offset(vanishX, vanishY),
      paint,
    );

    // Subtle floor shadow
    final shadowPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(0.04 * opacity),
        ],
      ).createShader(
        Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2),
      );

    canvas.drawRect(
      Rect.fromLTWH(0, size.height * 0.8, size.width, size.height * 0.2),
      shadowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant SimplePerspectivePainter old) =>
      opacity != old.opacity || isDark != old.isDark;
}
