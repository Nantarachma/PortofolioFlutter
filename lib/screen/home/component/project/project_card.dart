import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/models/project_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
          minHeight: 250, // Kembali ke ukuran normal
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isHovered ? secondaryColor.withOpacity(0.9) : secondaryColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: darkColor.withOpacity(isHovered ? 0.2 : 0.1),
                blurRadius: isHovered ? 10 : 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row dengan Icon dan Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project Icon
                  if (widget.project.thumbnail != null)
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondaryColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.project.thumbnail!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: darkColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.code,
                                color: primaryColor,
                                size: 24,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: defaultPadding),
                      decoration: BoxDecoration(
                        color: darkColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.code,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),

                  // Title and Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title ?? 'Untitled Project',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        if (widget.project.createdAt != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            _formatDate(widget.project.createdAt!),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: defaultPadding),

              // Tags
              if (widget.project.tags != null && widget.project.tags!.isNotEmpty)
                SizedBox(
                  height: 32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.project.tags!
                        .map((tag) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: _buildTag(tag),
                    ))
                        .toList(),
                  ),
                ),

              const SizedBox(height: defaultPadding / 2),

              // Description
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.project.description ?? 'No description available',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: defaultPadding),

              // Action Buttons
              Row(
                children: [
                  if (widget.project.link != null)
                    Expanded(
                      child: _buildActionButton(
                        onPressed: () => _launchURL(widget.project.link),
                        icon: Icons.link,
                        label: 'View Project',
                      ),
                    ),
                  if (widget.project.link != null && widget.project.sourceCode != null)
                    const SizedBox(width: defaultPadding / 2),
                  if (widget.project.sourceCode != null)
                    Expanded(
                      child: _buildActionButton(
                        onPressed: () => _launchURL(widget.project.sourceCode),
                        icon: Icons.code,
                        label: 'Source',
                      ),
                    ),
                ],
              ),

              // Private Project Indicator
              if (!widget.project.isPublic)
                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        size: 14,
                        color: Colors.amber.withOpacity(0.7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Private Project',
                        style: TextStyle(
                          color: Colors.amber.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: primaryColor,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: darkColor,
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2,
          vertical: defaultPadding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(icon, color: primaryColor, size: 16),
      label: Text(
        label,
        style: const TextStyle(
          color: primaryColor,
          fontSize: 13,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<void> _launchURL(String? url) async {
    if (url != null && url.isNotEmpty) {
      try {
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Could not open URL'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}