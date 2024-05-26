extension DateTimeExtension on DateTime? {
  String display() {
    if (this == null) {
      return '';
    }
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    final day = this!.day;
    final month = months[this!.month - 1];
    final year = this!.year;

    return '$day $month $year';
  }
}
