// lib/screen/side/component/skill_set.dart
import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'download_cv.dart';
import 'my_info.dart';
import 'social_media.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MyInfo(),
                const Divider(
                  color: secondaryColor,
                  thickness: 0.5,
                  height: defaultPadding * 2,
                ),
                Text(
                  "Skills & Expertise",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: defaultPadding),
                // Technical Skills
                SkillCategory(
                  title: "Technical Skills",
                  skills: [
                    Skill(name: "Flutter", percentage: 0.80),
                    Skill(name: "Kotlin", percentage: 0.85),
                    Skill(name: "Node.js", percentage: 0.75),
                    Skill(name: "Git", percentage: 0.90),
                    Skill(name: "Python", percentage: 0.70),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                // Soft Skills
                SkillCategory(
                  title: "Soft Skills",
                  skills: [
                    Skill(name: "Creative Thinking", percentage: 0.85),
                    Skill(name: "Strategic Planning", percentage: 0.95),
                    Skill(name: "Public Relations", percentage: 0.90),
                    Skill(name: "Teamwork", percentage: 0.85),
                  ],
                ),
                const SizedBox(height: defaultPadding),
                // Tools
                SkillCategory(
                  title: "Tools & Technologies",
                  skills: [
                    Skill(name: "Android Studio", percentage: 0.95),
                    Skill(name: "VS Code", percentage: 0.90),
                    Skill(name: "Postman", percentage: 0.80),
                    Skill(name: "Figma", percentage: 0.90),
                    Skill(name: "Microsoft Office", percentage: 0.90),
                    Skill(name: "Google Workspace", percentage: 0.95),
                  ],
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            const DownloadCV(),
            const SizedBox(height: defaultPadding),
            const SocialMedia(),
          ],
        ),
      ),
    );
  }
}

// Skill Model
class Skill {
  final String name;
  final double percentage;
  final IconData? icon;

  Skill({
    required this.name,
    required this.percentage,
    this.icon,
  });
}

// SkillCategory Widget
class SkillCategory extends StatelessWidget {
  final String title;
  final List<Skill> skills;

  const SkillCategory({
    Key? key,
    required this.title,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        ...skills.map((skill) => SkillItem(skill: skill)).toList(),
      ],
    );
  }
}

// SkillItem Widget
class SkillItem extends StatefulWidget {
  final Skill skill;

  const SkillItem({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.skill.percentage,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.skill.icon != null) ...[
                Icon(widget.skill.icon, size: 16, color: primaryColor),
                const SizedBox(width: 8),
              ],
              Text(
                widget.skill.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    '${(_animation.value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _animation.value,
                backgroundColor: primaryColor.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
              );
            },
          ),
        ],
      ),
    );
  }
}