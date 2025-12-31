
import 'package:flutter/material.dart';

/// Chair with person - positioned in room depth
class ChairWithPerson extends StatelessWidget {
  final Size size;

  const ChairWithPerson({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.bottomCenter,
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
        ],
      ),
    );
  }
}
