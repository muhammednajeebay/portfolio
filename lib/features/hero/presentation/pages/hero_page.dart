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
    final isMobile = size.width < 1024;

    return RepaintBoundary(
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
            if (!isMobile)
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

            // Mobile layout
            if (isMobile)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeTransition(
                      opacity: _fade,
                      child: const WallText(isMobile: true),
                    ),
                    const SizedBox(height: 40),
                    FadeTransition(
                      opacity: _fade,
                      child: Center(
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Image.asset(
                            'assets/profile/hero_img.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Scroll indicator at bottom
            if (!isMobile)
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
                        style: AppTextStyles.bodySmall(context).copyWith(
                          color: context.appColors.bodyText.withOpacity(0.6),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: context.appColors.bodyText.withOpacity(0.6),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
