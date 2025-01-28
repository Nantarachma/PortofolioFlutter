class LeadershipActivity {
  final String title;
  final String role;
  final String duration;
  final String description;
  final String? image;
  final List<String>? achievements;
  final String? organization;

  LeadershipActivity({
    required this.title,
    required this.role,
    required this.duration,
    required this.description,
    this.image,
    this.achievements,
    this.organization,
  });
}

List<LeadershipActivity> leadershipActivities = [
  LeadershipActivity(
    title: "Connection Day 2022",
    role: "Member of Security and Licensing Division",
    duration: "Nov 2022 - Feb 2023",
    organization: "BEM Fakultas Ilmu Komputer UPN Veteran Jawa Timur",
    description: "Planned and executed the annual Connection Day event, a gathering of new computer science students. Managed security and licensing requirements for the event",
    image: "assets/images/bemfasilkom.png", // Add your image path
    achievements: [
      "Become a member of the security and licensing division",
      "Help creating rules during the event",
      "Set security issues during the event",
    ],
  ),
  LeadershipActivity(
    title: "Dies Natalis Fasilkom 2023",
    role: "Member of Security and First Aid Division",
    duration: "Jun 2023 - Aug 2023",
    organization: "BEM Fakultas Ilmu Komputer UPN Veteran Jawa Timur",
    description: "Organized the annual Dies Natalis event for the computer science faculty. Managed security and first aid requirements for the event.",
    image: "assets/images/bemfasilkom.png", // Add your image path
    achievements: [
      "Become a member of the security and medicine division",
      "Help creating rules during the event",
      "Set security issues during the event",
      "Stand guard at the health post",
      "Find a list of medicines",
    ],
  ),
  LeadershipActivity(
    title: "MOSAIK 2023",
    role: "Senior Leader for New Students",
    duration: "Jun 2023 - Sep 2023",
    organization: "BEM Fakultas Ilmu Komputer UPN Veteran Jawa Timur",
    description: "Led the MOSAIK event for new students. Organized activities and provided guidance for new students.",
    image: "assets/images/bemfasilkom.png", // Add your image path
    achievements: [
      "Building closeness with new students.",
      "Introducing campus environment, guiding and sharing campus experiences with new students.",
      "Maintain order for new students during the event.",
    ],
  ),
  LeadershipActivity(
    title: "Building Character Day 2023",
    role: "Head of Security Division",
    duration: "May 2023 - Oct 2023",
    organization: "Himpunan Mahasiswa Informatika UPN Veteran Jawa Timur",
    description: "Organized the annual Building Character Day event for the informatics students. Managed security requirements for the event.",
    image: "assets/images/himatifa.png", // Add your image path
    achievements: [
      "Become the head of security division and organize the divisons members",
      "Help creating rules during the event",
      "Set security issues during the event",
    ],
  ),
  LeadershipActivity(
    title: "Pelatihan KTI 2023",
    role: "Head of Security and Licensing Division",
    duration: "Jul 2023 - Oct 2023",
    organization: "Himpunan Mahasiswa Informatika UPN Veteran Jawa Timur",
    description: "Organized the Pelatihan KTI event for the new informatics students. Managed security and licensing requirements for the event.",
    image: "assets/images/himatifa.png", // Add your image path
    achievements: [
      "Become the head of security and licensing division and organize the divisons members",
      "Help creating rules during the event",
      "Set security issues during the event",
    ],
  ),
  LeadershipActivity(
    title: "Fasilkom Fest 2023",
    role: "Coordinator of Competition",
    duration: "Oct 2023 - Dec 2023",
    organization: "BEM Fakultas Ilmu Komputer UPN Veteran Jawa Timur",
    description: "Organized the annual Fasilkom Fest event for the computer science faculty. Managed competition requirements for the event.",
    image: "assets/images/bemfasilkom.png", // Add your image path
    achievements: [
      "Determine the concept and plan of competition activities.",
      "Create implementation instructions and technical rundowns of the competition.",
    ],
  ),
  LeadershipActivity(
    title: "Pemira Fasilkom 2024",
    role: "Head of Election Commision",
    duration: "Oct 2023 - Dec 2023",
    organization: "BEM Fakultas Ilmu Komputer UPN Veteran Jawa Timur",
    description: "Organized the annual Pemira Fasilkom event for the computer science faculty. Managed election requirements for the event.",
    image: "assets/images/bemfasilkom.png", // Add your image path
    achievements: [
      "Control all needs and activities of KPUM FASILKOM UPN Veteran Java East.",
      "Provide appropriate information regarding the policies and activities of KPUM FASILKOM UPN “Veteran” East Java.",
      "Sign all regulations and decisions of KPUM FASILKOM UPN Veteran East Java.",
      "Coordinate, organize and control all stages.",
    ],
  ),
];