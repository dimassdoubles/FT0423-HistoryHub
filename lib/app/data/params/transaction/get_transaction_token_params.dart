class GetTransactionTokenParams {
  final String orderId;
  final int grossAmount;

  GetTransactionTokenParams({
    required this.orderId,
    required this.grossAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      "data_json": {
        "transaction_details": {
          "order_id": orderId,
          "gross_amount": grossAmount,
        }
      }
    };
  }
}
