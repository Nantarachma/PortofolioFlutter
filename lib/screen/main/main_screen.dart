import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:portofolio_website/screen/main/component/drawerWeb.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar hanya untuk mobile dan tablet
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: primaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        // Tambahkan title jika diperlukan
        title: Text(
          'Portfolio',
          style: TextStyle(
            color: primaryColor,
            fontSize: Responsive.getBodySize(context),
          ),
        ),
      )
          : null,
      // Drawer untuk mobile dan tablet
      drawer: Responsive.isDesktop(context)
          ? null
          : const DrawerWeb(),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxWidth),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Navigation drawer untuk desktop
                if (Responsive.isDesktop(context))
                  const Expanded(
                    flex: 2,
                    child: DrawerWeb(),
                  ),
                if (Responsive.isDesktop(context))
                  SizedBox(width: Responsive.getPadding(context)),
                // Main content
                Expanded(
                  flex: Responsive.isDesktop(context) ? 7 : 9,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context)
                            ? kMobilePadding / 2
                            : kTabletPadding / 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...children,
                          // Footer spacing
                          SizedBox(
                            height: Responsive.getPadding(context) * 2,
                          ),
                        ],
                      ),
                    ),
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
}