import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  final String activeSection;
  final Function(String) onSectionTap;
  final bool isMobile;

  const Sidebar({
    super.key,
    required this.activeSection,
    required this.onSectionTap,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (isMobile) {
      // Mobile: Show as bottom navigation or drawer
      return const SizedBox.shrink();
    }

    final sections = [
      'Home',
      'About',
      'Work',
      'Skill',
      'Timeline',
      'Connect',
    ];

    return Container(
      width: 80,
      color: isDark ? const Color(0xFF000000) : const Color(0xFF000000),
      child: Column(
        children: [
          // MN Initials
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              'MN',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),

          // Navigation Menu (Vertical, rotated text)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sections.map((section) {
                  final isActive = activeSection.toLowerCase() ==
                      section.toLowerCase();
                  return GestureDetector(
                    onTap: () => onSectionTap(section),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          section,
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: isActive
                                ? FontWeight.w600
                                : FontWeight.w400,
                            decoration: isActive
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Social Icons
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                _SocialIcon(
                  icon: FontAwesomeIcons.linkedin,
                  onTap: () {
                    // TODO: Add LinkedIn URL
                  },
                ),
                const SizedBox(height: 16),
                _SocialIcon(
                  icon: FontAwesomeIcons.github,
                  onTap: () {
                    // TODO: Add GitHub URL
                  },
                ),
                const SizedBox(height: 16),
                _SocialIcon(
                  icon: Icons.description,
                  onTap: () {
                    // TODO: Add resume download
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

