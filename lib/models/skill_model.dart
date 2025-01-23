// lib/models/skill_model.dart
import 'package:flutter/material.dart';

class SkillModel {
  final String name;
  final double percentage;
  final IconData? icon;
  final String? description;
  final String category; // 'technical', 'soft', atau 'tools'

  const SkillModel({
    required this.name,
    required this.percentage,
    this.icon,
    this.description,
    required this.category,
  });
}