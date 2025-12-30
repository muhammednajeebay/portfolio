import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/theme/app_theme.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  bool _isVisible = false;
  late final Key _visibilityKey;

  @override
  void initState() {
    super.initState();
    _visibilityKey = UniqueKey();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_isVisible && info.visibleFraction > 0.1) {
      setState(() => _isVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return VisibilityDetector(
      key: _visibilityKey,
      onVisibilityChanged: _onVisibilityChanged,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: isMobile ? 60 : 100,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left side: Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Animate(
                    target: _isVisible ? 1 : 0,
                    effects: [
                      FadeEffect(
                        duration: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      MoveEffect(
                        begin: const Offset(0, 30),
                        duration: 800.ms,
                        curve: Curves.fastOutSlowIn,
                      ),
                      BlurEffect(
                        begin: const Offset(0, 10),
                        duration: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                    ],
                    child: Text(
                      'Hi,',
                      style: GoogleFonts.outfit(
                        color: isDark
                            ? AppColors.darkBodyText
                            : AppColors.lightBodyText,
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Animate(
                    target: _isVisible ? 1 : 0,
                    effects: [
                      FadeEffect(
                        duration: 700.ms,
                        delay: 200.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      MoveEffect(
                        begin: const Offset(0, 40),
                        duration: 900.ms,
                        delay: 200.ms,
                        curve: Curves.fastOutSlowIn,
                      ),
                      ScaleEffect(
                        begin: const Offset(0.9, 0.9),
                        duration: 900.ms,
                        delay: 200.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      BlurEffect(
                        begin: const Offset(0, 15),
                        duration: 700.ms,
                        delay: 200.ms,
                        curve: Curves.easeOutCubic,
                      ),
                    ],
                    child: Text(
                      'Muhammed Najeeb AY',
                      style: GoogleFonts.outfit(
                        color: isDark
                            ? AppColors.darkHeadings
                            : AppColors.lightHeadings,
                        fontSize: isMobile ? 36 : 50,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Animate(
                    target: _isVisible ? 1 : 0,
                    effects: [
                      FadeEffect(
                        duration: 700.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      MoveEffect(
                        begin: const Offset(0, 30),
                        duration: 800.ms,
                        delay: 400.ms,
                        curve: Curves.fastOutSlowIn,
                      ),
                      ScaleEffect(
                        begin: const Offset(0.95, 0.95),
                        duration: 800.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      BlurEffect(
                        begin: const Offset(0, 10),
                        duration: 700.ms,
                        delay: 400.ms,
                        curve: Curves.easeOutCubic,
                      ),
                    ],
                    child: Text(
                      'Flutter Developer · Mobile & Web Applications',
                      style: GoogleFonts.outfit(
                        color: AppColors.lightAccent,
                        fontSize: isMobile ? 18 : 22,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Animate(
                    target: _isVisible ? 1 : 0,
                    effects: [
                      FadeEffect(
                        duration: 700.ms,
                        delay: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                      MoveEffect(
                        begin: const Offset(30, 0),
                        duration: 800.ms,
                        delay: 600.ms,
                        curve: Curves.fastOutSlowIn,
                      ),
                      BlurEffect(
                        begin: const Offset(10, 0),
                        duration: 700.ms,
                        delay: 600.ms,
                        curve: Curves.easeOutCubic,
                      ),
                    ],
                    child: Text(
                      'I build scalable Flutter applications with clean architecture, focused on performance, clarity, and real-world impact.',
                      style: GoogleFonts.outfit(
                        color: isDark
                            ? AppColors.darkBodyText
                            : AppColors.lightBodyText,
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                  ),
                  if (!isMobile) ...[
                    const SizedBox(height: 60),
                    Animate(
                      target: _isVisible ? 1 : 0,
                      effects: [
                        FadeEffect(
                          duration: 700.ms,
                          delay: 1000.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        MoveEffect(
                          begin: const Offset(0, 10),
                          duration: 800.ms,
                          delay: 1000.ms,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ],
                      child: Animate(
                        onPlay: (controller) => controller.repeat(),
                        effects: [
                          MoveEffect(
                            begin: const Offset(0, 0),
                            end: const Offset(0, 8),
                            duration: 1500.ms,
                            curve: Curves.easeInOut,
                          ),
                        ],
                        child: Text(
                          'Scroll Down',
                          style: GoogleFonts.outfit(
                            color: isDark
                                ? AppColors.darkBodyText
                                : AppColors.lightBodyText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Right side: Portrait image
            if (!isMobile) ...[
              const SizedBox(width: 60),
              Expanded(
                flex: 2,
                child: Animate(
                  target: _isVisible ? 1 : 0,
                  effects: [
                    FadeEffect(
                      duration: 800.ms,
                      delay: 500.ms,
                      curve: Curves.easeOutCubic,
                    ),
                    ScaleEffect(
                      begin: const Offset(0.8, 0.8),
                      duration: 1000.ms,
                      delay: 500.ms,
                      curve: Curves.easeOutCubic,
                    ),
                    MoveEffect(
                      begin: const Offset(60, 0),
                      duration: 1000.ms,
                      delay: 500.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                    BlurEffect(
                      begin: const Offset(15, 0),
                      duration: 800.ms,
                      delay: 500.ms,
                      curve: Curves.easeOutCubic,
                    ),
                  ],
                  child: AspectRatio(
                    aspectRatio: 4 / 5, // 400/500 = 0.8
                    child: Image.asset(
                      'assets/profile/hero_img.png',
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.saturation,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
