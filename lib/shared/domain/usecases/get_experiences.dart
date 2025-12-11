import '../entities/experience.dart';
import '../repositories/portfolio_repository.dart';

class GetExperiences {
  final PortfolioRepository repository;

  GetExperiences(this.repository);

  Future<List<Experience>> call() async {
    return repository.getExperiences();
  }
}
