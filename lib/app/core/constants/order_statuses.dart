import 'package:history_hub_v2/app/data/params/order/get_list_order_params.dart';

enum OrderStatuses {
  belumBayar(1, 'Belum Bayar',
      'Tiket telah dipesan, tetapi pembayaran belum dilakukan.'),
  aktif(2, 'Aktif', 'Pembayaran telah dilakukan untuk tiket.'),
  selesai(3, 'Selesai', 'Tiket sudah digunakan untuk masuk ke acara.'),
  batal(4, 'Batal', 'Tiket telah dibatalkan.');

  final int code;
  final String description;
  final String label;

  const OrderStatuses(this.code, this.label, this.description);
}

extension OrderStatusExt on OrderStatuses {
  GetListOrderParams toParam() {
    switch (this) {
      case OrderStatuses.belumBayar:
        return GetListOrderParams(
            status: OrderStatuses.belumBayar, keyword: '', page: 0);
      case OrderStatuses.aktif:
        return GetListOrderParams(
            status: OrderStatuses.aktif, keyword: '', page: 0);
      case OrderStatuses.selesai:
        return GetListOrderParams(
            status: OrderStatuses.selesai, keyword: '', page: 0);
      case OrderStatuses.batal:
        return GetListOrderParams(
            status: OrderStatuses.batal, keyword: '', page: 0);
    }
  }
}
