import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenSourceSection extends StatelessWidget {
  final List<Project> projects;
  const OpenSourceSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return const SizedBox.shrink();
    // Assuming we highlight the first one or list them.
    // Rework says "Your package 'ResponsiveText Plus' ... should have its own highlight."
    // We'll show all if multiple, but style specifically for "Open Source".

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Open Source",
          style: theme.textTheme.headlineLarge!
              .copyWith(color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 32),
        ...projects.map(
            (project) => _OpenSourceCard(project: project, isDark: isDark)),
      ],
    ).animate().fade().slideY(begin: 0.2, end: 0);
  }
}

class _OpenSourceCard extends StatelessWidget {
  final Project project;
  final bool isDark;

  const _OpenSourceCard({required this.project, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF161B22)
            : const Color(0xFF24292E), // Github-like dark colors
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(FontAwesomeIcons.github,
                  color: Colors.white, size: 28),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  project.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace', // Monospace for open source feel
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            project.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.8),
            ),
          ),
          // const SizedBox(height: 24),
          // Wrap(
          //   spacing: 16,
          //   children: [
          //     _buildStat(Colors.white, Icons.star_border, "100+"),
          //     _buildStat(Colors.white, Icons.download,
          //         "2k+ Downloads"), // Mock stats from description "Active community"
          //     _buildStat(Colors.white, Icons.verified, "100% Pub Points"),
          //   ],
          // ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              if (project.githubUrl.isNotEmpty) {
                launchUrl(Uri.parse(project.githubUrl));
              }
            },
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text("View on GitHub"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildStat(Color color, IconData icon, String text) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Icon(icon, color: color, size: 18),
  //       const SizedBox(width: 8),
  //       Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
  //     ],
  //   );
  // }
}
