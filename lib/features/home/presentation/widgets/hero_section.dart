import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  List<Widget> _buildHighlights(bool isMobile, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    const highlights = [
      'Flutter Animations',
      'Clean Architecture',
      'State Management',
      'API Integrations',
      'CI/CD Ready',
      'Multi-platform'
    ];

    return List.generate(highlights.length, (index) {
      final label = highlights[index];
      return Animate(
        effects: [
          FadeEffect(
              duration: 400.ms,
              delay: Duration(milliseconds: 400 + 50 * index)),
          ScaleEffect(
            begin: const Offset(0.9, 0.9),
            duration: 500.ms,
            curve: Curves.easeOutBack,
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                isDark
                    ? Color.alphaBlend(
                        colorScheme.onSurface.withValues(alpha: 0.04),
                        colorScheme.surfaceContainerHighest,
                      )
                    : colorScheme.primaryContainer.withValues(alpha: 0.9),
                isDark
                    ? Color.alphaBlend(
                        colorScheme.onSurface.withValues(alpha: 0.02),
                        colorScheme.surface,
                      )
                    : colorScheme.secondaryContainer.withValues(alpha: 0.85),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: isDark ? 0.35 : 0.2),
            ),
          ),
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 360,
              width: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    (isDark
                        ? colorScheme.primary.withValues(alpha: 0.08)
                        : colorScheme.primary.withValues(alpha: 0.18)),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 750;
            final content = Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Animate(
                  effects: [
                    FadeEffect(duration: 500.ms, curve: Curves.easeOut),
                    MoveEffect(
                      begin: Offset(0, isMobile ? 32 : 24),
                      duration: 600.ms,
                      curve: Curves.easeOutQuad,
                    ),
                  ],
                  child: Text(
                    "Muhammed Najeeb AY",
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontSize: isMobile ? 40 : 56,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.0,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                ),
                const SizedBox(height: 12),
                Animate(
                  effects: const [
                    FadeEffect(
                        duration: Duration(milliseconds: 500),
                        delay: Duration(milliseconds: 200)),
                  ],
                  child: Text(
                    "I build things for mobile.",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile ? 18 : 22,
                    ),
                    textAlign: isMobile ? TextAlign.center : TextAlign.left,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "I'm a Flutter developer specializing in building exceptional digital experiences for mobile platforms.",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    height: 1.5,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                )
                    .animate()
                    .fade(delay: const Duration(milliseconds: 300))
                    .moveY(begin: 20, end: 0),
                const SizedBox(height: 32),
                // CTA Buttons
                // Row(
                //   mainAxisAlignment: isMobile
                //       ? MainAxisAlignment.center
                //       : MainAxisAlignment.start,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {
                //         // Scroll to contact
                //       },
                //       style: ElevatedButton.styleFrom(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 32, vertical: 20),
                //         backgroundColor: colorScheme.primary,
                //         foregroundColor: colorScheme.onPrimary,
                //       ),
                //       child: const Text("Get In Touch"),
                //     ),
                //     const SizedBox(width: 18),
                //     OutlinedButton.icon(
                //       icon: const Icon(Icons.arrow_outward_rounded),
                //       label: const Text("View Work"),
                //       style: OutlinedButton.styleFrom(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 26, vertical: 16),
                //         foregroundColor: colorScheme.onSurface,
                //         side: BorderSide(
                //           color: colorScheme.primary
                //               .withValues(alpha: isDark ? 0.5 : 0.35),
                //         ),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16)),
                //       ),
                //       onPressed: () => Scrollable.ensureVisible(
                //         context.findAncestorStateOfType<State>()?.context ??
                //             context,
                //         duration: const Duration(milliseconds: 400),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment:
                      isMobile ? WrapAlignment.center : WrapAlignment.start,
                  children: _buildHighlights(isMobile, theme),
                ),
                const SizedBox(height: 28),
                Animate(
                  effects: const [
                    FadeEffect(),
                    MoveEffect(begin: Offset(0, 18), curve: Curves.easeOutCirc),
                  ],
                  child: Wrap(
                    spacing: 18,
                    runSpacing: 12,
                    alignment:
                        isMobile ? WrapAlignment.center : WrapAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.download_rounded),
                        label: const Text("Download CV"),
                        onPressed: () {
                          // TODO: add CV link
                        },
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.arrow_outward_rounded),
                        label: const Text("View Work"),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 26, vertical: 16),
                          foregroundColor: colorScheme.onSurface,
                          side: BorderSide(
                            color: colorScheme.primary
                                .withValues(alpha: isDark ? 0.5 : 0.35),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () => Scrollable.ensureVisible(
                          context.findAncestorStateOfType<State>()?.context ??
                              context,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );

            final avatar = Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 600)),
                ScaleEffect(
                  begin: Offset(0.8, 0.8),
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeOutBack,
                ),
              ],
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.tertiary,
                      colorScheme.secondary,
                      colorScheme.primary,
                    ],
                    stops: const [0.0, 0.4, 0.7, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.35),
                      blurRadius: 30,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: isMobile ? 70 : 96,
                  backgroundImage:
                      const AssetImage('assets/profile/najeeb_pic.PNG'),
                ),
              ),
            );

            // final stats = <Map<String, String>>[
            //   {'value': '5+', 'label': 'Years crafting apps'},
            //   {'value': '25+', 'label': 'Production launches'},
            //   {'value': '100K+', 'label': 'End-users served'},
            // ];

            // final statCards = List.generate(stats.length, (index) {
            //   final stat = stats[index];
            //   return Animate(
            //     effects: [
            //       FadeEffect(
            //         duration: 400.ms,
            //         delay: Duration(milliseconds: 320 + index * 80),
            //       ),
            //       MoveEffect(
            //         begin: const Offset(0, 20),
            //         duration: 400.ms,
            //       ),
            //     ],
            //     child: Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(18),
            //         border: Border.all(
            //             color: colorScheme.primary
            //                 .withValues(alpha: isDark ? 0.28 : 0.2)),
            //         color: isDark
            //             ? elevatedSurface(0.12)
            //             : colorScheme.surface.withValues(alpha: 0.9),
            //       ),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             stat['value']!,
            //             style: theme.textTheme.headlineLarge?.copyWith(
            //               color: colorScheme.primary,
            //               fontSize: 40,
            //             ),
            //           ),
            //           const SizedBox(height: 6),
            //           Text(
            //             stat['label']!,
            //             style: theme.textTheme.bodyMedium,
            //           ),
            //         ],
            //       ),
            //     ),
            //   );
            // });

            return Column(
              children: [
                if (isMobile) avatar,
                if (isMobile) const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: content),
                    if (!isMobile) ...[
                      const SizedBox(width: 48),
                      avatar,
                    ],
                  ],
                ),
                const SizedBox(height: 36),
              ],
            );
          },
        ),
      ],
    );
  }
}
