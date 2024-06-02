import 'package:intl/intl.dart';

extension TimeAgoExtension on DateTime {
  String timeAgo() {
    Duration diff = DateTime.now().difference(this);

    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} detik lalu';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam lalu';
    } else {
      return DateFormat('d MMMM yyyy', 'id').format(this);
    }
  }
}

