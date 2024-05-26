import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PriceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final int? parsedValue = int.tryParse(newValue.text.replaceAll('.', ''));
    if (parsedValue != null) {
      final formattedValue = NumberFormat('#,##0', 'id').format(parsedValue);
      return newValue.copyWith(
        text: formattedValue,
        selection: TextSelection.collapsed(offset: formattedValue.length),
      );
    }
    return oldValue;
  }
}
