import 'package:flutter/material.dart';

/// Hanging light bulb that turns on in dark mode
class HangingLightBulb extends StatelessWidget {
  final bool isDark;
  final double size;

  const HangingLightBulb({
    super.key,
    required this.isDark,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Wire/cord
        Container(
          width: 2,
          // height: ,
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.3)
                : Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(1),
          ),
        ),

        // Light bulb with glow effect
        AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          width: size,
          height: size * 1.3,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFFFFF4D6) : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(size / 2),
            boxShadow: isDark
                ? [
                    // Bright glow when on
                    BoxShadow(
                      color: const Color(0xFFFFF4D6).withOpacity(0.8),
                      blurRadius: 40,
                      spreadRadius: 15,
                    ),
                    BoxShadow(
                      color: Colors.yellow.withOpacity(0.6),
                      blurRadius: 60,
                      spreadRadius: 25,
                    ),
                  ]
                : [
                    // Subtle shadow when off
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
          ),
          child: Stack(
            children: [
              // Bulb highlight
              Positioned(
                top: size * 0.2,
                left: size * 0.25,
                child: Container(
                  width: size * 0.2,
                  height: size * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(isDark ? 0.6 : 0.3),
                    borderRadius: BorderRadius.circular(size / 4),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bulb base/socket
        // Container(
        //   width: size * 0.6,
        //   height: size * 0.3,
        //   decoration: BoxDecoration(
        //     color: isDark ? Colors.grey.shade700 : Colors.grey.shade400,
        //     borderRadius: const BorderRadius.only(
        //       bottomLeft: Radius.circular(4),
        //       bottomRight: Radius.circular(4),
        //     ),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: List.generate(
        //       3,
        //       (index) => Container(
        //         height: 1,
        //         color: isDark ? Colors.grey.shade600 : Colors.grey.shade500,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
