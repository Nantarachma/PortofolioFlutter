import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/experience_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExperienceCard extends StatefulWidget {
  final Experience experience;

  const ExperienceCard({Key? key, required this.experience}) : super(key: key);

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
            // Company Name
            Text(
              widget.experience.company,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),

            // Role
            Text(
              widget.experience.role,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            // Duration
            Text(
              widget.experience.duration,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[400],
              ),
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

            // Credential Button
            if (widget.experience.credentialUrl != null) ...[
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () async {
                    final url = widget.experience.credentialUrl!;
                    try {
                      if (await canLaunchUrlString(url)) {
                        await launchUrlString(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error opening URL: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
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
                  icon: const Icon(Icons.verified, color: primaryColor, size: 20),
                  label: const Text(
                    "View Credential",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}