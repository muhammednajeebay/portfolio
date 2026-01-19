import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';
import 'package:portfolio/shared/presentation/widgets/slide_box_reveal_text.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;
  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SlideBoxRevealTextOnScroll(
          boxColor: theme.colorScheme.onSurface,
          child: Text(
            "What I use.",
            style: AppTextStyles.displaySmall(context).copyWith(
              fontSize: isMobile ? 32 : 48,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Opacity(
          opacity: 0.7,
          child: Text(
            "I use a number of tools to aid my creative process when bringing things to life. Listed below are the tools and technologies that I have used over the years.",
            style: AppTextStyles.bodyLarge(context).copyWith(
              fontSize: 18,
              height: 1.6,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
        const SizedBox(height: 60),
        LayoutBuilder(
          builder: (context, constraints) {
            final double width = constraints.maxWidth;
            int columns = 4;
            if (width < 768)
              columns = 1;
            else if (width < 1024) columns = 2;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: skills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: columns == 1 ? 2.5 : 1.2,
              ),
              itemBuilder: (context, index) {
                return _SkillGroupTile(skill: skills[index]);
              },
            );
          },
        ).animate().fadeIn(delay: 400.ms),
      ],
    );
  }
}

class _SkillGroupTile extends StatefulWidget {
  final Skill skill;

  const _SkillGroupTile({required this.skill});

  @override
  State<_SkillGroupTile> createState() => _SkillGroupTileState();
}

class _SkillGroupTileState extends State<_SkillGroupTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: FocusableActionDetector(
        onShowFocusHighlight: (value) => setState(() => _isHovered = value),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colors.onSurface.withOpacity(_isHovered ? 0.2 : 0.05),
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              // Thin accent line on the left
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isHovered ? 1.0 : 0.0,
                child: Container(
                  width: 2,
                  height: 20,
                  color: colors.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 200),
                      style: AppTextStyles.bodyLarge(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface
                            .withOpacity(_isHovered ? 1.0 : 0.8),
                      ),
                      child: Text(widget.skill.name),
                    ),
                    const SizedBox(height: 8),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _isHovered ? 1.0 : 0.5,
                      child: Text(
                        widget.skill.description,
                        style: AppTextStyles.bodySmall(context).copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      widget.skill.items.join(' · '),
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        height: 1.4,
                        color: colors.onSurface.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
