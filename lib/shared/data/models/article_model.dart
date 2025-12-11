import '../../domain/entities/article.dart';

class ArticleModel extends Article {
  const ArticleModel({
    required super.title,
    required super.summary,
    required super.url,
    required super.readTime,
    required super.date,
  });
}
