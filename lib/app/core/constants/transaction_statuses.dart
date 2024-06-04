import 'package:history_hub_v2/app/core/constants/payment_statuses.dart';
import 'package:history_hub_v2/app/data/params/order/get_list_order_params.dart';

enum TransactionStatuses {
  belumBayar('Belum Bayar'),
  aktif('Aktif'),
  selesai('Selesai'),
  batal('Batal');

  const TransactionStatuses(this.label);
  final String label;
}

extension TransactionStatusesExt on TransactionStatuses {
  GetListOrderParams toParam() {
    switch (this) {
      case TransactionStatuses.belumBayar:
        return GetListOrderParams(
            status: PaymentStatuses.pending, keyword: '', page: 0);
      case TransactionStatuses.aktif:
        return GetListOrderParams(
            status: PaymentStatuses.success, keyword: '', page: 0);
      case TransactionStatuses.selesai:
        return GetListOrderParams(
            status: PaymentStatuses.success, keyword: '', page: 0);
      case TransactionStatuses.batal:
        return GetListOrderParams(
            status: PaymentStatuses.fail, keyword: '', page: 0);
    }
  }
}
