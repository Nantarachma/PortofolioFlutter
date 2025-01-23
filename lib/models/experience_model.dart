class Experience {
  final String company;
  final String role;
  final String duration;
  final String? credentialUrl;
  final String description;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    this.credentialUrl,
    required this.description,
  });
}

final List<Experience> experiences = [
  Experience(
    company: 'BEM Fakultas Ilmu Komputer UPN "Veteran" Jawa Timur',
    role: 'Head of Regeneration Department',
    duration: 'Maret 2024 - Januari 2025',
    credentialUrl: 'https://drive.google.com/file/d/1WvZGSMrXK3knp1Y0H8eC58z4d9BiFijx/view?usp=sharing',
    description: 'Led the regeneration department and organized various events.',
  ),
  Experience(
    company: 'Bangkit Academy led by Google, Tokopedia, Gojek, & Traveloka',
    role: 'Mobile Development Cohort',
    duration: 'September 2024 - Januari 2025',
    credentialUrl: 'https://drive.google.com/open?id=1btniyPim_E_Dw_-Jv4m5Ii9_7ppgEAcL',
    description: 'Participated as a mobile development cohort, learning and develop a capstone project.',
  ),
];