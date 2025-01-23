import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class SkillMenu extends StatelessWidget {
  const SkillMenu({
    Key? key, required this.hardSkills, required this.softSkills, required this.tools,
  }) : super(key: key);

  final List<String> hardSkills;
  final List<String> softSkills;
  final List<String> tools;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hard Skills",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: defaultPadding),
        Container(
          color: Colors.black.withOpacity(0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: hardSkills.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  hardSkills[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          "Soft Skills",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: defaultPadding),
        Container(
          color: Colors.black.withOpacity(0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: softSkills.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  softSkills[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          "Tools",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: defaultPadding),
        Container(
          color: Colors.black.withOpacity(0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
            ),
            itemCount: tools.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  tools[index],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}