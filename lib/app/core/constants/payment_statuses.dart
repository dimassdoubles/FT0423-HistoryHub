enum PaymentStatuses {
  all('', 'Semua'),
  success('200', 'Sukses'),
  pending('201', 'Pending'),
  fail('202', 'Gagal');

  const PaymentStatuses(this.code, this.name);
  final String code;
  final String name;
}
