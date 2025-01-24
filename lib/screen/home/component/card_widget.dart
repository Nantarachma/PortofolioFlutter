import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/project.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400, // Maximum width for better layout
          minHeight: 250, // Minimum height
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
              // Title with proper constraints
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: defaultPadding / 2),
                child: Text(
                  widget.project.title ?? 'Untitled Project',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),

              // Tags with horizontal scroll if needed
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

              // Description with scroll
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

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      onPressed: () => _launchURL(widget.project.link),
                      icon: Icons.link,
                      label: 'View Project',
                    ),
                  ),
                  if (widget.project.sourceCode != null) ...[
                    const SizedBox(width: defaultPadding / 2),
                    Expanded(
                      child: _buildActionButton(
                        onPressed: () => _launchURL(widget.project.sourceCode),
                        icon: Icons.code,
                        label: 'Source',
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
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