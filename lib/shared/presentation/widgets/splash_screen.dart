import 'package:flutter/material.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _run = false;
  late AnimationController _textController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeIn,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOut,
      ),
    );

    // Start the drawing animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _run = true;
        });
      }
    });

    // Start text animation after logo draws
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        _textController.forward();
      }
    });

    // Navigate after all animations complete
    Future.delayed(const Duration(milliseconds: 4500), () {
      if (mounted) {
        context.go('/');
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor =
        isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final textColor = isDark ? AppColors.darkHeadings : AppColors.lightHeadings;
    final svgColor = isDark ? AppColors.darkHeadings : AppColors.lightHeadings;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Transform.rotate(
                  angle: 3.14159, // 180 degrees in radians (π)
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      svgColor,
                      BlendMode.srcIn,
                    ),
                    child: AnimatedDrawing.svg(
                      'assets/profile/logo.svg',
                      run: _run,
                      duration: const Duration(milliseconds: 2500),
                      // width: 300,
                      // height: 250,
                      lineAnimation: LineAnimation.allAtOnce,
                      animationOrder: PathOrders.increasingLength,
                      onFinish: () {
                        // Optional: do something when drawing finishes
                      },
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: AnimatedBuilder(
                animation: _textController,
                builder: (context, child) {
                  return SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'Muhammed Najeeb',
                        style: GoogleFonts.outfit(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
