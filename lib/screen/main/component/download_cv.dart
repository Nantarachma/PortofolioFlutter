import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadCV extends StatelessWidget {
  const DownloadCV({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async{
        const url = 'https://docs.google.com/document/d/1NUPJMhSuKkHa9q0KpZLsg4VuFLgTzP2V/edit?usp=sharing&ouid=107100240825558006264&rtpof=true&sd=true';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
      },
      child: FittedBox(
        child: Row(
          children: [
            Text(
              "Curriculum Vitae",
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
          ],
        ),
      ),
    );
  }
}