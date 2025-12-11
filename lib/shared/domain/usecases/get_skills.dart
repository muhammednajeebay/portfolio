import '../entities/skill.dart';
import '../repositories/portfolio_repository.dart';

class GetSkills {
  final PortfolioRepository repository;

  GetSkills(this.repository);

  Future<List<Skill>> call() async {
    return await repository.getSkills();
  }
}
