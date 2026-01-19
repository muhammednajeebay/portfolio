import 'package:flutter/material.dart';
import 'package:portfolio/shared/presentation/widgets/slide_box_reveal_text.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final int delay;
  final TextStyle style;
  final Widget? child;
  final bool useSlideBoxAnimation;

  const AnimatedText({
    super.key,
    required this.text,
    required this.delay,
    required this.style,
    this.child,
    this.useSlideBoxAnimation = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = child ?? Text(text, style: style);

    // Use slide box animation if enabled
    if (useSlideBoxAnimation) {
      return SlideBoxRevealText(
        delay: Duration(milliseconds: delay),
        curve: Curves.easeInOut,
        child: content,
      );
    }

    // Otherwise use the original fade/slide animation
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 700 + delay),
      curve: Curves.easeOut,
      builder: (context, value, _) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: content,
          ),
        );
      },
    );
  }
}
