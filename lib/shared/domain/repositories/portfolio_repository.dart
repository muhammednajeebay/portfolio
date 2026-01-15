import '../entities/experience.dart';
import '../entities/project.dart';
import '../entities/skill.dart';
import '../entities/article.dart';
import '../entities/about.dart';
import '../entities/hero_info.dart';

abstract class PortfolioRepository {
  Future<List<Project>> getProjects();
  Future<List<Project>> getOpenSourceProjects();
  Future<List<Skill>> getSkills();
  Future<List<Experience>> getExperiences();
  Future<List<Article>> getArticles();
  Future<About> getAboutInfo();
  Future<HeroInfo> getHeroInfo();
}
