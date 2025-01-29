import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';

import '../../../utils/responsive.dart';
import 'content/skill_set.dart';


class DrawerWeb extends StatelessWidget {
  const DrawerWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      elevation: Responsive.isDesktop(context) ? 0 : 2,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context)
                ? kMobilePadding
                : kTabletPadding,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            border: Responsive.isDesktop(context)
                ? Border(
              right: BorderSide(
                color: secondaryColor.withOpacity(0.15),
                width: 1,
              ),
            )
                : null,
          ),
          child: Column(
            children: [
              const SideMenu(),
            ],
          ),
        ),
      ),
    );
  }
}