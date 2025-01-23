import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/screen/main/component/skill_menu.dart';
import 'download_cv.dart';
import 'social_media.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Text(
              "More About My Skills",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultPadding),
            SkillMenu(
              hardSkills: ['Kotlin', 'Flutter', 'Node.js', 'Git', 'Python'],
            ),
            SizedBox(height: defaultPadding),
            SkillMenu(
              softSkills: ['Creative Thinking', 'Strategic Planning', 'Public Relation', 'Teamwork'],
            ),
            SizedBox(height: defaultPadding),
            SkillMenu(
              tools: ['Android Studio', 'VS Code', 'Postman', 'Figma', 'Microsoft Office', 'Google Workspace'],
            ),
            SizedBox(height: defaultPadding),
            DownloadCV(),
            SocialMedia(),
          ],
        ),
      ),
    );
  }
}