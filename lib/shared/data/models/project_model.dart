import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.title,
    required super.status,
    required super.description,
    required super.imageUrl,
    required super.technologies,
    required super.features,
    required super.links,
    required super.category,
    required super.primaryColor,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      status: json['status'] ?? 'unknown',
      description: json['description'] ?? json['desc'] ?? '',
      imageUrl: json['imageUrl'] ?? json['img'] ?? '',
      technologies:
          List<String>.from(json['tech'] ?? json['technologies'] ?? []),
      features: List<String>.from(json['features'] ?? []),
      links: Map<String, String>.from(json['links'] ?? {}),
      category: json['category'] ?? "Development",
      primaryColor: json['primaryColor'] ?? json['primary_color'] ?? "#000000",
    );
  }
}
