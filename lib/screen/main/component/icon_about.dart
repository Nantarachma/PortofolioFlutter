import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class IconAbout extends StatelessWidget {
  final String asset;
  final String url;
  final Color color;

  const IconAbout({
    Key? key,
    required this.asset,
    required this.url,
    this.color = Colors.white, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        asset,
        color: color, // Set the color here
      ),
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
    );
  }
}