import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/shared/domain/entities/hero_info.dart';
import 'package:portfolio/shared/domain/entities/experience.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';
import 'package:portfolio/shared/domain/entities/about.dart';
import 'package:portfolio/shared/domain/usecases/get_experiences.dart';
import 'package:portfolio/shared/domain/usecases/get_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_skills.dart';
import 'package:portfolio/shared/domain/usecases/get_about_info.dart';
import 'package:portfolio/shared/domain/usecases/get_hero_info.dart';
import 'package:portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:portfolio/features/hero/presentation/pages/hero_page.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_section.dart';
import 'package:portfolio/shared/presentation/widgets/motion_background.dart';
import 'package:portfolio/shared/presentation/widgets/section_container.dart';
import 'package:portfolio/shared/presentation/widgets/sidebar.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';
import 'package:portfolio/core/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;
  final GetAboutInfo getAboutInfo;
  final GetHeroInfo getHeroInfo;

  const HomePage({
    super.key,
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
    required this.getAboutInfo,
    required this.getHeroInfo,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _sc = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  List<Project> _projects = [];
  List<Skill> _skills = [];
  List<Experience> _experiences = [];
  About? _aboutInfo;
  HeroInfo? _heroInfo;

  // Use ValueNotifier for better performance
  final ValueNotifier<double> _scrollOffsetNotifier = ValueNotifier(0);
  final ValueNotifier<String> _activeSectionNotifier = ValueNotifier('Home');

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _sc.addListener(_handleScroll);
    _loadData();
  }

  // Throttled scroll handler for better performance
  void _handleScroll() {
    if (!mounted) return;

    _scrollOffsetNotifier.value = _sc.offset;
    _updateActiveSection();
  }

  void _updateActiveSection() {
    final keyMap = {
      'Home': homeKey,
      'About': aboutKey,
      'Work': projectsKey,
      'Skill': skillsKey,
      'Timeline': experienceKey,
      'Connect': contactKey,
    };

    String? bestSection;
    double maxVisibleHeight = -1.0;

    final viewportHeight = MediaQuery.of(context).size.height;

    for (var entry in keyMap.entries) {
      final key = entry.value;
      final sectionName = entry.key;
      final renderBox = key.currentContext?.findRenderObject() as RenderBox?;

      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        final height = renderBox.size.height;

        // Calculate how much of the section is visible in the viewport
        final top = position.dy;
        final bottom = position.dy + height;

        final visibleTop = top.clamp(0.0, viewportHeight);
        final visibleBottom = bottom.clamp(0.0, viewportHeight);
        final visibleHeight = visibleBottom - visibleTop;

        if (visibleHeight > maxVisibleHeight) {
          maxVisibleHeight = visibleHeight;
          bestSection = sectionName;
        }
      }
    }

    if (bestSection != null && _activeSectionNotifier.value != bestSection) {
      _activeSectionNotifier.value = bestSection;
    }
  }

  void _onSectionTap(String section) {
    final keyMap = {
      'Home': homeKey,
      'About': aboutKey,
      'Work': projectsKey,
      'Skill': skillsKey,
      'Timeline': experienceKey,
      'Connect': contactKey,
    };
    final key = keyMap[section];
    if (key != null) {
      _scrollToKey(key);
      _activeSectionNotifier.value = section;
    }
  }

  Future<void> _loadData() async {
    try {
      // Load all data in parallel for faster loading
      final results = await Future.wait([
        widget.getProjects(),
        widget.getSkills(),
        widget.getExperiences(),
        widget.getAboutInfo(),
        widget.getHeroInfo(),
      ]);

      if (!mounted) return;

      setState(() {
        _projects = results[0] as List<Project>;
        _skills = results[1] as List<Skill>;
        _experiences = results[2] as List<Experience>;
        _aboutInfo = results[3] as About;
        _heroInfo = results[4] as HeroInfo;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) {
      return;
    }

    // Get the RenderBox to calculate exact position
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }

    // Get the position of the widget relative to the viewport
    final position = renderBox.localToGlobal(Offset.zero);
    final targetScrollOffset =
        _sc.offset + position.dy - 100; // 100px offset from top

    // Animate to the target position
    _sc
        .animateTo(
      targetScrollOffset.clamp(0.0, _sc.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    )
        .then((_) {
      debugPrint(
          '✅ Scroll animation completed to ${_sc.offset.toStringAsFixed(1)}');
    }).catchError((error) {
      debugPrint('❌ Scroll error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return ValueListenableBuilder<double>(
      valueListenable: _scrollOffsetNotifier,
      builder: (context, scrollOffset, child) {
        return MotionBackground(
          scrollOffset: scrollOffset,
          child: Scaffold(
            floatingActionButton: _buildThemeToggle(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: Colors.transparent,
            body: Row(
              children: [
                // Left Sidebar - use RepaintBoundary for better performance
                if (!isMobile)
                  RepaintBoundary(
                    child: ValueListenableBuilder<String>(
                      valueListenable: _activeSectionNotifier,
                      builder: (context, activeSection, _) {
                        return Sidebar(
                          activeSection: activeSection,
                          onSectionTap: _onSectionTap,
                          isMobile: false,
                        );
                      },
                    ),
                  ),
                // Main Content
                Expanded(
                  child: Container(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                    child: _isLoading || _heroInfo == null || _aboutInfo == null
                        ? const Center(child: CircularProgressIndicator())
                        : _buildScrollContent(),
                  ),
                ),
              ],
            ),
            // Mobile: Show drawer
            drawer: isMobile
                ? ValueListenableBuilder<String>(
                    valueListenable: _activeSectionNotifier,
                    builder: (context, activeSection, _) {
                      return Sidebar(
                        activeSection: activeSection,
                        onSectionTap: _onSectionTap,
                        isMobile: true,
                      );
                    },
                  )
                : null,
            // Mobile: Show top navbar
            appBar: isMobile ? _buildMobileAppBar() : null,
          ),
        );
      },
    );
  }

  Widget _buildScrollContent() {
    return SingleChildScrollView(
      controller: _sc,
      physics: const BouncingScrollPhysics(), // Smoother scroll physics
      child: Column(
        children: [
          RepaintBoundary(
            child: SectionContainer(
              key: homeKey,
              spacerBelow: false,
              fullSize: true,
              sectionNumber: '01',
              centered: true,
              child: HeroSection(heroInfo: _heroInfo!),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: aboutKey,
              sectionNumber: '02',
              centered: true,
              child: AboutSection(aboutInfo: _aboutInfo!),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: projectsKey,
              sectionNumber: '03',
              centered: true,
              child: ProjectsSection(projects: _projects),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: skillsKey,
              sectionNumber: '04',
              centered: true,
              child: SkillsSection(skills: _skills),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: experienceKey,
              sectionNumber: '05',
              centered: true,
              child: ExperienceSection(experiences: _experiences),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: contactKey,
              sectionNumber: '06',
              centered: true,
              child: const ContactSection(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark ||
            (themeMode == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

        return RepaintBoundary(
          child: FloatingActionButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            elevation: 4,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                isDark ? FontAwesomeIcons.moon : FontAwesomeIcons.sun,
                key: ValueKey(isDark),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _sc.removeListener(_handleScroll);
    _sc.dispose();
    _scrollOffsetNotifier.dispose();
    _activeSectionNotifier.dispose();
    super.dispose();
  }

  PreferredSizeWidget _buildMobileAppBar() {
    final colors = context.appColors;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'MN',
        style: AppTextStyles.headlineSmall(context).copyWith(
          color: colors.primary,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(FontAwesomeIcons.bars, color: colors.primary),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }
}
