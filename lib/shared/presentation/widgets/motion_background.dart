import 'dart:math' as math;

import 'package:flutter/material.dart';

class MotionBackground extends StatefulWidget {
  final Widget child;
  final double scrollOffset;

  const MotionBackground({
    super.key,
    required this.child,
    this.scrollOffset = 0,
  });

  @override
  State<MotionBackground> createState() => _MotionBackgroundState();
}

class _MotionBackgroundState extends State<MotionBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 22),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final progress = _controller.value;
        final wave = math.sin(progress * math.pi * 2);
        final sway = math.cos(progress * math.pi * 2);
        final parallax = widget.scrollOffset * 0.0005;

        final gradient = LinearGradient(
          begin: Alignment(-0.8 + parallax, -1 + wave * 0.2),
          end: Alignment(1 - parallax, 1 + sway * 0.2),
          colors: isDark
              ? [
                  colorScheme.surface,
                  colorScheme.surface.withValues(alpha: 0.95),
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.75),
                ]
              : [
                  colorScheme.surface,
                  colorScheme.surface,
                  colorScheme.surfaceContainerHighest,
                ],
        );

        return DecoratedBox(
          decoration: BoxDecoration(gradient: gradient),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _StarfieldPainter(
                    progress: progress,
                    color:
                        (isDark ? colorScheme.onSurface : colorScheme.onSurface)
                            .withValues(alpha: 0.06),
                  ),
                ),
              ),
              _GlowingBlob(
                color: (isDark
                    ? colorScheme.primary.withValues(alpha: 0.08)
                    : colorScheme.primary.withValues(alpha: 0.12)),
                diameter: isDark ? 360 : 320,
                top: -80 + wave * 20,
                left: -60 + parallax * 240,
              ),
              _GlowingBlob(
                color: (isDark
                    ? colorScheme.secondary.withValues(alpha: 0.08)
                    : colorScheme.secondary.withValues(alpha: 0.12)),
                diameter: isDark ? 320 : 280,
                bottom: -60 + sway * 15,
                right: -40 - parallax * 260,
              ),
              _GlowingBlob(
                color: (isDark
                    ? colorScheme.tertiary.withValues(alpha: 0.08)
                    : colorScheme.tertiary.withValues(alpha: 0.12)),
                diameter: isDark ? 420 : 380,
                top: 180 + parallax * 120,
                right: 60 + wave * 30,
              ),
              widget.child,
            ],
          ),
        );
      },
    );
  }
}

class _GlowingBlob extends StatelessWidget {
  final Color color;
  final double diameter;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const _GlowingBlob({
    required this.color,
    required this.diameter,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: IgnorePointer(
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                color,
                color.withValues(alpha: 0.03),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StarfieldPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _StarfieldPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.3;

    const columns = 14;
    const rows = 10;
    for (var c = 0; c <= columns; c++) {
      for (var r = 0; r <= rows; r++) {
        final dx = c / columns;
        final dy = r / rows;
        final pulse = math.sin((progress * 2 * math.pi) + (dx + dy) * 6);
        final offset = Offset(
          size.width * (dx + pulse * 0.002),
          size.height * (dy + pulse * 0.002),
        );
        final opacity = 0.05 + (pulse + 1) * 0.1;
        canvas.drawCircle(
          offset,
          1.6 + pulse.abs() * 1.2,
          paint..color = color.withValues(alpha: opacity),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _StarfieldPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
