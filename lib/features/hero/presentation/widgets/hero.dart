import 'package:flutter/material.dart';
import 'package:portfolio/features/hero/presentation/widgets/light_bulb.dart';

/// Chair with person - positioned in room depth
class ChairWithPerson extends StatelessWidget {
  final Size size;

  const ChairWithPerson({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // Contact shadow
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.16,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.75),
                    blurRadius: 45,
                    spreadRadius: 8,
                  ),
                ],
              ),
            ),
          ),

          // Person image - smaller, positioned in room depth
          SizedBox(
            height: size.height * 0.45,
            child: Image.asset(
              'assets/profile/hero_img.png',
              fit: BoxFit.contain,
            ),
          ),

          // Hanging light bulb - positioned in room space above and in front
          Positioned(
            top: -size.height * 0.15, // Higher up in the room
            left: size.width * 0.02, // Slightly offset to appear in front
            child: HangingLightBulb(
              isDark: isDark,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
