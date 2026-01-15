import '../entities/about.dart';
import '../repositories/portfolio_repository.dart';

class GetAboutInfo {
  final PortfolioRepository repository;

  GetAboutInfo(this.repository);

  Future<About> call() async {
    return await repository.getAboutInfo();
  }
}
