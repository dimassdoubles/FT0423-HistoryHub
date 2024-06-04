import 'package:history_hub_v2/app/core/constants/payment_statuses.dart';

class GetListOrderParams {
  final PaymentStatuses? status;
  final String keyword;
  final int page; // start with 0

  GetListOrderParams({
    this.status,
    required this.keyword,
    required this.page,
  });

  static const int limit = 10;

  Map<String, dynamic> toJson() {
    return {
      "p_keyword": keyword,
      "p_status_code": status?.code ?? PaymentStatuses.all.code,
      "p_limit": limit,
      "p_page": page,
    };
  }
}
