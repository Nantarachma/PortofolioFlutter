import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's Connect",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 12 : 16,
          ),
          decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                asset: 'assets/icons/linkedin.svg',
                url: 'https://www.linkedin.com/in/nantarachma/',
                tooltip: 'LinkedIn Profile',
              ),
              const SizedBox(width: defaultPadding),
              SocialIcon(
                asset: 'assets/icons/github.svg',
                url: 'https://github.com/NantaRachma',
                tooltip: 'GitHub Profile',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialIcon extends StatefulWidget {
  final String asset;
  final String url;
  final String tooltip;

  const SocialIcon({
    Key? key,
    required this.asset,
    required this.url,
    required this.tooltip,
  }) : super(key: key);

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHovered = false;

  Future<void> _launchURL() async {
    try {
      if (await canLaunch(widget.url)) {
        await launch(widget.url);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: _launchURL,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isHovered ? primaryColor.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isHovered ? primaryColor : Colors.transparent,
                width: 1,
              ),
            ),
            child: SvgPicture.asset(
              widget.asset,
              height: 24,
              width: 24,
              color: isHovered ? primaryColor : bodyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}