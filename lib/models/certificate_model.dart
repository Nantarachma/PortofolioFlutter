class Certificate {
  final String title;
  final String issuer;
  final String date;
  final String? credentialUrl;

  Certificate({
    required this.title,
    required this.issuer,
    required this.date,
    this.credentialUrl,
  });
}

final List<Certificate> certificates = [
  Certificate(
    title: 'Memulai Dasar Pemrograman untuk Menjadi Pengembang Software',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/N9ZO97E30XG5',
  ),
  Certificate(
    title: 'Belajar Dasar Git dengan GitHub',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/N9ZO97E4RXG5',
  ),
  Certificate(
    title: 'Pengenalan ke Logika Pemrograman (Programming Logic 101)',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/2VX3K122JXYQ',
  ),
  Certificate(
    title: 'Belajar Prinsip Pemrograman SOLID',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/GRX53L90YZ0M',
  ),
  Certificate(
    title: 'Belajar Dasar Manajemen Proyek',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/N9ZO972YRXG5',
  ),
  Certificate(
    title: 'Memulai Pemrograman Dengan C',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/0LZ0R15R0P65',
  ),
  Certificate(
    title: 'Memulai Pemrograman Dengan Java',
    issuer: 'Dicoding',
    date: 'Jan 2025 - Jan 2028',
    credentialUrl: 'https://www.dicoding.com/certificates/ERZREM2EQXYV',
  ),
];