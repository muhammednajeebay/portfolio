import '../../domain/entities/experience.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/article.dart';
import '../../domain/entities/about.dart';
import '../../domain/entities/hero_info.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Project>> getProjects() async {
    return await localDataSource.getProjects();
  }

  @override
  Future<List<Project>> getOpenSourceProjects() async {
    return await localDataSource.getOpenSourceProjects();
  }

  @override
  Future<List<Skill>> getSkills() async {
    return await localDataSource.getSkills();
  }

  @override
  Future<List<Experience>> getExperiences() async {
    return await localDataSource.getExperiences();
  }

  @override
  Future<List<Article>> getArticles() async {
    return await localDataSource.getArticles();
  }

  @override
  Future<About> getAboutInfo() async {
    return await localDataSource.getAboutInfo();
  }

  @override
  Future<HeroInfo> getHeroInfo() async {
    return await localDataSource.getHeroInfo();
  }
}
