import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';

import '../../../../models/leadership_activity_model.dart';

class LeadershipActivitiesCard extends StatefulWidget {
  final LeadershipActivity leadership;
  final int index;

  const LeadershipActivitiesCard({
    Key? key,
    required this.leadership,
    required this.index,
  }) : super(key: key);

  @override
  State<LeadershipActivitiesCard> createState() => _LeadershipActivitiesCardState();
}

class _LeadershipActivitiesCardState extends State<LeadershipActivitiesCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        height: 420, // Fixed height to accommodate content
        width: 400,  // Fixed width
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: isHovered ? secondaryColor.withOpacity(0.9) : secondaryColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: darkColor.withOpacity(isHovered ? 0.2 : 0.1),
                blurRadius: isHovered ? 10 : 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with Icon and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.leadership.image != null)
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondaryColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.leadership.image!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: darkColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.group,
                                color: primaryColor,
                                size: 24,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 48,
                      height: 48,
                      margin: const EdgeInsets.only(right: defaultPadding),
                      decoration: BoxDecoration(
                        color: darkColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.group,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.leadership.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.leadership.role,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (widget.leadership.organization != null) ...[
                          Text(
                            widget.leadership.organization!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                        Text(
                          widget.leadership.duration,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              // Description Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    widget.leadership.description,
                    maxLines: 6, // Limit description to 4 lines
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              // Achievements Section
              if (widget.leadership.achievements != null &&
                  widget.leadership.achievements!.isNotEmpty) ...[
                Text(
                  'Key Achievements',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                ...widget.leadership.achievements!.take(3).map( // Show only top 3 achievements
                      (achievement) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(top: 8, right: 12),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            achievement,
                            maxLines: 3, // Limit each achievement to 2 lines
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}