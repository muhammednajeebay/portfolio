import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'hover_project_item.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: AnimatedHeader(
            text: "Featured Projects",
            style: theme.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),

        // Project List
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return HoverProjectItem(
              index: index,
              project: projects[index],
              onTap: () {
                context.push('/project-details', extra: projects[index]);
              },
            ).animate().fadeIn(delay: (100 * index).ms).slideY(begin: 0.1);
          },
        ),
      ],
    );
  }
}
