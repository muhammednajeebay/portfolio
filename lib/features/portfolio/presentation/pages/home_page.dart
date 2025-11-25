import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/usecases/get_experiences.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_skills.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/animated_navbar.dart';
import '../widgets/motion_background.dart';
import '../widgets/section_container.dart';
import '../widgets/section_divider.dart';

class HomePage extends StatefulWidget {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;

  const HomePage({
    super.key,
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _sc = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final skillsKey = GlobalKey();
  final contactKey = GlobalKey();

  List<Project> _projects = [];
  List<Skill> _skills = [];
  List<Experience> _experiences = [];
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
    setState(() {
      _projects = projects;
      _skills = skills;
      _experiences = experiences;
    });
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
    final name = {
      homeKey: 'home',
      aboutKey: 'about',
      experienceKey: 'experience',
      projectsKey: 'projects',
      skillsKey: 'skills',
      contactKey: 'contact',
    }[key];
    if (name != null) GoRouter.of(context).go('/#$name');
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
              switch (label) {
                case 'Home':
                  scrollTo(homeKey);
                  break;
                case 'About':
                  scrollTo(aboutKey);
                  break;
                case 'Experience':
                  scrollTo(experienceKey);
                  break;
                case 'Projects':
                  scrollTo(projectsKey);
                  break;
                case 'Skills':
                  scrollTo(skillsKey);
                  break;
                case 'Contact':
                  scrollTo(contactKey);
                  break;
              }
            },
            isMobile: isMobile,
          ),
        ),
        drawer: isMobile
            ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: .8),
                            Theme.of(context)
                                .colorScheme
                                .secondary
                                .withValues(alpha: .8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Najeeb AY",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(color: Colors.white))),
                    ),
                    ...[
                      'Home',
                      'About',
                      'Experience',
                      'Projects',
                      'Skills',
                      'Contact'
                    ].map((l) {
                      return ListTile(
                          title: Text(l),
                          onTap: () {
                            Navigator.of(context).pop();
                            scrollTo({
                              'Home': homeKey,
                              'About': aboutKey,
                              'Experience': experienceKey,
                              'Projects': projectsKey,
                              'Skills': skillsKey,
                              'Contact': contactKey,
                            }[l]!);
                          });
                    }),
                  ],
                ),
              )
            : null,
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
                  key: experienceKey,
                  child: ExperienceSection(experiences: _experiences)),
              const SectionDivider(curveType: CurveType.bottom),
              SectionContainer(
                  key: projectsKey,
                  child: ProjectsSection(projects: _projects)),
              const SectionDivider(curveType: CurveType.bottom),
              SectionContainer(
                  key: skillsKey, child: SkillsSection(skills: _skills)),
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
