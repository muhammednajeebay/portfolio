import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/theme_cubit.dart';

class AnimatedNavbar extends StatelessWidget {
  final Function(String label) onTap;
  final bool isMobile;
  const AnimatedNavbar(
      {super.key, required this.onTap, required this.isMobile});
  @override
  Widget build(BuildContext context) {
    final labels = [
      'Home',
      'About',
      'Experience',
      'Projects',
      'Skills',
      'Contact'
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: .95),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withValues(alpha: .04),
              blurRadius: 10,
              offset: const Offset(0, 2))
        ],
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Najeeb AY',
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 1)),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        actions: isMobile
            ? null
            : [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...labels.map(
                        (label) => TextButton(
                          onPressed: () => onTap(label),
                          child: Text(label,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.brightness_6,
                            color: Theme.of(context).colorScheme.primary),
                        onPressed: () =>
                            context.read<ThemeCubit>().toggleTheme(),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ],
      ),
    );
  }
}
