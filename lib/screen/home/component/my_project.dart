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
              child: ExperienceGridView(crossAxisCount: 1, childAspectRatio: 1.7),
            ),
            mobileLarge: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(crossAxisCount: 2),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(childAspectRatio: 1.1),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ExperienceGridView(),
            ),
          ),
          SizedBox(height: defaultPadding),
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
              child: ProjectGridView(crossAxisCount: 1, childAspectRatio: 1.7),
            ),
            mobileLarge: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(crossAxisCount: 2),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(childAspectRatio: 1.1),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: ProjectGridView(),
            ),
          ),
          SizedBox(height: defaultPadding),
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
              child: CertificateGridView(crossAxisCount: 2),
            ),
            tablet: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(childAspectRatio: 1.1),
            ),
            desktop: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: CertificateGridView(),
            ),
          ),
        ],
      ),
    );
  }
}