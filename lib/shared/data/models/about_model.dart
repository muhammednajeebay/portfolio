import '../../domain/entities/about.dart';

class AboutModel extends About {
  const AboutModel({
    required super.title,
    required super.descriptions,
    required super.imageUrl,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      title: json['title'],
      descriptions: List<String>.from(json['descriptions']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'descriptions': descriptions,
      'imageUrl': imageUrl,
    };
  }
}
