import 'package:intl/intl.dart';

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

  String timeAgo() {
    if (this == null) return '';

    Duration diff = DateTime.now().difference(this!);

    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} detik lalu';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam lalu';
    } else {
      return DateFormat('d MMMM yyyy', 'id').format(this!);
    }
  }
}
