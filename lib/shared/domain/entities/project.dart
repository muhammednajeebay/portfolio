class Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String githubUrl;

  final String category;
  final String primaryColor;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.githubUrl,
    required this.category,
    required this.primaryColor,
  });
}
