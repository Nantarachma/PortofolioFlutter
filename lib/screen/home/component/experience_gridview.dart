import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/experience_model.dart';
import 'package:portofolio_website/screen/home/component/experience_card.dart';

class ExperienceGridView extends StatelessWidget {
  const ExperienceGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.8, // Disesuaikan untuk konten yang lebih tinggi
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: experiences.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => ExperienceCard(
          experience: experiences[index],
        ),
      ),
    );
  }
}