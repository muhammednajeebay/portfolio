import 'package:flutter/material.dart';

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
import 'package:portfolio/features/home/presentation/widgets/hero_section.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/opensource/presentation/widgets/open_source_section.dart';
import 'package:portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_section.dart';
import 'package:portfolio/features/writing/presentation/widgets/writing_section.dart';
import 'package:portfolio/shared/presentation/widgets/animated_navbar.dart';
import 'package:portfolio/shared/presentation/widgets/motion_background.dart';
import 'package:portfolio/shared/presentation/widgets/section_container.dart';
import 'package:portfolio/shared/presentation/widgets/section_divider.dart';

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

class _HomePageState extends State<HomePage> {
  final ScrollController _sc = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final openSourceKey = GlobalKey();
  final writingKey = GlobalKey();
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  List<Project> _projects = [];
  List<Skill> _skills = [];
  List<Experience> _experiences = [];
  List<Project> _openSourceProjects = [];
  List<Article> _articles = [];
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _sc.addListener(_handleScroll);
    _loadData();
  }

  void _handleScroll() {
    if (!mounted) return;
    setState(() {
      _scrollOffset = _sc.offset;
    });
  }

  Future<void> _loadData() async {
    final projects = await widget.getProjects();
    final skills = await widget.getSkills();
    final experiences = await widget.getExperiences();
    final openSource = await widget.getOpenSourceProjects();
    final articles = await widget.getArticles();

    setState(() {
      _projects = projects;
      _skills = skills;
      _experiences = experiences;
      _openSourceProjects = openSource;
      _articles = articles;
    });
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
    // Update URL hash? (Optional)
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return MotionBackground(
      scrollOffset: _scrollOffset,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AnimatedNavbar(
            onTap: (label) {
              final key = {
                'Home': homeKey,
                'About': aboutKey,
                'Skills': skillsKey,
                'Experience': experienceKey,
                'Projects': projectsKey,
                'Contact': contactKey,
              }[label];
              if (key != null) scrollTo(key);
            },
            isMobile: isMobile,
          ),
        ),
        // Drawer omitted for brevity but logic is similar
        body: SingleChildScrollView(
          controller: _sc,
          child: Column(
            children: [
              SectionContainer(
                key: homeKey,
                spacerBelow: false,
                child: const HeroSection(),
              ),
              const SectionDivider(curveType: CurveType.bottom),
              SectionContainer(key: aboutKey, child: const AboutSection()),
              const SectionDivider(curveType: CurveType.top),
              SectionContainer(
                  key: skillsKey, child: SkillsSection(skills: _skills)),
              const SectionDivider(curveType: CurveType.bottom),
              SectionContainer(
                  key: experienceKey,
                  child: ExperienceSection(experiences: _experiences)),
              const SectionDivider(curveType: CurveType.top),
              SectionContainer(
                  key: projectsKey,
                  child: ProjectsSection(projects: _projects)),
              const SectionDivider(curveType: CurveType.bottom),
              SectionContainer(
                key: openSourceKey,
                child: OpenSourceSection(projects: _openSourceProjects),
              ),
              const SectionDivider(curveType: CurveType.top),
              SectionContainer(
                key: writingKey,
                child: WritingSection(articles: _articles),
              ),
              const SectionDivider(curveType: CurveType.top),
              SectionContainer(key: contactKey, child: const ContactSection()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sc.removeListener(_handleScroll);
    _sc.dispose();
    super.dispose();
  }
}
