import 'package:flutter/material.dart';
import 'package:portofolio_website/constant/constant.dart';
import 'package:portofolio_website/models/certificate_model.dart';

import 'certificate_card.dart';

class CertificateGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const CertificateGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: certificates.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
        ),
        itemBuilder: (context, index) => CertificateCard(
          certificate: certificates[index],
          index: index,
        ),
      ),
    );
  }
}