import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:portofolio_website/screen/home/component/project_gridview.dart';
import 'experience_gridview.dart';
import 'certificate_gridview.dart';

class MyProject extends StatelessWidget {
  const MyProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPadding),
          Text(
            "Experience",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Responsive(
            mobile: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(crossAxisCount: 1, childAspectRatio: 1.0),
            ),
            mobileLarge: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(crossAxisCount: 2, childAspectRatio: 1.3),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(crossAxisCount: 2, childAspectRatio: 1.5),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(crossAxisCount: 2, childAspectRatio: 2),
            ),
          ),
          SizedBox(height: defaultPadding),
          Text(
            "My Projects",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Responsive(
            mobile: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(crossAxisCount: 1, childAspectRatio: 1.5),
            ),
            mobileLarge: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(crossAxisCount: 2, childAspectRatio: 1.5),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(crossAxisCount: 2, childAspectRatio: 1.7),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(crossAxisCount: 2, childAspectRatio: 2.5),
            ),
          ),
          SizedBox(height: defaultPadding),
          Text(
            "Certificates",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Responsive(
            mobile: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(crossAxisCount: 1, childAspectRatio: 1.7),
            ),
            mobileLarge: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(crossAxisCount: 2, childAspectRatio: 1.5),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(crossAxisCount: 3, childAspectRatio: 1.1),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(crossAxisCount: 4, childAspectRatio: 1.0),
            ),
          ),
        ],
      ),
    );
  }
}