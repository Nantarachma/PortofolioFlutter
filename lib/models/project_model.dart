class Project {
  final String? title;
  final String? description;
  final String? link;
  final String? sourceCode;
  final List<String>? tags;
  final String? thumbnail;
  final DateTime? createdAt;
  final bool isPublic;

  Project({
    this.title,
    this.description,
    this.link,
    this.sourceCode,
    this.tags,
    this.thumbnail,
    this.createdAt,
    this.isPublic = true,
  });

  // Factory constructor untuk membuat Project dari Map
  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] as String?,
      description: map['description'] as String?,
      link: map['link'] as String?,
      sourceCode: map['sourceCode'] as String?,
      tags: (map['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: map['thumbnail'] as String?,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : null,
      isPublic: map['isPublic'] as bool? ?? true,
    );
  }

  // Method untuk mengkonversi Project ke Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'link': link,
      'sourceCode': sourceCode,
      'tags': tags,
      'thumbnail': thumbnail,
      'createdAt': createdAt?.toIso8601String(),
      'isPublic': isPublic,
    };
  }
}

List<Project> demo_projects = [
  Project(
    title: "SHARA (Skin Health And Recommendation App)",
    description: "A mobile app to scan your face and give you advice about skincare.",
    link: "https://github.com/WinasPutra/SHARA-C242-PS321",
    sourceCode: "https://github.com/WinasPutra/SHARA-C242-PS321",
    tags: ["Kotlin", "Cloud Computing", "Machine Learning", "Healthcare", "Mobile App"],
    thumbnail: "assets/images/shara.png",
    createdAt: DateTime(2024, 12),
  ),
  Project(
    title: "Asclepius (Medical App)",
    description: "A mobile app to detect cancer disease in skin with tensorflow lite model.",
    link: "https://github.com/Nantarachma/Asclepius-Submission-Dicoding",
    sourceCode: "https://github.com/Nantarachma/Asclepius-Submission-Dicoding",
    tags: ["Kotlin", "TensorFlow Lite", "Healthcare", "AI"],
    thumbnail: "assets/images/dicoding.png",
    createdAt: DateTime(2024, 10),
  ),
  Project(
    title: "Resep Makanan Antarkita",
    description: "A design for a mobile app that's about cooking with an ai powered feature for personal recipes.",
    link: "https://docs.google.com/document/d/1B8l3calG9jy7FHUavRZc3MO2McZ_cxsg/edit",
    tags: ["UI/UX", "Mobile Design", "AI", "Food"],
    thumbnail: "assets/images/upnvjt.png",
    createdAt: DateTime(2024, 2),
  ),
  Project(
    title: "UML Modelling for PKL Information System",
    description: "A design of an online information system using UML to facilitate internship registration and management for Informatics students.",
    link: "https://docs.google.com/document/d/1d_hoiTGPloVMNfHRQb7XDq1cbHwXn9kq/edit",
    tags: ["UML", "System Design", "Education"],
    thumbnail: "assets/images/upnvjt.png",
    createdAt: DateTime(2024, 2),
  ),
  Project(
    title: "Publish Journal for Indonesian Course Relation to Chat GPT",
    description: "This journal examines the use of Chat GPT technology in Indonesian language learning, student responses, and the impact on learning outcomes.",
    link: "https://jtuah.ejournal.unri.ac.id/index.php/JTUAH/article/view/8032",
    tags: ["Research", "Education", "AI", "Journal", "Indonesian"],
    thumbnail: "assets/images/upnvjt.png",
    createdAt: DateTime(2023, 6),
  ),
];