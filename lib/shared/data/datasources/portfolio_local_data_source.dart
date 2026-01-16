import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/experience_model.dart';
import '../models/about_model.dart';
import '../models/hero_info_model.dart';

abstract class PortfolioLocalDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<List<SkillModel>> getSkills();
  Future<List<ExperienceModel>> getExperiences();
  Future<AboutModel> getAboutInfo();
  Future<HeroInfoModel> getHeroInfo();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    return [
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1555099962-4199c345e5dd?auto=format&fit=crop&w=1200&q=60',
        title: 'Responsive Text Plus',
        description:
            'A Flutter package to create responsive text that scales based on viewport size.',
        technologies: ['Dart', 'Flutter', 'Pub.dev'],
        githubUrl: 'https://github.com/muhammednajeebay/responsive_text',
        category: 'Package',
        primaryColor: '#00BFA5',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?auto=format&fit=crop&w=1200&q=60',
        title: 'Task Matrix',
        description:
            'A scalable task management platform built with Flutter and Supabase — designed for teams operating across multiple organizations.',
        technologies: ['Flutter', 'Supabase', 'Clean Architecture'],
        githubUrl: 'https://github.com/muhammednajeebay/taskmatrix',
        category: 'Productivity',
        primaryColor: '#6200EE',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=60',
        title: 'Flutter Portfolio',
        description:
            'A professionally architected Flutter Web application showcasing clean architecture and smooth animations.',
        technologies: ['Flutter Web', 'Clean Architecture', 'GitHub Actions'],
        githubUrl: 'https://github.com/muhammednajeebay/portfolio_',
        category: 'Portfolio',
        primaryColor: '#000000',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=60',
        title: 'ERP Software',
        description:
            'Enterprise-grade ERP covering inventory control, sales workflows, and financial accounting.',
        technologies: ['Flutter', 'REST API', 'SQL'],
        githubUrl: '',
        category: 'Business',
        primaryColor: '#1A73E8',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1501504905252-473c47e087f8?auto=format&fit=crop&w=1200&q=60',
        title: 'Learning Management System',
        description:
            'School-focused LMS featuring role-based dashboards for admins and teachers.',
        technologies: ['Flutter', 'Firebase', 'Clean Architecture'],
        githubUrl: '',
        category: 'Education',
        primaryColor: '#FBBC05',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=1200&q=60',
        title: 'Event ERP',
        description:
            'Custom ERP tailored for event management companies, enabling streamlined client handling.',
        technologies: ['Flutter', 'Provider'],
        githubUrl: '',
        category: 'Events',
        primaryColor: '#EA4335',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=1200&q=60',
        title: 'DIGIBANK',
        description:
            'Banking Application Clone with seamless financial services and REST API integration.',
        technologies: ['Flutter', 'REST API', 'Animations'],
        githubUrl: '',
        category: 'Fintech',
        primaryColor: '#34A853',
      ),
      const ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1466637574441-749b8f19452f?auto=format&fit=crop&w=1200&q=60',
        title: 'YUMMLY',
        description:
            'Recipe Recommendation App with personalized suggestions and bookmarking systems.',
        technologies: ['Flutter', 'API'],
        githubUrl: '',
        category: 'Lifestyle',
        primaryColor: '#FF5722',
      ),
    ];
  }

  // ... (keeping other methods same as they were before I modified them)
  @override
  Future<List<SkillModel>> getSkills() async {
    return const [
      SkillModel(
        name: 'Development',
        icon: FontAwesomeIcons.code,
        items: [
          'Flutter',
          'Dart',
          'Provider',
          'GetX',
          'BLoC',
          'Cubit',
          'GoRouter'
        ],
      ),
      SkillModel(
        name: 'Architecture',
        icon: FontAwesomeIcons
            .sitemap, // 'architecture' isn't in FontAwesome, using closest
        items: ['Clean Architecture', 'MVC', 'Modular Development'],
      ),
      SkillModel(
        name: 'Integration',
        icon: FontAwesomeIcons.cloud,
        items: [
          'REST API',
          'GraphQL',
          'Firebase',
          'WebSockets',
          'VideoSDK',
          'Dio'
        ],
      ),
      SkillModel(
        name: 'Data Storage',
        icon: FontAwesomeIcons.database,
        items: ['Hive', 'SharedPreferences', 'Sqflite'],
      ),
      SkillModel(
        name: 'Tools',
        icon: FontAwesomeIcons.toolbox,
        items: ['Git & GitHub', 'Postman', 'Android Studio', 'VS Code'],
      ),
    ];
  }

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    return const [
      ExperienceModel(
        company: 'NEXTEONS Software Solutions',
        role: 'Flutter Developer',
        period: 'May 2024 - Oct 2025',
        location: 'Kerala, India',
        highlights: [
          'Built a full-featured ERP software for inventory, sales, purchase, and accounts management with real-time dashboards powered by WebSocket.',
          'Developed a Learning Management System (LMS) with curriculum planning and role-based dashboards.',
          'Delivered an ERP for Event Management with booking, slot allocation, and automated financial reporting.',
          'Applied Clean Architecture & Modular Development to ensure maintainability and scalability.',
          'Used GetX & BLoC for efficient state management and GoRouter for navigation.',
          'Integrated GraphQL APIs for optimized data querying and reduced backend overhead.',
        ],
        techStack: [
          'Flutter',
          'GetX',
          'BLoC',
          'GraphQL',
          'WebSocket',
        ],
      ),
      ExperienceModel(
        company: 'Luminar TechnoHub',
        role: 'Flutter Developer Intern',
        period: 'Nov 2023 - May 2024',
        location: 'Kerala, India',
        highlights: [
          'Developed DIGIBANK (Banking App Clone) with account overview and transaction history using Provider.',
          'Created YUMMLY (Recipe App) featuring personalized recommendations and recipe uploads.',
          'Implemented Custom Clean Architecture to ensure code modularity.',
          'Integrated REST APIs and Firebase for real-time communication.',
        ],
        techStack: [
          'Flutter',
          'Provider',
          'REST API',
          'Firebase',
        ],
      ),
    ];
  }

  @override
  Future<AboutModel> getAboutInfo() async {
    return const AboutModel(
      title: 'What about me',
      descriptions: [
        "I'm Muhammed Najeeb, a Flutter Developer who builds mobile applications with a strong emphasis on clarity, structure, and long-term maintainability. I focus on creating products that feel fast, intentional, and dependable — not just visually polished, but architecturally sound.",
        "My work lives at the intersection of clean architecture and real-world usability. I've built production-grade systems including ERP platforms, learning management systems, and real-time applications, where scalability and performance aren't optional — they're requirements. I care deeply about how code evolves over time and how design decisions impact both users and developers.",
        "I value ownership, simplicity, and continuous improvement. I approach problems analytically, communicate clearly, and refine relentlessly. For me, good software is quiet — it works, it scales, and it doesn't get in the way.",
      ],
      imageUrl: 'assets/profile/najeeb_pic.PNG',
    );
  }

  @override
  Future<HeroInfoModel> getHeroInfo() async {
    return const HeroInfoModel(
      greeting: 'Hi, I am',
      name: 'Muhammed Najeeb AY',
      title: 'Flutter Developer',
      subtitle: 'Mobile & Web Applications',
      descriptionLines: [
        'I build scalable Flutter applications\nwith clean architecture,',
        'focused on performance, clarity,\nand real-world impact.',
      ],
      imageUrl: 'assets/profile/hero_img.png',
    );
  }
}
