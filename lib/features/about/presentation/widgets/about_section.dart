import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Animate(
      effects: [
        FadeEffect(duration: 500.ms),
        BlurEffect(
            duration: 500.ms, begin: const Offset(10, 10), end: Offset.zero),
      ],
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Me",
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(height: 1.6, fontSize: 16),
                  children: [
                    const TextSpan(text: "Hi, I'm "),
                    TextSpan(text: "Najeeb", style: _bold(theme)),
                    const TextSpan(
                        text:
                            ", a Flutter Developer and Mobile App Engineer passionate about crafting applications that are fast, scalable, and truly user-focused. With hands-on experience in production-grade apps, I bring together performance, clean architecture, and intuitive design to deliver seamless digital experiences.\n\n"),
                    const TextSpan(
                        text:
                            "My expertise includes state management, API-driven development, animations, and platform integrations. I care deeply about writing clean, maintainable code and building solutions that can grow and adapt with time. For me, great apps are not just functional, they're elegant and sustainable.\n\n"),
                    const TextSpan(
                        text:
                            "I thrive on continuous learning, constructive feedback, and staying ahead with modern Flutter/Dart practices. Known for being detail-oriented and pragmatic, I approach problem-solving with clarity while keeping long-term scalability in mind."),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Values
              _buildHighlightBox(context, "Core Values:", [
                const TextSpan(text: "I believe in building with "),
                TextSpan(text: "integrity", style: _italic(theme)),
                const TextSpan(text: ", taking full "),
                TextSpan(text: "ownership", style: _italic(theme)),
                const TextSpan(text: " of my work, and staying committed to "),
                TextSpan(text: "continuous learning", style: _italic(theme)),
                const TextSpan(
                    text:
                        ". Every project I work on is driven by a pursuit of "),
                TextSpan(
                    text: "excellence in execution", style: _italic(theme)),
                const TextSpan(
                    text: " and a mindset of creating solutions that last."),
              ]),
              const SizedBox(height: 16),
              // Goals
              _buildHighlightBox(context, "Goals:", [
                const TextSpan(
                    text:
                        "My vision is to grow into a senior engineering role where I can "),
                TextSpan(
                    text: "design scalable architectures",
                    style: _italic(theme)),
                const TextSpan(text: ", "),
                TextSpan(text: "mentor developers", style: _italic(theme)),
                const TextSpan(
                    text:
                        ", and help shape digital products that deliver meaningful impact to users and businesses alike."),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle? _bold(ThemeData theme) => theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold, color: theme.colorScheme.onSurface);
  TextStyle? _italic(ThemeData theme) => theme.textTheme.bodyLarge
      ?.copyWith(fontStyle: FontStyle.italic, color: theme.colorScheme.primary);

  Widget _buildHighlightBox(
      BuildContext context, String title, List<InlineSpan> children) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.05),
        border:
            Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.diamond_outlined,
              color: theme.colorScheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                children: [
                  TextSpan(
                      text: "$title ",
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  ...children
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
