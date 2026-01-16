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
      duration: const Duration(seconds: 25), // Slower for less distraction
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    // We use a Stack to isolate the background from the foreground child.
    // The child is NOT inside the AnimatedBuilder to prevent it from rebuilding 60fps.
    return Stack(
      children: [
        // Background layer with animation
        Positioned.fill(
          child: RepaintBoundary(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                final progress = _controller.value;
                final wave = math.sin(progress * math.pi * 2);
                final sway = math.cos(progress * math.pi * 2);

                // Decoupled parallax: we only use a fraction of the scroll offset
                // and we don't rebuild the WHOLE app on it.
                final parallax = widget.scrollOffset * 0.0003;

                return DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.8 + parallax, -1 + wave * 0.1),
                      end: Alignment(1 - parallax, 1 + sway * 0.1),
                      colors: isDark
                          ? [
                              colorScheme.surface,
                              colorScheme.surface.withValues(alpha: 0.98),
                              colorScheme.surfaceContainerHighest
                                  .withValues(alpha: 0.8),
                            ]
                          : [
                              colorScheme.surface,
                              colorScheme.surface,
                              colorScheme.surfaceContainerHighest
                                  .withValues(alpha: 0.4),
                            ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Starfield is very expensive, isolated in its own RepaintBoundary inside
                      Positioned.fill(
                        child: RepaintBoundary(
                          child: CustomPaint(
                            painter: _StarfieldPainter(
                              progress: progress,
                              color: colorScheme.onSurface
                                  .withValues(alpha: isDark ? 0.05 : 0.03),
                            ),
                          ),
                        ),
                      ),
                      // Blobs are cheaper but still isolated
                      _GlowingBlob(
                        color: colorScheme.primary
                            .withValues(alpha: isDark ? 0.06 : 0.08),
                        diameter: isDark ? 400 : 350,
                        top: -100 + wave * 30,
                        left: -80 + parallax * 300,
                      ),
                      _GlowingBlob(
                        color: colorScheme.secondary
                            .withValues(alpha: isDark ? 0.05 : 0.07),
                        diameter: isDark ? 350 : 300,
                        bottom: -50 + sway * 20,
                        right: -50 - parallax * 300,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        // Foreground layer: The actual application content
        // We do NOT rebuild this 60fps via AnimatedBuilder.
        widget.child,
      ],
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
        child: RepaintBoundary(
          child: Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  color,
                  color.withValues(alpha: 0.01),
                  Colors.transparent,
                ],
              ),
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
      ..strokeCap = StrokeCap.round;

    // Reduced density for performance
    const columns = 10;
    const rows = 8;

    for (var c = 0; c <= columns; c++) {
      for (var r = 0; r <= rows; r++) {
        final dx = c / columns;
        final dy = r / rows;

        // Simpler wave calculation
        final angle = (progress * 2 * math.pi) + (dx + dy) * 4;
        final pulse = math.sin(angle);

        final offset = Offset(
          size.width * dx,
          size.height * dy,
        );

        final opacity = 0.02 + (pulse + 1) * 0.04;
        canvas.drawCircle(
          offset,
          1.2 + pulse.abs() * 0.8,
          paint..color = color.withValues(alpha: opacity),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _StarfieldPainter oldDelegate) {
    // Only repaint if significant change (optional optimization, flutter handles well usually)
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
