import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:url_launcher/url_launcher.dart';

class IconAbout extends StatefulWidget {
  final String asset;
  final String url;
  final double size;
  final Color? color;

  const IconAbout({
    Key? key,
    required this.asset,
    required this.url,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  State<IconAbout> createState() => _IconAboutState();
}

class _IconAboutState extends State<IconAbout> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL() async {
    try {
      if (await canLaunch(widget.url)) {
        await launch(widget.url);
      } else {
        throw 'Could not launch ${widget.url}';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open link: ${widget.url}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: _launchURL,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
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
              height: widget.size,
              width: widget.size,
              color: isHovered
                  ? primaryColor
                  : widget.color ?? bodyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}