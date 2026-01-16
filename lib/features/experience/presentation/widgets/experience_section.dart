import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/shared/domain/entities/experience.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;
  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.appColors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vertical Section Header for Desktop
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Content Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: AnimatedHeader(
                          text: "Timeline.",
                          style: theme.textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    ...experiences.asMap().entries.map((entry) {
                      final index = entry.key;
                      final experience = entry.value;
                      return _ExperienceItem(
                        index: index + 1,
                        experience: experience,
                        isLast: index == experiences.length - 1,
                      )
                          .animate()
                          .fadeIn(delay: (200 * index).ms)
                          .slideY(begin: 0.1, delay: (200 * index).ms);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final int index;
  final Experience experience;
  final bool isLast;

  const _ExperienceItem({
    required this.index,
    required this.experience,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.appColors;
    final isMobile = MediaQuery.of(context).size.width < 700;

    String formattedIndex = '/${index.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Index and Date Column
          if (!isMobile)
            SizedBox(
              width: 250,
              child: Row(
                children: [
                  Text(
                    formattedIndex,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.primary.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      experience.period.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.secondary.withOpacity(0.6),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          if (isMobile) const SizedBox(width: 0) else const SizedBox(width: 40),

          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '$formattedIndex  ${experience.period.toUpperCase()}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colors.secondary.withOpacity(0.6),
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                Text(
                  experience.company,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  experience.role,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colors.secondary.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                // Highlights
                ...experience.highlights.map((highlight) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              '▷',
                              style: TextStyle(
                                color: colors.primary.withOpacity(0.5),
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              highlight,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colors.bodyText.withOpacity(0.8),
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
