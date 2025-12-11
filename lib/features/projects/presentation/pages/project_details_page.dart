import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/shared/domain/entities/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;
  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: theme.colorScheme.onSurface),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'project_${project.title}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  project.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              project.title,
              style: theme.textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ).animate().fade().slideY(begin: 0.2, end: 0),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies
                  .map((t) => Chip(
                        label: Text(t),
                        backgroundColor:
                            theme.colorScheme.primary.withValues(alpha: 0.1),
                      ))
                  .toList(),
            ).animate().fade(delay: 200.ms),
            const SizedBox(height: 32),
            Text(
              "Overview",
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              project.description,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
            ).animate().fade(delay: 300.ms),
            const SizedBox(height: 40),
            // Placeholder for Case Study sections
            _buildSection(context, "Problem Statement",
                "Description of the problem solved...", 400),
            _buildSection(context, "Solution Architecture",
                "Details about the architecture...", 500),
            _buildSection(context, "Key Outcomes",
                "Performance metrics and results...", 600),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String title, String content, int delayMs) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(content, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ).animate().fade(delay: Duration(milliseconds: delayMs)),
    );
  }
}
