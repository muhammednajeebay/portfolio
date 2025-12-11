import 'package:flutter/material.dart';

enum CurveType { top, bottom }

class SectionDivider extends StatelessWidget {
  final CurveType curveType;
  const SectionDivider({super.key, required this.curveType});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SectionCurveClipper(curveType),
      child: Container(
        height: 60,
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.11),
      ),
    );
  }
}

class SectionCurveClipper extends CustomClipper<Path> {
  final CurveType curveType;
  SectionCurveClipper(this.curveType);
  @override
  Path getClip(Size size) {
    final path = Path();
    if (curveType == CurveType.bottom) {
      path.lineTo(0, size.height - 30);
      path.quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 30);
      path.lineTo(size.width, 0);
    } else {
      path.moveTo(0, 30);
      path.quadraticBezierTo(size.width / 2, 0, size.width, 30);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      return path;
    }
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
