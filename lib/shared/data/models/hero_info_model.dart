import '../../domain/entities/hero_info.dart';

class HeroInfoModel extends HeroInfo {
  const HeroInfoModel({
    required super.greeting,
    required super.name,
    required super.title,
    required super.subtitle,
    required super.descriptionLines,
    required super.imageUrl,
  });

  factory HeroInfoModel.fromJson(Map<String, dynamic> json) {
    return HeroInfoModel(
      greeting: json['greeting'],
      name: json['name'],
      title: json['title'],
      subtitle: json['subtitle'],
      descriptionLines: List<String>.from(json['descriptionLines']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'greeting': greeting,
      'name': name,
      'title': title,
      'subtitle': subtitle,
      'descriptionLines': descriptionLines,
      'imageUrl': imageUrl,
    };
  }
}
