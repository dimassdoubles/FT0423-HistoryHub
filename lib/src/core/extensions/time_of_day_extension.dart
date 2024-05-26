import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay? {
  String display() {
    if (this == null) {
      return "";
    }

    final hour = this!.hour.toString().padLeft(2, '0');
    final minute = this!.minute.toString().padLeft(2, '0');
    return '$hour.$minute';
  }
}
