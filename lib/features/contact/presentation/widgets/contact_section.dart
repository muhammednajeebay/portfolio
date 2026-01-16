import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launchLink(String url) async {
    final launched = await launchUrlString(url);
    if (!launched) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedHeader(
            text: "Connect.",
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              "I'm always looking for new opportunities and interesting projects to collaborate on. Feel free to reach out via email or any of the platforms below.",
              style: GoogleFonts.outfit(
                fontSize: 18,
                height: 1.6,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
          const SizedBox(height: 60),
          _ContactItem(
            label: 'Email',
            value: 'muhammednajeeb.ay@gmail.com',
            icon: Icons.email_outlined,
            onTap: () => _launchLink('mailto:muhammednajeeb.ay@gmail.com'),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              _SocialLink(
                label: 'LinkedIn',
                onTap: () =>
                    _launchLink('https://www.linkedin.com/in/muhammednajeebay'),
              ),
              _SocialLink(
                label: 'GitHub',
                onTap: () => _launchLink('https://github.com/muhammednajeebay'),
              ),
              _SocialLink(
                label: 'Medium',
                onTap: () =>
                    _launchLink('https://medium.com/@muhammednajeeb.ay'),
              ),
              _SocialLink(
                label: 'Resume',
                onTap: () => _launchLink(
                    'https://drive.google.com/file/d/1HE4YXOQiKdqjnSb1n2g22ixbbA-BWKVE/view'),
              ),
            ],
          ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _ContactItem({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.appColors;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.outfit(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: colors.primary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _SocialLink({
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.appColors;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '▷',
              style: TextStyle(
                color: colors.primary.withOpacity(_isHovered ? 1.0 : 0.5),
                fontSize: 10,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: GoogleFonts.outfit(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
                decoration: _isHovered ? TextDecoration.underline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
