import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Certificate extends StatelessWidget {
  final List<Map<String, String>> certificates;

  const Certificate({
    Key? key,
    required this.certificates,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: certificates.map((certificate) {
        return Card(
          child: ListTile(
            title: Text(certificate['title']!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(certificate['issuer']!),
                Text(certificate['date']!),
                if (certificate['credentialUrl']!.isNotEmpty)
                  TextButton(
                    onPressed: () async {
                      final url = certificate['credentialUrl']!;
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