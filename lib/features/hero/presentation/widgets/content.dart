import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/shared/presentation/widgets/animated_Text.dart';

/// Text content on the wall
class WallText extends StatelessWidget {
  final bool isMobile;

  const WallText({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: 'Hi, I am',
          delay: 0,
          style: AppTextStyles.heroGreeting(context).copyWith(
            fontSize: isMobile ? 18 : 22,
          ),
        ),
        const SizedBox(height: 6),
        AnimatedText(
          text: 'Muhammed Najeeb AY',
          delay: 100,
          style: AppTextStyles.heroName(context).copyWith(
            fontSize: isMobile ? 32 : 48,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 18),
        AnimatedText(
          text: '',
          delay: 200,
          style: const TextStyle(),
          child: Container(
            height: 2.5,
            width: 110,
            decoration: BoxDecoration(
              color: context.appColors.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(height: 18),
        AnimatedText(
          text: 'Flutter Developer',
          delay: 250,
          style: AppTextStyles.heroTitle(context).copyWith(
            fontSize: isMobile ? 18 : 21,
          ),
        ),
        const SizedBox(height: 4),
        AnimatedText(
          text: 'Mobile & Web Applications',
          delay: 280,
          style: AppTextStyles.bodyLarge(context).copyWith(
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        if (!isMobile) ...[
          const SizedBox(height: 24),
          AnimatedText(
            text:
                'I build scalable Flutter applications\nwith clean architecture,',
            delay: 350,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: context.appColors.bodyText.withOpacity(0.7),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 2),
          AnimatedText(
            text: 'focused on performance, clarity,\nand real-world impact.',
            delay: 380,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: context.appColors.bodyText.withOpacity(0.7),
              height: 1.7,
            ),
          ),
        ],
      ],
    );
  }
}
