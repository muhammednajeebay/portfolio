import '../entities/experience.dart';
import '../entities/project.dart';
import '../entities/skill.dart';
import '../entities/about.dart';
import '../entities/hero_info.dart';

abstract class PortfolioRepository {
  Future<List<Project>> getProjects();
  Future<List<Skill>> getSkills();
  Future<List<Experience>> getExperiences();
  Future<About> getAboutInfo();
  Future<HeroInfo> getHeroInfo();
}
