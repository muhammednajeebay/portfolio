import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;
  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Scaffold(
      backgroundColor: colors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, colors),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    isMobile ? 24 : MediaQuery.of(context).size.width * 0.15,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, colors),
                  const SizedBox(height: 32),
                  _buildTechStack(context, colors),
                  const SizedBox(height: 48),
                  _buildSectionTitle(context, 'Overview', colors),
                  const SizedBox(height: 16),
                  _buildDescription(context, colors),
                  const SizedBox(height: 48),
                  if (project.features.isNotEmpty) ...[
                    _buildSectionTitle(context, 'Key Features', colors),
                    const SizedBox(height: 24),
                    _buildFeaturesList(context, colors),
                    const SizedBox(height: 48),
                  ],
                  _buildLinks(context, colors),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, AppThemeColors colors) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      backgroundColor: colors.background,
      elevation: 0,
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: colors.background.withOpacity(0.8),
          child: BackButton(color: colors.primary),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: 'project_${project.title}',
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(project.imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    colors.background.withOpacity(0.8),
                    colors.background,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppThemeColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                project.title,
                style: AppTextStyles.displaySmall(context).copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                ),
              ),
            ),
            _buildStatusBadge(colors),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          project.category.toUpperCase(),
          style: AppTextStyles.labelLarge(context).copyWith(
            color: colors.accent,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.05);
  }

  Widget _buildStatusBadge(AppThemeColors colors) {
    Color badgeColor;
    switch (project.status.toLowerCase()) {
      case 'live':
      case 'published':
        badgeColor = const Color(0xFF4CAF50);
        break;
      case 'in-progress':
        badgeColor = const Color(0xFFFFC107);
        break;
      case 'confidential':
        badgeColor = const Color(0xFFF44336);
        break;
      default:
        badgeColor = colors.secondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor.withOpacity(0.5), width: 1),
      ),
      child: Text(
        project.status.toUpperCase(),
        style: TextStyle(
          color: badgeColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildTechStack(BuildContext context, AppThemeColors colors) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: project.technologies.map((tech) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.border.withOpacity(0.3)),
          ),
          child: Text(
            tech,
            style: AppTextStyles.labelMedium(context).copyWith(
              color: colors.primary.withOpacity(0.8),
            ),
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, AppThemeColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.headlineSmall(context).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 40,
          height: 3,
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, AppThemeColors colors) {
    return Text(
      project.description,
      style: AppTextStyles.bodyLarge(context).copyWith(
        color: colors.bodyText.withOpacity(0.9),
        height: 1.8,
      ),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildFeaturesList(BuildContext context, AppThemeColors colors) {
    return Column(
      children: project.features.map((feature) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: colors.accent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  feature,
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: colors.bodyText.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.05);
  }

  Widget _buildLinks(BuildContext context, AppThemeColors colors) {
    if (project.links.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, 'Links', colors),
        const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: project.links.entries.map((link) {
            IconData icon;
            String label;
            switch (link.key.toLowerCase()) {
              case 'github':
                icon = FontAwesomeIcons.github;
                label = 'GitHub';
                break;
              case 'pub':
                icon = Icons.library_books_rounded;
                label = 'Pub.dev';
                break;
              case 'live':
                icon = Icons.language_rounded;
                label = 'Live Demo';
                break;
              default:
                icon = Icons.link_rounded;
                label = link.key;
            }

            return _LinkButton(
              icon: icon,
              label: label,
              url: link.value,
              colors: colors,
            );
          }).toList(),
        ),
      ],
    ).animate().fadeIn(delay: 500.ms);
  }
}

class _LinkButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;
  final AppThemeColors colors;

  const _LinkButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.colors,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrlString(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered ? widget.colors.primary : widget.colors.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered ? widget.colors.primary : widget.colors.border,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.colors.primary.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: _isHovered
                    ? widget.colors.background
                    : widget.colors.primary,
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: AppTextStyles.labelLarge(context).copyWith(
                  color: _isHovered
                      ? widget.colors.background
                      : widget.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
