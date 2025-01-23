import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class SkillMenu extends StatelessWidget {
  const SkillMenu({
    Key? key, this.hardSkills = const [], this.softSkills = const [], this.tools = const [],
  }) : super(key: key);

  final List<String> hardSkills;
  final List<String> softSkills;
  final List<String> tools;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (hardSkills.isNotEmpty) ...[
          Text(
            "Hard Skills",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: defaultPadding),
          _buildSkillGrid(context, hardSkills),
          SizedBox(height: defaultPadding),
        ],
        if (softSkills.isNotEmpty) ...[
          Text(
            "Soft Skills",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: defaultPadding),
          _buildSkillGrid(context, softSkills),
          SizedBox(height: defaultPadding),
        ],
        if (tools.isNotEmpty) ...[
          Text(
            "Tools",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(height: defaultPadding),
          _buildSkillGrid(context, tools),
          SizedBox(height: defaultPadding),
        ],
      ],
    );
  }

  Widget _buildSkillGrid(BuildContext context, List<String> skills) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: skills.length.isOdd ? skills.length - 1 : skills.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black.withOpacity(0.5)),
                    right: BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                child: Center(
                  child: Text(
                    skills[index],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            },
          ),
          if (skills.length.isOdd)
            SizedBox(
              height: 48.0, // Set the height to match the other rows
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                child: Center(
                  child: Text(
                    skills.last,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}