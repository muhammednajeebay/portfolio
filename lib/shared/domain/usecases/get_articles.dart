import '../entities/article.dart';
import '../repositories/portfolio_repository.dart';

class GetArticles {
  final PortfolioRepository repository;

  GetArticles(this.repository);

  Future<List<Article>> call() {
    return repository.getArticles();
  }
}
