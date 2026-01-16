import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionContainer extends StatefulWidget {
  final Widget child;
  final bool spacerBelow;
  final bool fullSize;
  final String? sectionNumber;
  final bool centered;
  final Duration revealDuration;

  const SectionContainer({
    super.key,
    required this.child,
    this.fullSize = false,
    this.spacerBelow = true,
    this.sectionNumber,
    this.centered = false,
    this.revealDuration = const Duration(milliseconds: 600),
  });

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  late final Key _visibilityKey;
  bool _isRevealed = false;

  @override
  void initState() {
    super.initState();
    _visibilityKey = UniqueKey();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_isRevealed && info.visibleFraction > 0.2) {
      setState(() => _isRevealed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final content = widget.fullSize
        ? widget.child
        : Container(
            padding: EdgeInsets.symmetric(
              vertical: widget.centered ? 120 : 80,
              horizontal: 24,
            ),
            alignment:
                widget.centered ? Alignment.center : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1040),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  widget.child,
                ],
              ),
            ),
          );

    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedOpacity(
        curve: Curves.easeOutCubic,
        duration: widget.revealDuration,
        opacity: _isRevealed ? 1 : 0,
        child: AnimatedSlide(
          duration: widget.revealDuration,
          curve: Curves.easeOutCubic,
          offset: _isRevealed ? Offset.zero : const Offset(0, 0.06),
          child: content,
        ),
      ),
    );
  }
}
