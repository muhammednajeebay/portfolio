import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/domain/entities/about.dart';

class AboutSection extends StatelessWidget {
  final About aboutInfo;

  const AboutSection({
    super.key,
    required this.aboutInfo,
  });

  @override
  Widget build(BuildContext context) {
    if (aboutInfo.descriptions.length < 3) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quiet Heading
          Text(
            aboutInfo.title,
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
              color: colors.onSurface.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 60),

          // 2-Column Layout
          if (isMobile)
            _buildMobileLayout(context, colors)
          else
            _buildDesktopLayout(context, colors),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ColorScheme colors) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side: Image
        Container(
          width: 280,
          height: 360, // Slightly reduced height
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
              ]),
              child: Image.asset(
                aboutInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(width: 80), // Increased horizontal spacing

        // Right Side: Text Blocks
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Block 1: Identity
              SizedBox(
                width: 500, // Reduced text width
                child: Text(
                  aboutInfo.descriptions[0],
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    color: colors.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 48), // Space between blocks > space within

              // Block 2: Context
              SizedBox(
                width: 480,
                child: Text(
                  aboutInfo.descriptions[1],
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    color: colors.onSurface.withOpacity(0.8),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Block 3: Values
              Text(
                aboutInfo.descriptions[2],
                style: GoogleFonts.outfit(
                  fontSize: 14, // Small size
                  fontWeight: FontWeight.w400,
                  height: 1.8, // Generous line height
                  color: colors.onSurface.withOpacity(0.4), // Low contrast
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ColorScheme colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image at top for mobile
        Container(
          width: double.infinity,
          height: 300,
          margin: const EdgeInsets.only(bottom: 48),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ColorFiltered(
              colorFilter: const ColorFilter.matrix([
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0.2126,
                0.7152,
                0.0722,
                0,
                0,
                0,
                0,
                0,
                1,
                0,
              ]),
              child: Image.asset(
                aboutInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        // Text Blocks
        Text(
          aboutInfo.descriptions[0],
          style: GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.4,
            color: colors.onSurface,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          aboutInfo.descriptions[1],
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.6,
            color: colors.onSurface.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          aboutInfo.descriptions[2],
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.8,
            color: colors.onSurface.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
