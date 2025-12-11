import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/article_model.dart';

abstract class PortfolioLocalDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<List<ProjectModel>> getOpenSourceProjects();
  Future<List<SkillModel>> getSkills();
  Future<List<ExperienceModel>> getExperiences();
  Future<List<ArticleModel>> getArticles();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    return const [
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?auto=format&fit=crop&w=1200&q=60', // Task Matrix placeholder
        title: 'Task Matrix (In Progress)',
        description:
            'A scalable task management platform built with Flutter and Supabase — designed for teams operating across multiple organizations. It balances real-time collaboration, gamified productivity, and clean architecture principles.',
        technologies: [
          'Flutter',
          'Supabase',
          'BLoC',
          'GoRouter',
          'Clean Architecture'
        ],
        githubUrl: 'https://github.com/muhammednajeebay/taskmatrix',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=60', // Portfolio
        title: 'Flutter Portfolio',
        description:
            'A professionally architected Flutter Web application showcasing clean architecture, smooth animations, and automated CI/CD workflows with GitHub Actions deployment.',
        technologies: [
          'Flutter Web',
          'Clean Architecture',
          'flutter_bloc',
          'GitHub Actions'
        ],
        githubUrl: 'https://github.com/muhammednajeebay/portfolio_',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1556742049-0cfed4f7a07d?auto=format&fit=crop&w=1200&q=60', // ERP
        title: 'ERP Software',
        description:
            'Enterprise-grade ERP covering inventory control, sales workflows, purchase cycles, and financial accounting — designed for high reliability and smooth multi-department operations.',
        technologies: ['Flutter', 'GetX', 'GraphQL', 'WebSocket'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1501504905252-473c47e087f8?auto=format&fit=crop&w=1200&q=60', // LMS
        title: 'Learning Management System',
        description:
            'School-focused LMS featuring role-based dashboards for admins and teachers, complete with attendance tracking, assignments, grading, and exam management.',
        technologies: ['Flutter', 'BLoC', 'GraphQL'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=1200&q=60', // Event ERP
        title: 'Event ERP',
        description:
            'Custom ERP tailored for event management companies, enabling streamlined client handling, vendor coordination, budgeting, and real-time event workflow tracking.',
        technologies: ['Flutter', 'BLoC', 'GraphQL'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=1200&q=60', // Digibank
        title: 'DIGIBANK',
        description:
            'Banking Application Clone with seamless financial services. Features account overview, detailed transaction history, and seamless REST API integration.',
        technologies: ['Flutter', 'Provider', 'REST API'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1466637574441-749b8f19452f?auto=format&fit=crop&w=1200&q=60', // Yummly
        title: 'YUMMLY',
        description:
            'Recipe Recommendation App with personalized suggestions, user uploads, and bookmarking systems.',
        technologies: ['Flutter', 'Provider', 'REST API'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1200&q=60', // Placement
        title: 'Placement Assistance App',
        description:
            'Platform connecting companies, students, and administrators with job posting and application tracking.',
        technologies: ['Flutter', 'Provider', 'REST API'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1504711434969-e33886168f5c?auto=format&fit=crop&w=1200&q=60', // News Hunt
        title: 'News Hunt',
        description:
            'Up-to-date news article aggregator fetching real-time data from newsapi.org with categorized browsing.',
        technologies: ['Flutter', 'Provider', 'REST API'],
        githubUrl: '',
      ),
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1606326608606-aa0b62935f2b?auto=format&fit=crop&w=1200&q=60', // Quiz App
        title: 'Quiz App',
        description:
            'Self-assessment knowledge testing application with dynamic content and score tracking.',
        technologies: ['Flutter', 'Provider', 'REST API'],
        githubUrl: '',
      ),
    ];
  }

  @override
  Future<List<ProjectModel>> getOpenSourceProjects() async {
    return const [
      ProjectModel(
        imageUrl:
            'https://images.unsplash.com/photo-1555099962-4199c345e5dd?auto=format&fit=crop&w=1200&q=60',
        title: 'Responsive Text Plus',
        description:
            'A Flutter package that dynamically scales text size based on screen or container dimensions, ensuring perfect readability and design consistency across devices.',
        technologies: [
          'Flutter',
          'Dart',
          'Pub.dev',
        ],
        githubUrl: 'https://github.com/muhammednajeebay/responsive_text',
      ),
    ];
  }

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
  Future<List<ArticleModel>> getArticles() async {
    return const [
      // Placeholder articles linking to profile
      ArticleModel(
        title: 'Check out my articles on Medium',
        summary:
            'I write about Flutter architecture, performance, and best practices. Click to read my latest stories.',
        url: 'https://medium.com/@muhammednajeeb.ay',
        readTime: 'View Profile',
        date: 'Ongoing',
      ),
    ];
  }
}
