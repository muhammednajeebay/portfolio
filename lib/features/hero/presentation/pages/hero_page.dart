import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/features/hero/presentation/widgets/content.dart';
import 'package:portfolio/features/hero/presentation/widgets/hero.dart';
import 'package:portfolio/features/hero/presentation/widgets/room.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Desktop layout
        return constraints.maxWidth >= 1024
            ? RepaintBoundary(
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      // Simple perspective background
                      AnimatedBuilder(
                        animation: _fade,
                        builder: (context, _) {
                          return CustomPaint(
                            size: size,
                            painter: SimplePerspectivePainter(
                              opacity: _fade.value,
                              isDark: isDark,
                            ),
                          );
                        },
                      ),

                      // Main content layout
                      Positioned.fill(
                        child: Row(
                          children: [
                            // Left side - Text content
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.18,
                                  top: size.height * 0.22,
                                ),
                                child: FadeTransition(
                                  opacity: _fade,
                                  child: const WallText(isMobile: false),
                                ),
                              ),
                            ),

                            // Right side - Person with chair
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: size.width * 0.1,
                                    bottom: size.height * 0.08,
                                  ),
                                  child: FadeTransition(
                                    opacity: _fade,
                                    child: Transform.scale(
                                      scale: 1.15,
                                      child: ChairWithPerson(size: size),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Scroll indicator at bottom
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: FadeTransition(
                          opacity: _fade,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Scroll Down',
                                style:
                                    AppTextStyles.bodySmall(context).copyWith(
                                  color: context.appColors.bodyText
                                      .withOpacity(0.6),
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color:
                                    context.appColors.bodyText.withOpacity(0.6),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : // Mobile layout - 2 parts: hero image on top, content below
            SingleChildScrollView(
                child: Column(
                  children: [
                    // Part 1: Hero image in room with perspective
                    SizedBox(
                      height: size.height * 0.7,
                      width: size.width,
                      child: ChairWithPerson(size: size),
                    ),

                    // Part 2: Text content below
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 40,
                      ),
                      child: FadeTransition(
                        opacity: _fade,
                        child: const WallText(isMobile: true),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
