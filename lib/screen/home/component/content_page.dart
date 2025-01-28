import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import '../../../utils/global_keys.dart';
import '../../../utils/responsive.dart';
import 'certificate/certificate_gridview.dart';
import 'experience/experience_gridview.dart';
import 'leadership/leadership_activities_gridview.dart';
import 'project/project_gridview.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Experience Section
              Container(
                key: AppKeys.keys['experience'], // Menggunakan AppKeys.keys
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "Experience"),
                    const SizedBox(height: defaultPadding),
                    _buildExperienceSection(context),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding * 2),

              // Projects Section
              Container(
                key: AppKeys.keys['projects'], // Menggunakan AppKeys.keys
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "My Projects"),
                    const SizedBox(height: defaultPadding),
                    _buildProjectSection(context),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding * 2),

              Container(
                key: AppKeys.keys['leadership'], // Menggunakan AppKeys.keys
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "Volunteering"),
                    const SizedBox(height: defaultPadding),
                    leadershipActivities(context),
                  ],
                ),
              ),

              const SizedBox(height: defaultPadding * 2),

              // Certificates Section
              Container(
                key: AppKeys.keys['certificates'], // Menggunakan AppKeys.keys
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle(context, "Certificates"),
                    const SizedBox(height: defaultPadding),
                    _buildCertificateSection(context),
                  ],
                ),
              ),

              // Footer spacing
              const SizedBox(height: defaultPadding * 3),
            ],
          ),
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
        childAspectRatio: 0.9,
      ),
      mobileLarge: ExperienceGridView(
        crossAxisCount: 1,
        childAspectRatio: 1,
      ),
      tablet: ExperienceGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      desktop: ExperienceGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
    );
  }

  Widget _buildProjectSection(BuildContext context) {
    return Responsive(
      mobile: ProjectGridView(
        crossAxisCount: 1,
        childAspectRatio: 0.8,
      ),
      mobileLarge: ProjectGridView(
        crossAxisCount: 1,
        childAspectRatio: 1,
      ),
      tablet: ProjectGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
      ),
      desktop: ProjectGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
    );
  }

  Widget _buildCertificateSection(BuildContext context) {
    return Responsive(
      mobile: CertificateGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.1,
      ),
      mobileLarge: CertificateGridView(
        crossAxisCount: 1,
        childAspectRatio: 1.1,
      ),
      tablet: CertificateGridView(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
      ),
      desktop: CertificateGridView(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
      ),
    );
  }
}

Widget leadershipActivities(BuildContext context) {
  return Responsive(
    mobile: LeadershipActivitiesGridView(
      crossAxisCount: 1,
      childAspectRatio: 0.4,
    ),
    tablet: LeadershipActivitiesGridView(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
    ),
    desktop: LeadershipActivitiesGridView(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
    ),
  );
}
