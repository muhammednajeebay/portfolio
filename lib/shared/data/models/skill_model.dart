import 'package:flutter/widgets.dart';
import '../../domain/entities/skill.dart';

class SkillModel extends Skill {
  const SkillModel({
    required super.name,
    required super.items,
    required super.icon,
  });

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'],
      items: List<String>.from(map['items']),
      icon: map['icon'] as IconData,
    );
  }
}
