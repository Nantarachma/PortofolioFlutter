import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/utils/global_keys.dart';

import 'responsive.dart';

// NavigationButton class harus didefinisikan terlebih dahulu
class NavigationButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const NavigationButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton.icon(
        onPressed: widget.onPressed,
        icon: Icon(
          widget.icon,
          size: 20,
          color: isHovered ? primaryColor : Colors.white70,
        ),
        label: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isHovered ? primaryColor : Colors.white70,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
        ),
      ),
    );
  }
}

// Kemudian CustomAppBar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: !Responsive.isDesktop(context)
          ? IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      )
          : null,
      // Perbaikan untuk title dan actions
      title: Row(
        children: [
          if (Responsive.isDesktop(context)) ...[
            Icon(
              Icons.code,
              color: primaryColor,
              size: 24,
            ),
            const SizedBox(width: defaultPadding / 2),
            const Text(
              "Portfolio",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            // Navigation buttons untuk desktop
            NavigationButton(
              icon: Icons.work_outline,
              title: "Experience",
              onPressed: () => AppKeys.scrollToSection('experience', context),
            ),
            NavigationButton(
              icon: Icons.code,
              title: "Projects",
              onPressed: () => AppKeys.scrollToSection('projects', context),
            ),
            NavigationButton(
              icon: Icons.verified_outlined,
              title: "Certificates",
              onPressed: () => AppKeys.scrollToSection('certificates', context),
            ),
            const SizedBox(width: defaultPadding),
          ] else ...[
            // Hanya tampilkan judul untuk mobile
            const Text(
              "Portfolio",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ],
      ),
      // Actions khusus untuk mobile
      actions: !Responsive.isDesktop(context)
          ? [
        IconButton(
          icon: const Icon(Icons.work_outline),
          onPressed: () => AppKeys.scrollToSection('experience', context),
        ),
        IconButton(
          icon: const Icon(Icons.code),
          onPressed: () => AppKeys.scrollToSection('projects', context),
        ),
        IconButton(
          icon: const Icon(Icons.verified_outlined),
          onPressed: () => AppKeys.scrollToSection('certificates', context),
        ),
      ]
          : null,
    );
  }
}