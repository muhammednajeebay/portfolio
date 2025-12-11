import '../entities/project.dart';
import '../repositories/portfolio_repository.dart';

class GetProjects {
  final PortfolioRepository repository;

  GetProjects(this.repository);

  Future<List<Project>> call() async {
    return await repository.getProjects();
  }
}
