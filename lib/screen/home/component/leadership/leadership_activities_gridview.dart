import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';
import '../../../../models/leadership_activity_model.dart';
import 'leadership_activities_card.dart';

class LeadershipActivitiesGridView extends StatelessWidget {
  const LeadershipActivitiesGridView({
    Key? key,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.7,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: leadershipActivities.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => LeadershipActivitiesCard(
        leadership: leadershipActivities[index],
        index: index,
      ),
    );
  }
}