import 'package:go_router/go_router.dart';
import 'package:portfolio/features/home/presentation/pages/home_page.dart';
import 'package:portfolio/shared/domain/usecases/get_experiences.dart';
import 'package:portfolio/shared/domain/usecases/get_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_skills.dart';
import 'package:portfolio/shared/domain/usecases/get_articles.dart';
import 'package:portfolio/shared/domain/usecases/get_open_source_projects.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/features/projects/presentation/pages/project_details_page.dart';
import 'package:portfolio/shared/presentation/widgets/splash_screen.dart';

class AppRouter {
  final GetProjects getProjects;
  final GetSkills getSkills;
  final GetExperiences getExperiences;
  final GetOpenSourceProjects getOpenSourceProjects;
  final GetArticles getArticles;

  AppRouter({
    required this.getProjects,
    required this.getSkills,
    required this.getExperiences,
    required this.getOpenSourceProjects,
    required this.getArticles,
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
          getOpenSourceProjects: getOpenSourceProjects,
          getArticles: getArticles,
        ),
      ),
      GoRoute(
        path: '/project-details',
        builder: (context, state) {
          final project = state.extra as Project;
          return ProjectDetailsPage(project: project);
        },
      ),
    ],
  );
}
