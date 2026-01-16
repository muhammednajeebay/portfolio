import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher_string.dart';
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

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Connect.",
            style: GoogleFonts.outfit(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),
          const SizedBox(height: 48),
          _EmailElement(
            email: 'muhammednajeeb.ay@gmail.com',
            onTap: () => _launchLink('mailto:muhammednajeeb.ay@gmail.com'),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
          const SizedBox(height: 48),
          const _SocialLinksText()
              .animate()
              .fadeIn(delay: 400.ms)
              .slideY(begin: 0.1),
          const SizedBox(height: 80),
          Opacity(
            opacity: 0.5,
            child: Text(
              "Currently open to meaningful opportunities and collaborations.",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 14,
                letterSpacing: 0.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ).animate().fadeIn(delay: 600.ms),
          const SizedBox(height: 24),
          Opacity(
            opacity: 0.3,
            child: Text(
              "© 2026 · Built with Flutter Web",
              style: GoogleFonts.outfit(
                fontSize: 12,
                letterSpacing: 0.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ).animate().fadeIn(delay: 800.ms),
          const SizedBox(height: 24),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _EmailElement extends StatefulWidget {
  final String email;
  final VoidCallback onTap;

  const _EmailElement({required this.email, required this.onTap});

  @override
  State<_EmailElement> createState() => _EmailElementState();
}

class _EmailElementState extends State<_EmailElement> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: theme.colorScheme.onSurface,
            decoration:
                _isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
          child: Text(widget.email),
        ),
      ),
    );
  }
}

class _SocialLinksText extends StatelessWidget {
  const _SocialLinksText();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _TextLink(
          label: 'LinkedIn',
          onTap: () =>
              launchUrlString('https://www.linkedin.com/in/muhammednajeebay'),
        ),
        _divider(),
        _TextLink(
          label: 'GitHub',
          onTap: () => launchUrlString('https://github.com/muhammednajeebay'),
        ),
        _divider(),
        _TextLink(
          label: 'Medium',
          onTap: () => launchUrlString('https://medium.com/@muhammednajeeb.ay'),
        ),
        _divider(),
        _TextLink(
          label: 'Resume',
          onTap: () => launchUrlString(
              'https://drive.google.com/file/d/1HE4YXOQiKdqjnSb1n2g22ixbbA-BWKVE/view'),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Opacity(
        opacity: 0.3,
        child: Text('/', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}

class _TextLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _TextLink({required this.label, required this.onTap});

  @override
  State<_TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<_TextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isHovered ? 1.0 : 0.5,
          child: Text(
            widget.label,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
