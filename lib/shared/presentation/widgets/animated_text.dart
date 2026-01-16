import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final int delay;
  final TextStyle style;
  final Widget? child;

  const AnimatedText({
    super.key,
    required this.text,
    required this.delay,
    required this.style,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 700 + delay),
      curve: Curves.easeOut,
      builder: (context, value, _) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child ?? Text(text, style: style),
          ),
        );
      },
    );
  }
}
