import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/domain/entities/about.dart';
import '../../../../shared/presentation/widgets/animated_header.dart';

class AboutSection extends StatelessWidget {
  final About aboutInfo;

  const AboutSection({
    super.key,
    required this.aboutInfo,
  });

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
          AnimatedHeader(
            text: aboutInfo.title,
            style: GoogleFonts.outfit(
              color: isDark ? AppColors.darkHeadings : AppColors.lightHeadings,
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              height: 1.2,
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
                        aboutInfo.imageUrl,
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
                              aboutInfo.imageUrl,
                              fit: BoxFit.cover,
                              color: Colors.white,
                              colorBlendMode: BlendMode.saturation,
                            ),
                          ),
                        ),
                      ),
                    ],
                    ...List.generate(aboutInfo.descriptions.length, (index) {
                      return Column(
                        children: [
                          Animate(
                            effects: [
                              FadeEffect(
                                duration: 700.ms,
                                delay: (500 + index * 200).ms,
                                curve: Curves.easeOutCubic,
                              ),
                              MoveEffect(
                                begin: const Offset(30, 0),
                                duration: 800.ms,
                                delay: (500 + index * 200).ms,
                                curve: Curves.fastOutSlowIn,
                              ),
                              BlurEffect(
                                begin: const Offset(10, 0),
                                duration: 700.ms,
                                delay: (500 + index * 200).ms,
                                curve: Curves.easeOutCubic,
                              ),
                            ],
                            child: Text(
                              aboutInfo.descriptions[index],
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
                          if (index < aboutInfo.descriptions.length - 1)
                            const SizedBox(height: 24),
                        ],
                      );
                    }),
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
