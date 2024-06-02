import 'dart:io';

import 'package:flutter/material.dart';
import 'package:history_hub_v2/app/core/extensions/time_of_day_extension.dart';

class CreateEventParams {
  final File? image;
  final String userId;
  final String nama;
  final DateTime tanggalMulai;
  final DateTime? tanggalAkhir;
  final TimeOfDay jamMulai;
  final TimeOfDay jamAkhir;
  final String lokasi;
  final String? deskripsi;
  final int jumlahTiket;
  final int hargaTiket;
  final DateTime tanggalMulaiJual;
  final DateTime tanggalAkhirJual;

  CreateEventParams({
    this.image,
    required this.userId,
    required this.nama,
    required this.tanggalMulai,
    this.tanggalAkhir,
    required this.jamMulai,
    required this.jamAkhir,
    required this.lokasi,
    this.deskripsi,
    required this.jumlahTiket,
    required this.hargaTiket,
    required this.tanggalMulaiJual,
    required this.tanggalAkhirJual,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nama,
      'user_id': userId,
      'date_start': tanggalMulai.toIso8601String(),
      'date_end': tanggalAkhir?.toIso8601String(),
      'time_start': jamMulai.toPostgresTime(),
      'time_end': jamAkhir.toPostgresTime(),
      'date_buy_start': tanggalMulaiJual.toIso8601String(),
      'date_buy_end': tanggalAkhirJual.toIso8601String(),
      'location': lokasi,
      'description': deskripsi,
      'price': hargaTiket,
      'quota': jumlahTiket,
    };
  }
}
