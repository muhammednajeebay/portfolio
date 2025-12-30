import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Animate(
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
              ScaleEffect(
                begin: const Offset(0.95, 0.95),
                duration: 800.ms,
                curve: Curves.easeOutCubic,
              ),
            ],
            child: Text(
              'What about me',
              style: GoogleFonts.outfit(
                color:
                    isDark ? AppColors.darkHeadings : AppColors.lightHeadings,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side: Portrait image
              if (!isMobile)
                Animate(
                  effects: [
                    FadeEffect(
                      duration: 700.ms,
                      delay: 300.ms,
                      curve: Curves.easeOutCubic,
                    ),
                    ScaleEffect(
                      begin: const Offset(0.85, 0.85),
                      duration: 900.ms,
                      delay: 300.ms,
                      curve: Curves.easeOutCubic,
                    ),
                    MoveEffect(
                      begin: const Offset(-40, 0),
                      duration: 900.ms,
                      delay: 300.ms,
                      curve: Curves.fastOutSlowIn,
                    ),
                    BlurEffect(
                      begin: const Offset(10, 0),
                      duration: 700.ms,
                      delay: 300.ms,
                      curve: Curves.easeOutCubic,
                    ),
                  ],
                  child: Container(
                    width: 300,
                    height: 400,
                    margin: const EdgeInsets.only(right: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/profile/najeeb_pic.PNG',
                        fit: BoxFit.cover,
                        color: Colors.white,
                        colorBlendMode: BlendMode.saturation,
                      ),
                    ),
                  ),
                ),
              // Right side: Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isMobile) ...[
                      Animate(
                        effects: [
                          FadeEffect(
                            duration: 700.ms,
                            delay: 300.ms,
                            curve: Curves.easeOutCubic,
                          ),
                          ScaleEffect(
                            begin: const Offset(0.9, 0.9),
                            duration: 800.ms,
                            delay: 300.ms,
                            curve: Curves.easeOutCubic,
                          ),
                          MoveEffect(
                            begin: const Offset(0, 30),
                            duration: 800.ms,
                            delay: 300.ms,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ],
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          margin: const EdgeInsets.only(bottom: 32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/profile/najeeb_pic.PNG',
                              fit: BoxFit.cover,
                              color: Colors.white,
                              colorBlendMode: BlendMode.saturation,
                            ),
                          ),
                        ),
                      ),
                    ],
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: 700.ms,
                          delay: 500.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        MoveEffect(
                          begin: const Offset(30, 0),
                          duration: 800.ms,
                          delay: 500.ms,
                          curve: Curves.fastOutSlowIn,
                        ),
                        BlurEffect(
                          begin: const Offset(10, 0),
                          duration: 700.ms,
                          delay: 500.ms,
                          curve: Curves.easeOutCubic,
                        ),
                      ],
                      child: Text(
                        "I'm Muhammed Najeeb, a Flutter Developer who builds mobile applications with a strong emphasis on clarity, structure, and long-term maintainability. I focus on creating products that feel fast, intentional, and dependable — not just visually polished, but architecturally sound.",
                        style: GoogleFonts.outfit(
                          color: isDark
                              ? AppColors.darkBodyText
                              : AppColors.lightBodyText,
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: 700.ms,
                          delay: 700.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        MoveEffect(
                          begin: const Offset(30, 0),
                          duration: 800.ms,
                          delay: 700.ms,
                          curve: Curves.fastOutSlowIn,
                        ),
                        BlurEffect(
                          begin: const Offset(10, 0),
                          duration: 700.ms,
                          delay: 700.ms,
                          curve: Curves.easeOutCubic,
                        ),
                      ],
                      child: Text(
                        "My work lives at the intersection of clean architecture and real-world usability. I've built production-grade systems including ERP platforms, learning management systems, and real-time applications, where scalability and performance aren't optional — they're requirements. I care deeply about how code evolves over time and how design decisions impact both users and developers.",
                        style: GoogleFonts.outfit(
                          color: isDark
                              ? AppColors.darkBodyText
                              : AppColors.lightBodyText,
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Animate(
                      effects: [
                        FadeEffect(
                          duration: 700.ms,
                          delay: 900.ms,
                          curve: Curves.easeOutCubic,
                        ),
                        MoveEffect(
                          begin: const Offset(30, 0),
                          duration: 800.ms,
                          delay: 900.ms,
                          curve: Curves.fastOutSlowIn,
                        ),
                        BlurEffect(
                          begin: const Offset(10, 0),
                          duration: 700.ms,
                          delay: 900.ms,
                          curve: Curves.easeOutCubic,
                        ),
                      ],
                      child: Text(
                        "I value ownership, simplicity, and continuous improvement. I approach problems analytically, communicate clearly, and refine relentlessly. For me, good software is quiet — it works, it scales, and it doesn't get in the way.",
                        style: GoogleFonts.outfit(
                          color: isDark
                              ? AppColors.darkBodyText
                              : AppColors.lightBodyText,
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
