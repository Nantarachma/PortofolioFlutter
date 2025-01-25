import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/responsive.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context)
            ? kMobilePadding
            : kTabletPadding,
        vertical: defaultPadding,
      ),
      decoration: BoxDecoration(
        color: secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Text(
            "Rachmananta Ibnu Fajar",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultPadding / 2),
          Text(
            "UPN Veteran Jawa Timur",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: bodyTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultPadding / 2),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 4,
            ),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Informatics",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}