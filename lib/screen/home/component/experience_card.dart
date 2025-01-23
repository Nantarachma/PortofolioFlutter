import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/experience_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({Key? key, required this.experience}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            experience.role,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            experience.duration,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            experience.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5),
          ),
          Spacer(),
          if (experience.credentialUrl != null)
            TextButton(
              onPressed: () async {
                final url = experience.credentialUrl!;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: darkColor,
              ),
              child: Text(
                "View Credential >>",
                style: TextStyle(color: primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}