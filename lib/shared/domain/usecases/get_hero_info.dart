import '../entities/hero_info.dart';
import '../repositories/portfolio_repository.dart';

class GetHeroInfo {
  final PortfolioRepository repository;

  GetHeroInfo(this.repository);

  Future<HeroInfo> call() async {
    return await repository.getHeroInfo();
  }
}
