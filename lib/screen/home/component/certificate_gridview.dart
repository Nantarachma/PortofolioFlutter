import 'package:flutter/material.dart';
import 'package:portofolio_website/constaint.dart';
import 'package:portofolio_website/models/certificate_model.dart';
import 'package:portofolio_website/responsive.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Certificates & Achievements",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        const Responsive(
          mobile: CertificateGridView(
            crossAxisCount: 1,
            childAspectRatio: 1.5,
          ),
          mobileLarge: CertificateGridView(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
          ),
          tablet: CertificateGridView(
            crossAxisCount: 2,
            childAspectRatio: 1.7,
          ),
          desktop: CertificateGridView(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
        ),
      ],
    );
  }
}

class CertificateGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const CertificateGridView({
    Key? key,
    this.crossAxisCount = 2,
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

class CertificateCard extends StatefulWidget {
  final Certificate certificate;
  final int index;

  const CertificateCard({
    Key? key,
    required this.certificate,
    required this.index,
  }) : super(key: key);

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool isHovered = false;

  static const Map<String, List<String>> certificateKeywords = {
    'Android Development': [
      'android',
      'kotlin',
      'pemula android',
      'fundamental android',
      'intermediate android',
      'expert android',
      'jetpack compose',
    ],
    'iOS Development': [
      'ios',
      'swift',
      'fundamental ios',
    ],
    'Multi-Platform Development': [
      'dart',
      'flutter',
      'react native',
      'multiplatform',
      'multi-platform',
    ],
    'Web Development': [
      'javascript',
      'typescript',
      'react',
      'vue',
      'angular',
      'web',
      'front-end',
      'backend',
      'back-end',
      'restful api',
      'node.js',
    ],
    'Cloud Computing': [
      'aws',
      'cloud',
      'practitioner',
      'google cloud',
      'azure',
      'devops',
      'docker',
      'kubernetes',
    ],
    'Machine Learning': [
      'machine learning',
      'dasar AI',
      'artificial intelligence',
      'tensorflow',
      'python',
      'data science',
      'deep learning',
    ],
    'Software Engineering': [
      'menjadi pengembang software', // Menambahkan kata kunci baru
      'dasar pemrograman untuk menjadi', // Menambahkan kata kunci baru
      'pengembang software', // Menambahkan kata kunci baru
      'git',
      'github',
      'solid',
      'clean architecture',
      'clean code',
      'manajemen proyek',
      'software',
      'testing',
      'quality assurance',

    ],
    'Programming Fundamentals': [
      'java',
      'kotlin',
      'python',
      'c++',
      'c#',
      'pemrograman dasar', // Mengubah dari 'pemrograman' ke lebih spesifik
      'algoritma',
      'data structure',
      'logika',
      'computational',
    ],
    'Language Proficiency': [
      'ef set',
      'bahasa inggris',
      'english',
      'toefl',
      'ielts',
    ],
  };

  String _getCertificateType() {
    final title = widget.certificate.title.toLowerCase();

    // Cek berdasarkan kata kunci dalam judul
    for (final entry in certificateKeywords.entries) {
      if (entry.value.any((keyword) => title.contains(keyword))) {
        return entry.key;
      }
    }

    // Cek berdasarkan issuer
    final issuer = widget.certificate.issuer.toLowerCase();
    if (issuer.contains('aws')) {
      return 'Cloud Computing';
    } else if (issuer.contains('google')) {
      return 'Machine Learning';
    } else if (issuer.contains('ef set')) {
      return 'Language Proficiency';
    }

    // Default jika tidak ada yang cocok
    return 'Programming Fundamentals';
  }

  Color _getIssuerColor() {
    final issuer = widget.certificate.issuer.toLowerCase();
    switch (issuer) {
      case 'dicoding/aws':
      case 'aws':
        return Colors.orange;
      case 'dicoding/google':
      case 'google':
        return Colors.blue;
      case 'ef set':
        return Colors.blue;
      case 'dicoding':
        return const Color(0xFF2D9CDB); // Warna biru Dicoding
      case 'coursera':
        return const Color(0xFF0056D2); // Warna biru Coursera
      case 'udemy':
        return const Color(0xFFA435F0); // Warna ungu Udemy
      default:
        return primaryColor;
    }
  }

  IconData _getCertificateIcon() {
    final type = _getCertificateType();
    switch (type) {
      case 'Android Development':
        return Icons.android;
      case 'iOS Development':
        return Icons.phone_iphone;
      case 'Multi-Platform Development':
        return Icons.devices;
      case 'Web Development':
        return Icons.web;
      case 'Cloud Computing':
        return Icons.cloud;
      case 'Machine Learning':
        return Icons.psychology;
      case 'Software Engineering':
        return Icons.engineering;
      case 'Programming Fundamentals':
        return Icons.code;
      case 'Language Proficiency':
        return Icons.language;
      default:
        return Icons.school;
    }
  }

  Color _getTypeColor() {
    final type = _getCertificateType();
    switch (type) {
      case 'Android Development':
        return Colors.greenAccent;
      case 'iOS Development':
        return Colors.grey;
      case 'Multi-Platform Development':
        return Colors.lightBlueAccent;
      case 'Web Development':
        return Colors.blueAccent;
      case 'Cloud Computing':
        return Colors.orange;
      case 'Machine Learning':
        return Colors.purpleAccent;
      case 'Software Engineering':
        return Colors.amber;
      case 'Programming Fundamentals':
        return Colors.redAccent;
      case 'Language Proficiency':
        return Colors.tealAccent;
      default:
        return primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final certificateType = _getCertificateType();
    final typeColor = _getTypeColor();
    final issuerColor = _getIssuerColor();

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: isHovered ? secondaryColor.withOpacity(0.9) : secondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: darkColor.withOpacity(isHovered ? 0.3 : 0.1),
              blurRadius: isHovered ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: darkColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getCertificateIcon(),
                    color: typeColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: defaultPadding / 2),
                Expanded(
                  child: Text(
                    certificateType,
                    style: TextStyle(
                      color: typeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.certificate.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    widget.certificate.issuer,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: issuerColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  Text(
                    widget.certificate.date,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.certificate.credentialUrl != null) ...[
              const SizedBox(height: defaultPadding / 2),
              MaterialButton(
                onPressed: () => _launchUrl(context),
                color: darkColor,
                elevation: 0,
                hoverElevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified,
                      color: issuerColor,
                      size: 20,
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Text(
                      'View Certificate',
                      style: TextStyle(
                        color: issuerColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(BuildContext context) async {
    if (widget.certificate.credentialUrl == null) return;

    try {
      if (await canLaunchUrlString(widget.certificate.credentialUrl!)) {
        await launchUrlString(widget.certificate.credentialUrl!);
      } else {
        throw 'Could not launch certificate URL';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening certificate: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}