import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/presentation/pages/home_page.dart';
import 'package:portfolio/shared/domain/usecases/get_experiences.dart';
import 'package:portfolio/shared/domain/usecases/get_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_skills.dart';
import 'package:portfolio/shared/domain/usecases/get_about_info.dart';
import 'package:portfolio/shared/domain/usecases/get_hero_info.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/features/projects/presentation/pages/project_details_page.dart';
import 'package:portfolio/shared/presentation/widgets/splash_screen.dart';

class AppRouter {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;
  final GetAboutInfo getAboutInfo;
  final GetHeroInfo getHeroInfo;

  AppRouter({
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
    required this.getAboutInfo,
    required this.getHeroInfo,
  });

  late final router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(
          getProjects: getProjects,
          getSkills: getSkills,
          getExperiences: getExperiences,
          getAboutInfo: getAboutInfo,
          getHeroInfo: getHeroInfo,
        ),
      ),
      GoRoute(
        path: '/project-details',
        pageBuilder: (context, state) {
          final project = state.extra as Project;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProjectDetailsPage(project: project),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          );
        },
      ),
    ],
  );
}
