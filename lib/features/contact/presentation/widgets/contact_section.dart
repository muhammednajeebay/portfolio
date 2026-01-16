import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';

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
    return Animate(
      effects: const [FadeEffect(), MoveEffect(begin: Offset(0, 24))],
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        shadowColor:
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 32),
          child: Column(
            children: [
              AnimatedHeader(
                text: "Contact Me",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 16),
              Text(
                "Reach out via email or connect with me on LinkedIn or GitHub.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 6),
                  SelectableText(
                    'muhammednajeeb.ay@gmail.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,
                      color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(width: 6),
                  SelectableText(
                    'Kerala, India',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                children: [
                  _SocialButton(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://www.linkedin.com/in/muhammednajeebay',
                    label: 'LinkedIn',
                    onPressed: () => _launchLink(
                        'https://www.linkedin.com/in/muhammednajeebay'),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.github,
                    url: 'https://github.com/muhammednajeebay',
                    label: 'GitHub',
                    onPressed: () =>
                        _launchLink('https://github.com/muhammednajeebay'),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.medium,
                    url: 'https://medium.com/@muhammednajeeb.ay',
                    label: 'Medium',
                    onPressed: () =>
                        _launchLink('https://medium.com/@muhammednajeeb.ay'),
                  ),
                  _SocialButton(
                    icon: FontAwesomeIcons.solidFilePdf,
                    url:
                        'https://drive.google.com/file/d/1HE4YXOQiKdqjnSb1n2g22ixbbA-BWKVE/view',
                    label: 'Resume',
                    onPressed: () => _launchLink(
                        'https://drive.google.com/file/d/1HE4YXOQiKdqjnSb1n2g22ixbbA-BWKVE/view'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 34,
      // Use a generic color or from theme, or let IconButton handle it if null
      // For this design, let's keep it simple or use primary
      color: Theme.of(context).iconTheme.color,
      onPressed: onPressed,
      tooltip: label,
    );
  }
}
