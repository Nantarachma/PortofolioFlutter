import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class Skill extends StatefulWidget {
  final String name;
  final double percentage;
  final IconData? icon;

  const Skill({
    Key? key,
    required this.name,
    required this.percentage,
    this.icon, String? description,
  }) : super(key: key);

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> with SingleTickerProviderStateMixin {
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
      end: widget.percentage,
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 16,
                  color: primaryColor,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
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
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(2),
            ),
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Contoh penggunaan:
class SkillExample extends StatelessWidget {
  const SkillExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Skill(
          name: "Flutter",
          percentage: 0.85,
          icon: Icons.flutter_dash,
        ),
        Skill(
          name: "Dart",
          percentage: 0.80,
          icon: Icons.code,
        ),
        Skill(
          name: "Firebase",
          percentage: 0.75,
          icon: Icons.fireplace,
        ),
      ],
    );
  }
}