import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/shared/domain/entities/project.dart';

class ProjectsSection extends StatefulWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    // On Desktop, maybe grid? Reowrk says "Horizontal scroll cards".
    // I will stick to PageView/List for now, or maybe GridView if > mobile.
    // Rework explicitly asked for "Horizontal scroll cards with parallax effect".

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            "Featured Projects",
            style: theme.textTheme.headlineLarge!
                .copyWith(color: theme.colorScheme.primary),
          ),
        ),
        SizedBox(
          height: isMobile ? 500 : 450,
          child: PageView.builder(
            controller: _pageController,
            padEnds:
                false, // Start from left? Or centered? Default padEnds true centers. Rework: "Horizontal scroll". Center is fine.
            itemCount: widget.projects.length,
            itemBuilder: (context, index) {
              final project = widget.projects[index];
              // Calculate parallax/scale
              double percentage = index - _currentPage;
              double scale = (1 - (percentage.abs() * 0.1)).clamp(0.9, 1.0);

              return Transform.scale(
                scale: scale,
                child: _ProjectCard(
                  project: project,
                  parallaxOffset:
                      percentage * 50, // Move image 50px based on scroll
                ),
              );
            },
          ),
        ),
      ],
    ).animate().fade().slideY(begin: 0.1, end: 0);
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final double parallaxOffset;

  const _ProjectCard({required this.project, required this.parallaxOffset});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.push('/project-details', extra: project);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.1),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Area
            SizedBox(
              height: 240,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Parallax Image
                  Positioned(
                    left: -parallaxOffset,
                    right: parallaxOffset,
                    top: 0,
                    bottom: 0,
                    child: Hero(
                      tag: 'project_${project.title}',
                      child: Image.network(
                        project.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (c, e, s) =>
                            Container(color: Colors.grey.shade800),
                      ),
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 20,
                    right: 20,
                    child: Text(
                      project.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        project.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .take(3)
                          .map((t) => Chip(
                                label: Text(t,
                                    style: const TextStyle(fontSize: 12)),
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                backgroundColor:
                                    theme.colorScheme.surfaceContainerHighest,
                                side: BorderSide.none,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () =>
                              context.push('/project-details', extra: project),
                          child: const Text("View Case Study"),
                        ),
                        if (project.githubUrl.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.code),
                            onPressed: () {}, // TODO launch URL
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
