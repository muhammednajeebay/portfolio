import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/shared/presentation/widgets/animated_text.dart';
import 'package:portfolio/shared/domain/entities/hero_info.dart';

/// Text content on the wall
class WallText extends StatelessWidget {
  final bool isMobile;
  final HeroInfo heroInfo;

  const WallText({
    super.key,
    required this.isMobile,
    required this.heroInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedText(
          text: heroInfo.greeting,
          delay: 0,
          style: AppTextStyles.heroGreeting(context).copyWith(
            fontSize: isMobile ? 18 : 22,
          ),
        ),
        const SizedBox(height: 6),
        AnimatedText(
          text: heroInfo.name,
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
          text: heroInfo.title,
          delay: 250,
          style: AppTextStyles.heroTitle(context).copyWith(
            fontSize: isMobile ? 18 : 21,
          ),
        ),
        const SizedBox(height: 4),
        AnimatedText(
          text: heroInfo.subtitle,
          delay: 280,
          style: AppTextStyles.bodyLarge(context).copyWith(
            fontSize: isMobile ? 14 : 16,
          ),
        ),
        if (!isMobile) ...[
          const SizedBox(height: 24),
          ...List.generate(heroInfo.descriptionLines.length, (index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedText(
                  text: heroInfo.descriptionLines[index],
                  delay: 350 + (index * 30),
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: context.appColors.bodyText.withOpacity(0.7),
                    height: 1.7,
                  ),
                ),
                if (index < heroInfo.descriptionLines.length - 1)
                  const SizedBox(height: 2),
              ],
            );
          }),
        ],
      ],
    );
  }
}
