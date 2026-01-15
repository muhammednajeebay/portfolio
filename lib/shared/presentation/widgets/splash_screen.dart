import 'package:flutter/material.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _run = false;
  bool _showText = false;
  late AnimationController _textController;

  @override
  void initState() {
    super.initState();

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
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
        setState(() {
          _showText = true;
        });
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
    final colors = context.appColors;

    return Scaffold(
      backgroundColor: colors.background,
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
                      colors.headings,
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
              child: _showText
                  ? Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Muhammed Najeeb',
                            textStyle:
                                AppTextStyles.splashTitle(context).copyWith(
                              letterSpacing: 2,
                            ),
                            speed: const Duration(milliseconds: 100),
                            cursor: '_',
                          ),
                        ],
                        totalRepeatCount: 1,
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
