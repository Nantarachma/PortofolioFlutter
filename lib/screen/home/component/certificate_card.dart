import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/certificate_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateCard extends StatelessWidget {
  final Certificate certificate;

  const CertificateCard({Key? key, required this.certificate}) : super(key: key);

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
            certificate.title,
            maxLines: 3,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            certificate.issuer,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(height: 1.5),
          ),
          Text(
            certificate.date,
            maxLines: 1,
            overflow: TextOverflow.visible,
            style: TextStyle(height: 1.5),
          ),
          Spacer(),
          if (certificate.credentialUrl != null)
            TextButton(
              onPressed: () async {
                final url = certificate.credentialUrl!;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
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