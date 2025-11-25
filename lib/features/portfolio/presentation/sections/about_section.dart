import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 500.ms),
        MoveEffect(duration: 500.ms, begin: const Offset(0, 32))
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Me",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundImage: AssetImage('assets/profile/najeeb_pic.PNG'),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Text(
                  '''Hi, I'm Najeeb, a Flutter Developer and Mobile App Engineer who loves crafting fast, scalable, and user-focused products that feel thoughtful from the first interaction to the last delivery.

My expertise spans state management, API-driven development, animations, and platform integrations. I obsess over clean architecture and maintainable code so solutions stay elegant and sustainable as they grow.

I thrive on continuous learning, constructive feedback, and pragmatic problem-solving while keeping long-term scalability in mind. Let's build seamless experiences together.''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 19),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
