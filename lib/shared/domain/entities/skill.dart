import 'package:flutter/widgets.dart';

class Skill {
  final String name;
  final String description;
  final List<String> items;
  final IconData? icon;

  const Skill({
    required this.name,
    required this.description,
    required this.items,
    this.icon,
  });
}
