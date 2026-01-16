class Project {
  final String title;
  final String status;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final List<String> features;
  final Map<String, String> links;
  final String category;
  final String primaryColor;

  const Project({
    required this.title,
    required this.status,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.features,
    required this.links,
    required this.category,
    required this.primaryColor,
  });
}
