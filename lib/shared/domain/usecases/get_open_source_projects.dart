import '../entities/project.dart';
import '../repositories/portfolio_repository.dart';

class GetOpenSourceProjects {
  final PortfolioRepository repository;

  GetOpenSourceProjects(this.repository);

  Future<List<Project>> call() {
    return repository.getOpenSourceProjects();
  }
}
