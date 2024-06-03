import 'package:flutter_dotenv/flutter_dotenv.dart';

class MidtransConst {
  MidtransConst._();

  static get merchantId => dotenv.env["MT_MERCHANT_ID"];
  static get clientKey => dotenv.env["MT_CLIENT_KEY"];
  static get serverKey => dotenv.env["MT_SERVER_KEY"];
}
