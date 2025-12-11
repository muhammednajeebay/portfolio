import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';

class SkillsSection extends StatefulWidget {
  final List<Skill> skills;
  const SkillsSection({super.key, required this.skills});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.skills.length, vsync: this);
  }

  @override
  void didUpdateWidget(SkillsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.skills.length != oldWidget.skills.length) {
      _tabController.dispose();
      _tabController = TabController(length: widget.skills.length, vsync: this);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.skills.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Animate(
      effects: const [FadeEffect(), MoveEffect(begin: Offset(0, 28))],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Skills & Tech Stack",
            style: theme.textTheme.headlineLarge!
                .copyWith(color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 24),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest
                  .withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelColor: theme.colorScheme.onPrimary,
              unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
              labelPadding: const EdgeInsets.symmetric(horizontal: 24),
              tabs: widget.skills.map((s) => Tab(text: s.name)).toList(),
            ),
          ),
          const SizedBox(height: 32),
          AnimatedBuilder(
            animation: _tabController,
            builder: (context, _) {
              final index = _tabController.index;
              final skill = widget.skills[index];
              return _buildSkillGrid(skill, theme, isMobile);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillGrid(Skill skill, ThemeData theme, bool isMobile) {
    // Key to trigger animation
    return KeyedSubtree(
      key: ValueKey(skill.name),
      child: Animate(
        effects: const [
          FadeEffect(duration: Duration(milliseconds: 300)),
          ScaleEffect(begin: Offset(0.95, 0.95))
        ],
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: skill.items
              .map((item) => Chip(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    backgroundColor: theme.colorScheme.surface,
                    side: BorderSide(color: theme.colorScheme.outlineVariant),
                    label: Text(
                      item,
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    elevation: 2,
                    shadowColor: Colors.black.withValues(alpha: 0.1),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
