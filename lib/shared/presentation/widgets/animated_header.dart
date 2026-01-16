import 'package:flutter/material.dart';

class AnimatedHeader extends StatefulWidget {
  const AnimatedHeader({
    super.key,
    required this.text,
    required this.style,
    this.hoverStyle,
    this.selectedStyle,
    this.isSelected = false,
    this.controller,
    this.hasOffsetAnimation = true,
    this.hasSlideBoxAnimation = false,
    this.onTap,
    this.enableHover = true,
  });

  final String text;

  /// Default style
  final TextStyle style;

  /// Applied on hover (desktop/web only)
  final TextStyle? hoverStyle;

  /// Applied when selected
  final TextStyle? selectedStyle;

  final bool isSelected;
  final bool enableHover;

  /// Optional external controller
  final AnimationController? controller;

  final bool hasOffsetAnimation;
  final bool hasSlideBoxAnimation;

  final VoidCallback? onTap;

  @override
  State<AnimatedHeader> createState() => _AnimatedHeaderState();
}

class _AnimatedHeaderState extends State<AnimatedHeader> {
  bool _hovering = false;

  TextStyle get _effectiveStyle {
    if (widget.isSelected) {
      return widget.selectedStyle ?? widget.style;
    }
    if (_hovering && widget.enableHover) {
      return widget.hoverStyle ?? widget.style;
    }
    return widget.style;
  }

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: AnimatedLineThroughText(
        text: widget.text,
        textStyle: _effectiveStyle,
        isUnderlinedOnHover: false,
        hasOffsetAnimation: widget.hasOffsetAnimation,
        hasSlideBoxAnimation: widget.hasSlideBoxAnimation,
        controller: widget.controller,
      ),
    );

    if (!widget.enableHover) return child;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: child,
    );
  }
}

class AnimatedLineThroughText extends StatefulWidget {
  const AnimatedLineThroughText({
    super.key,
    required this.text,
    required this.textStyle,
    this.isUnderlinedOnHover = false,
    this.hasOffsetAnimation = false,
    this.hasSlideBoxAnimation = false,
    this.controller,
  });

  final String text;
  final TextStyle textStyle;

  final bool isUnderlinedOnHover;
  final bool hasOffsetAnimation;
  final bool hasSlideBoxAnimation;

  final AnimationController? controller;

  @override
  State<AnimatedLineThroughText> createState() =>
      _AnimatedLineThroughTextState();
}

class _AnimatedLineThroughTextState extends State<AnimatedLineThroughText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 250),
        );

    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    if (widget.controller == null) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Text(
        widget.text,
        style: widget.textStyle.copyWith(
          decoration: widget.isUnderlinedOnHover
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
