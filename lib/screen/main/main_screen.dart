import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:portofolio_website/screen/main/component/drawerWeb.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: _buildAppBar(context),
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
                // Desktop Navigation Drawer
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

                // Main Content
                Expanded(
                  flex: Responsive.isDesktop(context) ? 7 : 9,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: _getContentPadding(context, isPortrait),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...children,
                              _buildFooterSpacing(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Optional right sidebar for desktop
                if (Responsive.isDesktop(context))
                  SizedBox(width: Responsive.getPadding(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    if (Responsive.isDesktop(context)) return null;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      toolbarHeight: Responsive.isTallScreen(context) ? 70 : 56,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.menu,
            color: primaryColor,
            size: Responsive.getIconSize(context),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              color: primaryColor,
              fontSize: Responsive.getHeadingSize(context) * 0.7,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (Responsive.isTallScreen(context))
            Text(
              'Welcome to my portfolio',
              style: TextStyle(
                color: bodyTextColor,
                fontSize: Responsive.getBodySize(context) * 0.8,
              ),
            ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.light_mode,
            color: primaryColor,
            size: Responsive.getIconSize(context),
          ),
          onPressed: () {
            // Implement theme switching
          },
        ),
        SizedBox(width: Responsive.getPadding(context) / 2),
      ],
    );
  }

  Widget? _buildDrawer(BuildContext context) {
    if (Responsive.isDesktop(context)) return null;

    return Drawer(
      backgroundColor: bgColor,
      child: const DrawerWeb(),
    );
  }

  EdgeInsets _getContentPadding(BuildContext context, bool isPortrait) {
    double horizontalPadding = Responsive.getPadding(context);
    double verticalPadding = Responsive.getPadding(context);

    if (Responsive.isTallScreen(context)) {
      horizontalPadding *= 1.2;
      verticalPadding *= 1.5;
    }

    if (!isPortrait) {
      horizontalPadding *= 1.5;
      verticalPadding *= 0.8;
    }

    return EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: verticalPadding,
    );
  }

  Widget _buildFooterSpacing(BuildContext context) {
    double spacing = Responsive.getPadding(context) * 2;

    if (Responsive.isTallScreen(context)) {
      spacing *= 1.5;
    }

    return SizedBox(height: spacing);
  }
}