import '../../domain/entities/experience.dart';

class ExperienceModel extends Experience {
  const ExperienceModel({
    required super.company,
    required super.role,
    required super.period,
    required super.location,
    required super.highlights,
    required super.techStack,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      company: json['company'] as String,
      role: json['role'] as String,
      period: json['period'] as String,
      location: json['location'] as String,
      highlights: List<String>.from(json['highlights'] as List),
      techStack: List<String>.from(json['techStack'] as List),
    );
  }
}
