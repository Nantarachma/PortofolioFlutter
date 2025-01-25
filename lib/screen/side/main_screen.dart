import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';

import '../../utils/custom_app_bar.dart';
import '../../utils/responsive.dart';
import 'component/drawer_web.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;
  // Tambahkan GlobalKey<ScaffoldState>
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        key: _scaffoldKey, // Tambahkan key di sini
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey), // Pass key ke CustomAppBar
        drawer: _buildDrawer(context),
        body: SafeArea(
            child: Center(
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                    maxHeight: screenSize.height,
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.getPadding(context) / 2,
                        vertical: Responsive.getPadding(context),
                      ),
                      child: const DrawerWeb(),
                    ),
                  ),
                Expanded(
                  flex: Responsive.isDesktop(context) ? 6 : 9,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: _getContentPadding(context, isPortrait),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: children,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  SizedBox(width: Responsive.getPadding(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Tambahkan method _buildDrawer
  Widget? _buildDrawer(BuildContext context) {
    if (Responsive.isDesktop(context)) return null;

    return Drawer(
      backgroundColor: bgColor,
      child: const DrawerWeb(),
    );
  }

  // Tambahkan method _getContentPadding
  EdgeInsets _getContentPadding(BuildContext context, bool isPortrait) {
    double horizontalPadding = Responsive.getPadding(context);
    double verticalPadding = Responsive.getPadding(context);

    if (Responsive.isDesktop(context)) {
      horizontalPadding *= 2;
      verticalPadding *= 1.5;
    } else if (Responsive.isTablet(context)) {
      horizontalPadding *= 1.5;
      verticalPadding *= 1.2;
    }

    return EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    );
  }
}