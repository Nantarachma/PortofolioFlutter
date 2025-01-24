import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Experience extends StatelessWidget {
  final List<Map<String, String>> experiences;

  const Experience({
    Key? key,
    required this.experiences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      // Mobile view - single column dengan card yang lebih tinggi
      mobile: ExperienceGrid(
        experiences: experiences,
        crossAxisCount: 1,
        childAspectRatio: 0.7, // Mengubah dari 1.2 menjadi 0.7 untuk card yang lebih tinggi
      ),
      // Tablet - 2 columns
      tablet: ExperienceGrid(
        experiences: experiences,
        crossAxisCount: 2,
        childAspectRatio: 0.75, // Mengubah dari 1.1 menjadi 0.75
      ),
      // Desktop - 3 columns
      desktop: ExperienceGrid(
        experiences: experiences,
        crossAxisCount: 2,
        childAspectRatio: 0.75, // Mengubah dari 1.0 menjadi 0.8
      ),
    );
  }
}

class ExperienceGrid extends StatelessWidget {
  final List<Map<String, String>> experiences;
  final int crossAxisCount;
  final double childAspectRatio;

  const ExperienceGrid({
    Key? key,
    required this.experiences,
    required this.crossAxisCount,
    required this.childAspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
        ),
        itemCount: experiences.length,
        itemBuilder: (context, index) => ExperienceCard(
          experience: experiences[index],
        ),
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final Map<String, String> experience;

  const ExperienceCard({
    Key? key,
    required this.experience,
  }) : super(key: key);

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
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: darkColor.withOpacity(isHovered ? 0.2 : 0.1),
              blurRadius: isHovered ? 12 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company and Duration
            Text(
              widget.experience['company'] ?? '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: defaultPadding / 2),

            // Duration
            Text(
              widget.experience['duration'] ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),

            // Role
            Text(
              widget.experience['role'] ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: defaultPadding),

            // Description
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.experience['description'] ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            // Credential Button
            if (widget.experience['credentialUrl']?.isNotEmpty ?? false) ...[
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () => _launchCredential(context),
                  color: darkColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding / 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.verified,
                        color: primaryColor,
                        size: 20,
                      ),
                      SizedBox(width: defaultPadding / 2),
                      Text(
                        'View Credential',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _launchCredential(BuildContext context) async {
    final url = widget.experience['credentialUrl']!;
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
  }
}