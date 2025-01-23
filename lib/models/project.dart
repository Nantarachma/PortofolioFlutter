class Project {
  final String? title, description, link;

  Project({this.title, this.description, this.link});
}

// ignore: non_constant_identifier_names
List<Project> demo_projects = [
  Project(
    title: "SHARA (Skin Health And Recommendation App)",
    link: "https://github.com/WinasPutra/SHARA-C242-PS321",
    description:
        "A mobile app to scan your face and give you advice about skincare.",
  ),
  Project(
    title: "Asclepius (Medical App)",
    link: "https://github.com/Nantarachma/Asclepius-Submission-Dicoding",
    description:
        "A mobile app to detect cancer disease in skin with tensorflow lite model.",
  ),
  Project(
    title: "Resep Makanan “Antarkita”",
    link: "https://docs.google.com/document/d/1B8l3calG9jy7FHUavRZc3MO2McZ_cxsg/edit?usp=sharing&ouid=107100240825558006264&rtpof=true&sd=true",
    description:
        "A design for a mobile app that's about cooking with an ai powered feature for personal recipes.",
  ),
  Project(
    title: "UML Modelling for PKL Information System",
    link: "https://docs.google.com/document/d/1d_hoiTGPloVMNfHRQb7XDq1cbHwXn9kq/edit?usp=sharing&ouid=107100240825558006264&rtpof=true&sd=true",
    description:
        "A design of an online information system using UML to facilitate internship registration and management for Informatics students.",
  ),

];