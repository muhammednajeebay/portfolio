import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:portfolio/shared/domain/entities/article.dart';
import 'package:portfolio/shared/domain/entities/experience.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';
import 'package:portfolio/shared/domain/usecases/get_articles.dart';
import 'package:portfolio/shared/domain/usecases/get_experiences.dart';
import 'package:portfolio/shared/domain/usecases/get_open_source_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_skills.dart';
import 'package:portfolio/features/about/presentation/widgets/about_section.dart';
import 'package:portfolio/features/contact/presentation/widgets/contact_section.dart';
import 'package:portfolio/features/hero/presentation/pages/hero_page.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/opensource/presentation/widgets/open_source_section.dart';
import 'package:portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_section.dart';
import 'package:portfolio/features/writing/presentation/widgets/writing_section.dart';
import 'package:portfolio/shared/presentation/widgets/motion_background.dart';
import 'package:portfolio/shared/presentation/widgets/section_container.dart';
import 'package:portfolio/shared/presentation/widgets/sidebar.dart';
import 'package:portfolio/core/theme/theme_cubit.dart';

class HomePage extends StatefulWidget {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;
  final GetOpenSourceProjects getOpenSourceProjects;
  final GetArticles getArticles;

  const HomePage({
    super.key,
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
    required this.getOpenSourceProjects,
    required this.getArticles,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final ScrollController _sc = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final openSourceKey = GlobalKey();
  final writingKey = GlobalKey();
  final contactKey = GlobalKey();

  List<Project> _projects = [];
  List<Skill> _skills = [];
  List<Experience> _experiences = [];
  List<Project> _openSourceProjects = [];
  List<Article> _articles = [];
  
  // Use ValueNotifier for better performance
  final ValueNotifier<double> _scrollOffsetNotifier = ValueNotifier(0);
  final ValueNotifier<String> _activeSectionNotifier = ValueNotifier('Home');
  
  bool _isLoading = true;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _sc.addListener(_handleScroll);
    _loadData();
  }

  // Throttled scroll handler for better performance
  void _handleScroll() {
    if (!mounted || _isScrolling) return;
    
    _isScrolling = true;
    _scrollOffsetNotifier.value = _sc.offset;
    _updateActiveSection();
    
    // Reset scrolling flag after a frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isScrolling = false;
    });
  }

  void _updateActiveSection() {
    final offset = _sc.offset;
    String newSection;
    
    // Use more precise section detection based on viewport
    final viewportHeight = MediaQuery.of(context).size.height;
    
    if (offset < viewportHeight * 0.5) {
      newSection = 'Home';
    } else if (offset < viewportHeight * 1.5) {
      newSection = 'About';
    } else if (offset < viewportHeight * 2.5) {
      newSection = 'Work';
    } else if (offset < viewportHeight * 3.5) {
      newSection = 'Skill';
    } else if (offset < viewportHeight * 4.5) {
      newSection = 'Timeline';
    } else {
      newSection = 'Connect';
    }
    
    if (_activeSectionNotifier.value != newSection) {
      _activeSectionNotifier.value = newSection;
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
        widget.getOpenSourceProjects(),
        widget.getArticles(),
      ]);

      if (!mounted) return;

      setState(() {
        _projects = results[0] as List<Project>;
        _skills = results[1] as List<Skill>;
        _experiences = results[2] as List<Experience>;
        _openSourceProjects = results[3] as List<Project>;
        _articles = results[4] as List<Article>;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error loading data: $e');
    }
  }

  void _scrollToKey(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    // Use higher-performance scrolling
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
    );
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
                          isMobile: isMobile,
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
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _buildScrollContent(),
                  ),
                ),
              ],
            ),
            // Mobile: Show top navbar
            // appBar: isMobile ? _buildMobileAppBar() : null,
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
              child: const HeroSection(),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: aboutKey,
              child: const AboutSection(),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: skillsKey,
              child: SkillsSection(skills: _skills),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: experienceKey,
              child: ExperienceSection(experiences: _experiences),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: projectsKey,
              child: ProjectsSection(projects: _projects),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: openSourceKey,
              child: OpenSourceSection(projects: _openSourceProjects),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: writingKey,
              child: WritingSection(articles: _articles),
            ),
          ),
          RepaintBoundary(
            child: SectionContainer(
              key: contactKey,
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
                isDark ? Icons.light_mode : Icons.dark_mode,
                key: ValueKey(isDark),
              ),
            ),
          ),
        );
      },
    );
  }

  // PreferredSizeWidget _buildMobileAppBar() {
  //   return PreferredSize(
  //     preferredSize: const Size.fromHeight(65),
  //     child: RepaintBoundary(
  //       child: AnimatedNavbar(
  //         onTap: (label) {
  //           final key = {
  //             'Home': homeKey,
  //             'About': aboutKey,
  //             'Skills': skillsKey,
  //             'Experience': experienceKey,
  //             'Projects': projectsKey,
  //             'Contact': contactKey,
  //           }[label];
  //           if (key != null) _scrollToKey(key);
  //         },
  //         isMobile: true,
  //       ),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _sc.removeListener(_handleScroll);
    _sc.dispose();
    _scrollOffsetNotifier.dispose();
    _activeSectionNotifier.dispose();
    super.dispose();
  }
}