import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionContainer extends StatefulWidget {
  final Widget child;
  final bool spacerBelow;
  final Duration revealDuration;

  const SectionContainer({
    super.key,
    required this.child,
    this.spacerBelow = true,
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
    final content = Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 12),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1040),
        child: widget.child,
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
