import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/shared/domain/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/shared/presentation/widgets/animated_header.dart';

class WritingSection extends StatelessWidget {
  final List<Article> articles;
  const WritingSection({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    if (articles.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);

    // Grid Layout
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedHeader(
          text: "Articles",
          style: theme.textTheme.headlineLarge!
              .copyWith(color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            mainAxisExtent: 200,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
          ),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return _ArticleCard(article: article, index: index);
          },
        ),
      ],
    ).animate().fade().slideY(begin: 0.2, end: 0);
  }
}

class _ArticleCard extends StatelessWidget {
  final Article article;
  final int index;

  const _ArticleCard({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: () => launchUrl(Uri.parse(article.url)),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.date,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                article.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.readTime,
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Read on Medium",
                    style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded,
                    size: 16, color: theme.colorScheme.primary),
              ],
            )
          ],
        ),
      ),
    ).animate().fade(delay: Duration(milliseconds: 100 * index));
  }
}
