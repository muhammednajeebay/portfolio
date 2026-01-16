import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/theme/app_theme.dart';

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
    final colors = context.appColors;

    final sections = [
      'Home',
      'About',
      'Work',
      'Skill',
      'Timeline',
      'Connect',
    ];

    if (isMobile) {
      return Drawer(
        backgroundColor: colors.background,
        child: Column(
          children: [
            const SizedBox(height: 60),
            // MN Logo in Drawer
            Text(
              'MN',
              style: AppTextStyles.headlineSmall(context).copyWith(
                color: colors.primary,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Divider(indent: 40, endIndent: 40),
            const SizedBox(height: 20),
            // Navigation Items
            Expanded(
              child: ListView.builder(
                itemCount: sections.length,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  final isActive =
                      activeSection.toLowerCase() == section.toLowerCase();

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                    title: Text(
                      section.toUpperCase(),
                      style: AppTextStyles.navItem(context, isActive: isActive)
                          .copyWith(
                        color: isActive ? colors.primary : colors.secondary,
                        letterSpacing: 4,
                      ),
                    ),
                    trailing: isActive
                        ? Icon(Icons.arrow_right_alt, color: colors.primary)
                        : null,
                    onTap: () {
                      onSectionTap(section);
                      Navigator.pop(context); // Close drawer
                    },
                  );
                },
              ),
            ),
            // Social Icons at bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialIcon(
                    icon: FontAwesomeIcons.linkedin,
                    onTap: () => _launchLink(
                        'https://www.linkedin.com/in/muhammednajeebay'),
                  ),
                  const SizedBox(width: 20),
                  _SocialIcon(
                    icon: FontAwesomeIcons.github,
                    onTap: () =>
                        _launchLink('https://github.com/muhammednajeebay'),
                  ),
                  const SizedBox(width: 20),
                  _SocialIcon(
                    icon: FontAwesomeIcons.medium,
                    onTap: () =>
                        _launchLink('https://medium.com/@muhammednajeebay'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 80,
      color: colors.background,
      child: Column(
        children: [
          // MN Initials
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              'MN',
              style: AppTextStyles.headlineSmall(context).copyWith(
                color: colors.primary,
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
                  final isActive =
                      activeSection.toLowerCase() == section.toLowerCase();
                  return GestureDetector(
                    onTap: () {
                      onSectionTap(section);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          section,
                          style:
                              AppTextStyles.navItem(context, isActive: isActive)
                                  .copyWith(
                            decoration: isActive
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            decorationColor: colors.primary,
                            decorationThickness: 2,
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
                    _launchLink('https://www.linkedin.com/in/muhammednajeebay');
                  },
                ),
                const SizedBox(height: 16),
                _SocialIcon(
                  icon: FontAwesomeIcons.github,
                  onTap: () {
                    _launchLink('https://github.com/muhammednajeebay');
                  },
                ),
                const SizedBox(height: 16),
                _SocialIcon(
                  icon: FontAwesomeIcons.medium,
                  onTap: () {
                    _launchLink('https://medium.com/@muhammednajeebay');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchLink(String url) async {
    try {
      await launchUrlString(url);
    } catch (e) {
      debugPrint('Could not launch $url');
    }
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
    final colors = context.appColors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: colors.primary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: colors.primary,
          size: 18,
        ),
      ),
    );
  }
}
