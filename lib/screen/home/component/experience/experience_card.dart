import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/models/experience_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

  final Experience experience;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
          minHeight: 250,
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
              // Header with Company Logo and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Logo
                  Container(
                    width: 48,
                    height: 48,
                    margin: const EdgeInsets.only(right: defaultPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: secondaryColor,
                    ),
                    child: widget.experience.image != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.experience.image!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _buildFallbackIcon();
                        },
                      ),
                    )
                        : _buildFallbackIcon(),
                  ),
                  // Company and Role Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.experience.company,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.experience.role,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.experience.duration,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: defaultPadding),

              // Description
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.experience.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: defaultPadding),

              // Credential Button
              if (widget.experience.credentialUrl != null)
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () => _launchURL(widget.experience.credentialUrl!),
                    style: TextButton.styleFrom(
                      backgroundColor: darkColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(
                      Icons.verified,
                      color: primaryColor,
                      size: 16,
                    ),
                    label: const Text(
                      'View Credential',
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackIcon() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.business,
        color: primaryColor,
        size: 24,
      ),
    );
  }

  Future<void> _launchURL(String url) async {
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