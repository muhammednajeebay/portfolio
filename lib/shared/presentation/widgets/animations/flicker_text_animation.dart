import 'dart:math';
import 'package:flutter/material.dart';

class FlickerTextAnimation extends StatefulWidget {
  const FlickerTextAnimation({
    super.key,
    required this.controller,
    this.textColor,
    this.fadeInColor,
    required this.text,
    this.textStyle,
    this.start = 0.0,
    this.end = 1.0,
    this.wrapAlignment = WrapAlignment.start,
    this.fontSize,
  });

  final Animation<double> controller;
  final Color? textColor;
  final Color? fadeInColor;
  final String text;
  final double? fontSize;
  final TextStyle? textStyle;
  final double start;
  final double end;
  final WrapAlignment wrapAlignment;

  @override
  State<FlickerTextAnimation> createState() => _FlickerTextAnimationState();
}

class _FlickerTextAnimationState extends State<FlickerTextAnimation> {
  late Animation<Color?> _colorAnimation;
  late Animation<int> _titleAnimation;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    widget.controller.addStatusListener(_statusListener);
  }

  void _initAnimations() {
    _colorAnimation = ColorTween(
      begin: widget.textColor ?? Colors.grey,
      end: widget.fadeInColor ?? Colors.white,
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(
          widget.start,
          widget.end,
          curve: Curves.easeIn,
        ),
      ),
    );

    _titleAnimation = IntTween(
      begin: (Random().nextDouble() * pow(10, widget.text.length)).toInt(),
      end: (Random().nextDouble() * pow(10, widget.text.length)).toInt(),
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(
          widget.start,
          widget.end,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      if (mounted) {
        setState(() {
          isAnimating = true;
        });
      }
    }
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed) {
      if (mounted) {
        setState(() {
          isAnimating = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(FlickerTextAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller ||
        oldWidget.textColor != widget.textColor ||
        oldWidget.fadeInColor != widget.fadeInColor ||
        oldWidget.start != widget.start ||
        oldWidget.end != widget.end) {
      oldWidget.controller.removeStatusListener(_statusListener);
      _initAnimations();
      widget.controller.addStatusListener(_statusListener);
    }
  }

  @override
  void dispose() {
    widget.controller.removeStatusListener(_statusListener);
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final theme = Theme.of(context);
    return Wrap(
      alignment: widget.wrapAlignment,
      spacing: 0,
      runSpacing: 0,
      children: [
        Text(
          isAnimating
              ? _titleAnimation.value
                  .toString()
                  .padLeft(widget.text.length, '0')
                  .substring(0, widget.text.length)
              : widget.text,
          style: widget.textStyle?.copyWith(
                color: _colorAnimation.value,
                fontSize: widget.fontSize,
              ) ??
              theme.textTheme.titleLarge?.copyWith(
                color: _colorAnimation.value,
                fontSize: widget.fontSize,
              ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
