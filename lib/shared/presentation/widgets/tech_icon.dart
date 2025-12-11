import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TechIcon extends StatelessWidget {
  final String tech;
  const TechIcon(this.tech, {super.key});
  @override
  Widget build(BuildContext context) {
    IconData? icon;
    switch (tech) {
      case "Flutter":
        icon = FontAwesomeIcons.mobileScreenButton;
        break;
      case "Provider":
      case "BLoC":
      case "GetX":
        icon = FontAwesomeIcons.codeBranch;
        break;
      case "REST":
      case "Http":
        icon = FontAwesomeIcons.networkWired;
        break;
      case "Python":
        icon = FontAwesomeIcons.python;
        break;
    }
    return icon != null
        ? Padding(
            padding: const EdgeInsets.only(right: 1),
            child: Icon(icon, size: 15, color: const Color(0xFF4A90E2)),
          )
        : const SizedBox(width: 0, height: 0);
  }
}
