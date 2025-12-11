import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/experience/presentation/widgets/experience_section.dart';
import 'package:portfolio/features/home/presentation/widgets/hero_section.dart';
import 'package:portfolio/features/opensource/presentation/widgets/open_source_section.dart';
import 'package:portfolio/features/projects/presentation/widgets/projects_section.dart';
import 'package:portfolio/features/skills/presentation/widgets/skills_section.dart';
import 'package:portfolio/features/writing/presentation/widgets/writing_section.dart';
import 'package:portfolio/shared/domain/entities/article.dart';
import 'package:portfolio/shared/domain/entities/experience.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/shared/domain/entities/skill.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio/core/di/injection_container.dart' as di;

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
  }
}

void main() {
  setUpAll(() async {
    HttpOverrides.global = TestHttpOverrides();
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    await di.init();
  });

  Widget wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [child]),
        ),
      ),
    );
  }

  // ... previous tests ...
  testWidgets('ProjectsSection layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const ProjectsSection(
        projects: []))); // Test empty to be safe or with data
    await tester.pumpWidget(wrap(const ProjectsSection(projects: [
      Project(
        title: 'Test Project',
        description: 'Desc',
        imageUrl: 'http://example.com/image.png',
        technologies: ['Flutter'],
        githubUrl: '',
      )
    ])));
    await tester.pumpAndSettle();
  });

  testWidgets('ExperienceSection layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const ExperienceSection(experiences: [
      Experience(
        company: 'Company',
        role: 'Role',
        period: '2020',
        location: 'Loc',
        highlights: ['H1'],
        techStack: ['T1'],
      )
    ])));
    await tester.pumpAndSettle();
  });

  testWidgets('HeroSection layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const HeroSection()));
    await tester.pumpAndSettle();
  });

  testWidgets('SkillsSection layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const SkillsSection(skills: [
      Skill(name: 'Cat', icon: Icons.code, items: ['A', 'B'])
    ])));
    await tester.pumpAndSettle();
  });

  testWidgets('WritingSection layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const WritingSection(articles: [
      Article(title: 'T', summary: 'S', url: 'u', readTime: '5m', date: 'D')
    ])));
    await tester.pumpAndSettle();
  });

  testWidgets('OpenSource layout test', (WidgetTester tester) async {
    await tester.pumpWidget(wrap(const OpenSourceSection(projects: [
      Project(
        title: 'Test Project',
        description: 'Desc',
        imageUrl: 'http://example.com/image.png',
        technologies: ['Flutter'],
        githubUrl: '',
      )
    ])));
    await tester.pumpAndSettle();
  });
}
