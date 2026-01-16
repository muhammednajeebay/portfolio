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
        title: 'Task Matrix',
        status: 'in-progress',
        description:
            'A scalable task management platform built with Flutter and Supabase — designed for teams operating across multiple organizations. It balances real-time collaboration, gamified productivity, and clean architecture principles to ensure maintainability and performance.',
        imageUrl:
            'https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?auto=format&fit=crop&w=1200&q=60',
        technologies: [
          'Flutter',
          'Dart',
          'Supabase',
          'BLoC',
          'GoRouter',
          'Clean Architecture'
        ],
        features: [
          'Implements modular architecture using feature-specific BLoCs',
          'Secure authentication, role management, and real-time updates via Supabase',
          'Task points, leaderboards, and progress tracking for team motivation'
        ],
        links: {'github': 'https://github.com/muhammednajeebay/taskmatrix'},
        category: 'Productivity',
        primaryColor: '#6200EE',
      ),
      const ProjectModel(
        title: 'Responsive Text Plus',
        status: 'published',
        description:
            'A Flutter package that dynamically scales text size based on screen or container dimensions, ensuring perfect readability and design consistency across devices.',
        imageUrl:
            'https://images.unsplash.com/photo-1555099962-4199c345e5dd?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Dart', 'Pub.dev', 'Open Source'],
        features: [
          'Auto-adjusts font size within defined min/max limits',
          'Supports rich text and multi-line scaling',
          'Optimized for performance on mobile, web, and desktop',
          'Provides fluid typography and overflow handling options'
        ],
        links: {
          'pub': 'https://pub.dev/packages/responsive_text_plus',
          'github': 'https://github.com/muhammednajeebay/responsive_text'
        },
        category: 'Package',
        primaryColor: '#00BFA5',
      ),
      const ProjectModel(
        title: 'Flutter Portfolio ',
        status: 'live',
        description:
            'A professionally architected Flutter Web application showcasing clean architecture, smooth animations, and automated CI/CD workflows with GitHub Actions deployment.',
        imageUrl:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=60',
        technologies: [
          'Flutter Web',
          'Clean Architecture',
          'flutter_bloc',
          'go_router',
          'GitHub Actions'
        ],
        features: [
          'Clean Architecture with domain-driven design and repository pattern',
          'BLoC-based theme management with light/dark mode inversion',
          'Hash-based deep linking with go_router',
          'Automated testing and deployment pipeline via GitHub Actions',
          '60fps performance with optimized rendering and motion background'
        ],
        links: {
          'live': 'https://muhammednajeebay.github.io/portfolio/',
          'github': 'https://github.com/muhammednajeebay/portfolio'
        },
        category: 'Portfolio',
        primaryColor: '#FBBC05',
      ),
      const ProjectModel(
        title: 'ERP Software',
        status: 'confidential',
        description:
            'Enterprise-grade ERP covering inventory control, sales workflows, purchase cycles, and financial accounting — designed for high reliability and smooth multi-department operations.',
        imageUrl:
            'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=1200&q=60',
        technologies: [
          'Flutter',
          'Dart',
          'GetX',
          'GoRouter',
          'GraphQL',
          'WebSocket'
        ],
        features: [
          'Live dashboards with WebSocket for real-time stock & financial data',
          'Automated reporting modules for decision-making',
          'Inventory, sales, purchase, and accounts tracking',
          'Role-based access for different user levels'
        ],
        links: {},
        category: 'Business',
        primaryColor: '#1A73E8',
      ),
      const ProjectModel(
        title: 'Learning Management System (LMS)',
        status: 'confidential',
        description:
            'School-focused LMS featuring role-based dashboards for admins, teachers, complete with attendance tracking, assignments, grading, and exam management.',
        imageUrl:
            'https://images.unsplash.com/photo-1501504905252-473c47e087f8?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Dart', 'BLoC', 'GoRouter', 'GraphQL'],
        features: [
          'Curriculum planning & teacher assignments',
          'Exam management with high concurrent usage support',
          'Role-based dashboards for teachers, students, and admins',
          'Efficient data querying with GraphQL'
        ],
        links: {},
        category: 'Education',
        primaryColor: '#FBBC05',
      ),
      const ProjectModel(
        title: 'Event ERP',
        status: 'confidential',
        description:
            'Custom ERP tailored for event management companies, enabling streamlined client handling, vendor coordination, budgeting, and real-time event workflow tracking.',
        imageUrl:
            'https://images.unsplash.com/photo-1511578314322-379afb476865?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Dart', 'BLoC', 'GraphQL', 'GoRouter'],
        features: [
          'Booking & slot allocation management',
          'Facility usage tracking',
          'Financial reporting with automated workflows',
          'Enhanced UI workflows for faster staff productivity'
        ],
        links: {},
        category: 'Events',
        primaryColor: '#EA4335',
      ),
      const ProjectModel(
        title: 'DIGIBANK',
        status: 'completed',
        description:
            'Banking Application Clone with seamless financial services.',
        imageUrl:
            'https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Provider', 'Clean Architecture', 'REST API'],
        features: [
          'Account overview with balance and transaction details',
          'Detailed transaction history tracking',
          'Custom clean architecture implementation',
          'API integration using REST',
          'State management using Provider'
        ],
        links: {'github': 'https://github.com/muhammednajeebay'},
        category: 'Fintech',
        primaryColor: '#34A853',
      ),
      const ProjectModel(
        title: 'YUMMLY',
        status: 'completed',
        description: 'Recipe Recommendation App with personalized suggestions.',
        imageUrl:
            'https://images.unsplash.com/photo-1466637574441-749b8f19452f?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Provider', 'REST API'],
        features: [
          'Popular recipe showcase',
          'User recipe upload functionality',
          'Recipe bookmarking system',
          'API integration for live data'
        ],
        links: {'github': 'https://github.com/muhammednajeebay'},
        category: 'Lifestyle',
        primaryColor: '#FF5722',
      ),
      const ProjectModel(
        title: 'Placement Assistance App',
        status: 'completed',
        description:
            'Platform connecting companies, students, and administrators.',
        imageUrl:
            'https://images.unsplash.com/photo-1501504905252-473c47e087f8?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Provider', 'REST API'],
        features: [
          'Company job posting functionality',
          'Student application system',
          'Admin monitoring dashboard',
          'Role-based access controls'
        ],
        links: {'github': 'https://github.com/muhammednajeebay'},
        category: 'Education',
        primaryColor: '#FBBC05',
      ),
      const ProjectModel(
        title: 'News Hunt',
        status: 'completed',
        description: 'Up-to-date news article aggregator application.',
        imageUrl:
            'https://images.unsplash.com/photo-1555099962-4199c345e5dd?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Provider', 'REST API'],
        features: [
          'Real-time news fetching from newsapi.org',
          'Categorized news browsing',
          'Bookmarking feature',
          'Responsive article layout'
        ],
        links: {'github': 'https://github.com/muhammednajeebay'},
        category: 'News',
        primaryColor: '#1A73E8',
      ),
      const ProjectModel(
        title: 'Quiz App',
        status: 'completed',
        description: 'Self-assessment knowledge testing application.',
        imageUrl:
            'https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?auto=format&fit=crop&w=1200&q=60',
        technologies: ['Flutter', 'Provider', 'REST API'],
        features: [
          'Dynamic quiz content fetched from API',
          'Interactive quiz interface',
          'Score tracking and results',
          'State management using Provider'
        ],
        links: {'github': 'https://github.com/muhammednajeebay'},
        category: 'Education',
        primaryColor: '#FBBC05',
      ),
    ];
  }

  // ... (keeping other methods same as they were before I modified them)
  @override
  Future<List<SkillModel>> getSkills() async {
    return const [
      SkillModel(
        name: 'Core Stack',
        description: 'Production-ready Flutter development',
        items: [
          'Flutter',
          'Dart',
          'BLoC',
          'GoRouter',
          'GetX',
          'Provider',
          'Cubit'
        ],
      ),
      SkillModel(
        name: 'Architecture',
        description: 'Designed for scalability',
        items: ['Clean Architecture', 'Modular Design', 'MVC'],
      ),
      SkillModel(
        name: 'State & Data',
        description: 'Predictable state and persistence',
        items: ['Hive', 'SQLite', 'SharedPreferences'],
      ),
      SkillModel(
        name: 'Networking',
        description: 'Real-time and API-driven apps',
        items: [
          'REST',
          'GraphQL',
          'WebSockets',
          'Firebase',
          'Supabase',
          'Dio',
          'Http'
        ],
      ),
      SkillModel(
        name: 'Tooling',
        description: 'Professional dev workflow',
        items: ['Git', 'GitHub', 'Postman', 'VS Code', 'FVM', 'Android Studio'],
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
        "I build Flutter applications focused on structure, clarity, and long-term maintainability.",
        "I’m Muhammed Najeeb, a Flutter Developer working on production-grade systems including ERP platforms, learning management systems, and real-time applications. My focus is on clean architecture and dependable performance in real-world environments.",
        "Clean architecture over shortcuts\nScalability before polish\nCode that stays readable over time",
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
