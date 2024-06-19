import 'package:history_hub_v2/app/core/constants/order_statuses.dart';

class GetListOrderParams {
  final OrderStatuses status;
  final String keyword;
  final int page; // start with 0

  GetListOrderParams({
    required this.status,
    required this.keyword,
    required this.page,
  });

  static const int limit = 10;

  Map<String, dynamic> toJson() {
    return {
      "p_keyword": keyword,
      "p_status_code": status.code,
      "p_limit": limit,
      "p_page": page,
    };
  }
}
