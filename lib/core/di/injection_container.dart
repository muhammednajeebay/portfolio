import 'package:get_it/get_it.dart';
import 'package:portfolio/router/app_router.dart';
import 'package:portfolio/shared/data/datasources/portfolio_local_data_source.dart';
import 'package:portfolio/shared/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio/shared/domain/repositories/portfolio_repository.dart';
import 'package:portfolio/shared/domain/usecases/get_experiences.dart';
import 'package:portfolio/shared/domain/usecases/get_projects.dart';
import 'package:portfolio/shared/domain/usecases/get_skills.dart';
import 'package:portfolio/shared/domain/usecases/get_about_info.dart';
import 'package:portfolio/shared/domain/usecases/get_hero_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Router
  sl.registerLazySingleton<AppRouter>(() => AppRouter(
        getProjects: sl(),
        getSkills: sl(),
        getExperiences: sl(),
        getAboutInfo: sl(),
        getHeroInfo: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetProjects(sl()));
  sl.registerLazySingleton(() => GetSkills(sl()));
  sl.registerLazySingleton(() => GetExperiences(sl()));
  sl.registerLazySingleton(() => GetAboutInfo(sl()));
  sl.registerLazySingleton(() => GetHeroInfo(sl()));

  // Repository
  sl.registerLazySingleton<PortfolioRepository>(
      () => PortfolioRepositoryImpl(localDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<PortfolioLocalDataSource>(
      () => PortfolioLocalDataSourceImpl());
}
