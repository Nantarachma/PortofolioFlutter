import 'package:flutter/material.dart';
import 'package:portofolio_website/screen/main/component/skill_section.dart';
import 'package:portofolio_website/screen/main/component/social_media.dart';

import '../../../constaint.dart';
import 'download_cv.dart';
import 'my_info.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const MyInfo(),
            const SizedBox(height: defaultPadding),
            const SkillsSection(),
            const SizedBox(height: defaultPadding),
            const DownloadCV(),
            const SocialMedia(),
          ],
        ),
      ),
    );
  }
}