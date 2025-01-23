// lib/data/skills_data.dart
import 'package:flutter/material.dart';
import 'package:portofolio_website/models/skill_model.dart';

class SkillsData {
  static List<SkillModel> technicalSkills = [
    SkillModel(
      name: "Flutter",
      percentage: 0.85,
      icon: Icons.flutter_dash,
      description: "Cross-platform app development",
      category: 'technical',
    ),
    SkillModel(
      name: "Kotlin",
      percentage: 0.80,
      icon: Icons.android,
      description: "Native Android development",
      category: 'technical',
    ),
    SkillModel(
      name: "Node.js",
      percentage: 0.75,
      icon: Icons.code,
      description: "Backend development",
      category: 'technical',
    ),
    SkillModel(
      name: "Git",
      percentage: 0.85,
      icon: Icons.source,
      description: "Version control",
      category: 'technical',
    ),
    SkillModel(
      name: "Python",
      percentage: 0.70,
      icon: Icons.code,
      description: "Data processing & automation",
      category: 'technical',
    ),
  ];

  static List<SkillModel> softSkills = [
    SkillModel(
      name: "Creative Thinking",
      percentage: 0.90,
      icon: Icons.lightbulb_outline,
      category: 'soft',
    ),
    SkillModel(
      name: "Strategic Planning",
      percentage: 0.85,
      icon: Icons.assessment,
      category: 'soft',
    ),
    SkillModel(
      name: "Public Relations",
      percentage: 0.80,
      icon: Icons.people,
      category: 'soft',
    ),
    SkillModel(
      name: "Teamwork",
      percentage: 0.95,
      icon: Icons.group_work,
      category: 'soft',
    ),
  ];

  static List<SkillModel> tools = [
    SkillModel(
      name: "Android Studio",
      percentage: 0.85,
      icon: Icons.android,
      category: 'tools',
    ),
    SkillModel(
      name: "VS Code",
      percentage: 0.90,
      icon: Icons.code,
      category: 'tools',
    ),
    SkillModel(
      name: "Postman",
      percentage: 0.80,
      icon: Icons.send,
      category: 'tools',
    ),
    SkillModel(
      name: "Figma",
      percentage: 0.75,
      icon: Icons.design_services,
      category: 'tools',
    ),
    SkillModel(
      name: "Microsoft Office",
      percentage: 0.85,
      icon: Icons.article,
      category: 'tools',
    ),
    SkillModel(
      name: "Google Workspace",
      percentage: 0.85,
      icon: Icons.cloud,
      category: 'tools',
    ),
  ];
}