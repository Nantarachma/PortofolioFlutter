// lib/widgets/skills_section.dart
import 'package:flutter/material.dart';
import 'package:portofolio_website/models/skill_model.dart';
import 'package:portofolio_website/screen/main/component/skill.dart';
import '../../../constaint.dart';
import '../../../models/skills_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkillCategory(
          context: context,
          title: "Technical Skills",
          skills: SkillsData.technicalSkills,
        ),
        const SizedBox(height: defaultPadding * 2),
        _buildSkillCategory(
          context: context,
          title: "Soft Skills",
          skills: SkillsData.softSkills,
        ),
        const SizedBox(height: defaultPadding * 2),
        _buildSkillCategory(
          context: context,
          title: "Tools & Technologies",
          skills: SkillsData.tools,
        ),
      ],
    );
  }

  Widget _buildSkillCategory({
    required BuildContext context,
    required String title,
    required List<SkillModel> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        ...skills.map((skill) => Skill(
          name: skill.name,
          percentage: skill.percentage,
          icon: skill.icon,
          description: skill.description,
        )).toList(),
      ],
    );
  }
}