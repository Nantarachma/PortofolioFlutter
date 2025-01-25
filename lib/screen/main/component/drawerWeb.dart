import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:portofolio_website/screen/main/component/my_info.dart';
import 'package:portofolio_website/screen/main/component/side_menu.dart';


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
              const SizedBox(height: defaultPadding),
              const MyInfo(), // Personal info
              const Divider(
                color: secondaryColor,
                thickness: 0.5,
                height: defaultPadding * 2,
              ),
              // Menggunakan SideMenu yang sudah ada
              const SideMenu(),
            ],
          ),
        ),
      ),
    );
  }
}