import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatelessWidget {
  final List<Map<String, String>> experiences;

  const Experience({
    Key? key,
    required this.experiences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: experiences.map((experience) {
        return Card(
          child: ListTile(
            title: Text(experience['company']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(experience['role']!),
                Text(experience['duration']!),
                if (experience['credentialUrl']!.isNotEmpty)
                  TextButton(
                    onPressed: () async {
                      final url = experience['credentialUrl']!;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text('View Credential'),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}