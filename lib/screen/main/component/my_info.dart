import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: secondaryColor,
        child: Column(
          children: [
            Spacer(flex: 2,),
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            Spacer(),
            Text(
              "Rachmananta Ibnu Fajar",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Text(
              "UPN Veteran Jawa Timur", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            Text(
              "Informatics", textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
