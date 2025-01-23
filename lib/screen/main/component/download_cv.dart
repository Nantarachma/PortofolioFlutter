import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCV extends StatelessWidget {
  const DownloadCV({Key? key}) : super(key: key);

  Future<void> _launchURL() async {
    const url = 'https://docs.google.com/document/d/1NUPJMhSuKkHa9q0KpZLsg4VuFLgTzP2V/edit?usp=sharing&ouid=107100240825558006264&rtpof=true&sd=true';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Download My CV",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchURL,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 20 : 24,
                vertical: Responsive.isMobile(context) ? 12 : 16,
              ),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: primaryColor.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.download_rounded,
                    color: primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  Text(
                    "Curriculum Vitae",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}