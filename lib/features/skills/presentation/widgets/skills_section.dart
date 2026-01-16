import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;
  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 1024;
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 0,
        vertical: 80,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedHeader(
                  text: "What I use.",
                  style: GoogleFonts.outfit(
                    fontSize: isMobile ? 32 : 40,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: isMobile ? double.infinity : 600,
                  child: Text(
                    "I use a number of tools to aid my creative process when bringing things to life. Listed below are the tools and technologies that I have used over the years.",
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      height: 1.6,
                      color: isDark ? Colors.grey[400] : Colors.grey[700],
                    ),
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

                const SizedBox(height: 60),

                // Skills Grid
                isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: skills
                            .map((s) => _buildSkillCategory(context, s))
                            .toList(),
                      )
                    : Wrap(
                        spacing: 80,
                        runSpacing: 40,
                        children: skills
                            .map((s) => _buildSkillCategory(context, s))
                            .toList(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(BuildContext context, Skill skill) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 250,
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.name,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...skill.items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  item,
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    color: isDark ? Colors.grey[400] : Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.05);
  }
}
