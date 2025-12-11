import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.technologies,
    required super.githubUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'],
      description: json['desc'],
      imageUrl: json['img'],
      technologies: List<String>.from(json['tech']),
      githubUrl: json['github'],
    );
  }
}
