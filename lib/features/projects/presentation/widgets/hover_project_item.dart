import 'package:flutter/material.dart';
import 'package:portfolio/shared/domain/entities/project.dart';
import 'package:portfolio/core/utils/app_colors.dart';

class HoverProjectItem extends StatefulWidget {
  final int index;
  final Project project;
  final VoidCallback onTap;

  const HoverProjectItem({
    super.key,
    required this.index,
    required this.project,
    required this.onTap,
  });

  @override
  State<HoverProjectItem> createState() => _HoverProjectItemState();
}

class _HoverProjectItemState extends State<HoverProjectItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 700;

    String projectNumber = (widget.index + 1).toString().padLeft(2, '0');

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.dividerColor.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main Row Layout
              Row(
                children: [
                  // Number and Line
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Text(
                          projectNumber,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: theme.dividerColor.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  // Title and Category
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.project.category,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // View Project Button
                  if (!isMobile) _ViewProjectButton(onTap: widget.onTap),
                ],
              ),

              // Floating Image and Shape (Desktop Only)
              if (!isMobile)
                Positioned(
                  right: 150,
                  top: -80,
                  child: AnimatedScale(
                    scale: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutBack,
                    child: AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      child: _HoverImagePreview(
                        imageUrl: widget.project.imageUrl,
                        color: _parseColor(widget.project.primaryColor),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _parseColor(String hexColor) {
    try {
      return Color(int.parse(hexColor.replaceAll('#', '0xFF')));
    } catch (_) {
      return AppColors.accent;
    }
  }
}

class _ViewProjectButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ViewProjectButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "VIEW PROJECT",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, size: 14, color: Colors.black),
        ],
      ),
    );
  }
}

class _HoverImagePreview extends StatelessWidget {
  final String imageUrl;
  final Color color;

  const _HoverImagePreview({
    required this.imageUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Tilted Shape
          Transform.rotate(
            angle: -0.1,
            child: Container(
              width: 320,
              height: 180,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          // Project Image
          Transform.rotate(
            angle: 0.1,
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
