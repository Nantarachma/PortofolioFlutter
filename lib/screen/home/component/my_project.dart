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
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200), // Maximum width constraint
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            _buildSectionTitle(context, "Experience"),
            const SizedBox(height: defaultPadding),
            _buildExperienceSection(context),
            const SizedBox(height: defaultPadding * 2),
            _buildSectionTitle(context, "My Projects"),
            const SizedBox(height: defaultPadding),
            _buildProjectSection(context),
            const SizedBox(height: defaultPadding * 2),
            _buildSectionTitle(context, "Certificates"),
            const SizedBox(height: defaultPadding),
            _buildCertificateSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    return Responsive(
      mobile: ExperienceGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.7,
      ),
      mobileLarge: ExperienceGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      tablet: ExperienceGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
      ),
      desktop: ExperienceGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.8,
      ),
    );
  }

  Widget _buildProjectSection(BuildContext context) {
    return Responsive(
      mobile: ProjectGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.5, // Card lebih tinggi untuk mobile
      ),
      mobileLarge: ProjectGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.8, // Sedikit lebih tinggi untuk tablet
      ),
      tablet: ProjectGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.8,
      ),
      desktop: ProjectGridView(
        crossAxisCount: 2, // Tetap 2 kolom
        childAspectRatio: 2, // Sedikit lebih lebar untuk desktop
      ),
    );
  }

  Widget _buildCertificateSection(BuildContext context) {
    return Responsive(
      mobile: CertificateGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.5, // More height for mobile
      ),
      mobileLarge: CertificateGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
      ),
      tablet: CertificateGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
      ),
      desktop: CertificateGridView(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
    );
  }
}