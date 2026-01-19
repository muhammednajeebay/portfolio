import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// A widget that reveals text with a sliding box animation
/// The box slides from left to right, progressively revealing the text
class SlideBoxRevealText extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Curve curve;
  final Color? boxColor;
  final Color? textColor; // Color to extract from text if boxColor not provided

  const SlideBoxRevealText({
    super.key,
    required this.child,
    this.delay =  const Duration(milliseconds: 10),
    this.curve = Curves.easeInOut,
    this.boxColor,
    this.textColor,
  });

  @override
  State<SlideBoxRevealText> createState() => _SlideBoxRevealTextState();
}

class _SlideBoxRevealTextState extends State<SlideBoxRevealText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:  const Duration(milliseconds: 500),
    );

    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    // Start animation after delay
    Future.delayed(widget.delay, () {
      if (mounted && !_hasStarted) {
        _hasStarted = true;
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Use boxColor if provided, otherwise use textColor, fallback to theme primary color
    final effectiveBoxColor =
        widget.boxColor ?? widget.textColor ?? theme.colorScheme.onSurface;

    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return ClipRect(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // The actual text (always present)
                  widget.child,

                  // The sliding box overlay - positioned to slide from left to right
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    // Width decreases from constraints.maxWidth to 0 as animation progresses
                    width: constraints.maxWidth * (1.0 - _slideAnimation.value),
                    child: Container(
                      color: effectiveBoxColor,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/// A variant that triggers animation when scrolled into view
class SlideBoxRevealTextOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Color? boxColor;

  const SlideBoxRevealTextOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.curve = Curves.easeInOut,
    this.boxColor,
  });

  @override
  State<SlideBoxRevealTextOnScroll> createState() =>
      _SlideBoxRevealTextOnScrollState();
}

class _SlideBoxRevealTextOnScrollState extends State<SlideBoxRevealTextOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Key _visibilityKey;
  bool _isRevealed = false;

  @override
  void initState() {
    super.initState();
    _visibilityKey = UniqueKey();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _slideAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_isRevealed && info.visibleFraction > 0.2) {
      setState(() => _isRevealed = true);
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Use boxColor if provided, otherwise use textColor, fallback to theme primary color
    final effectiveBoxColor =
        widget.boxColor ?? widget.boxColor ?? theme.colorScheme.onSurface;

    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return ClipRect(
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    // The actual text (always present)
                    widget.child,

                    // The sliding box overlay - positioned to slide from left to right
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      // Width decreases from constraints.maxWidth to 0 as animation progresses
                      width:
                          constraints.maxWidth * (1.0 - _slideAnimation.value),
                      child: Container(
                        color: effectiveBoxColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
