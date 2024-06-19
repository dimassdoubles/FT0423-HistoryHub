import 'package:flutter/material.dart';

class EventModel {
  final String id;
  final String idPenyelenggara;
  final String namaPenyelenggara;
  final String image;
  final String nama;
  final DateTime tanggalMulai;
  final DateTime? tanggalAkhir;
  final TimeOfDay jamMulai;
  final TimeOfDay jamAkhir;
  final String lokasi;
  final String deskripsi;
  final int jumlahTiket;
  final int hargaTiket;
  final DateTime tanggalMulaiJual;
  final DateTime tanggalAkhirJual;

  EventModel({
    required this.id,
    required this.idPenyelenggara,
    required this.namaPenyelenggara,
    required this.image,
    required this.nama,
    required this.tanggalMulai,
    this.tanggalAkhir,
    required this.jamMulai,
    required this.jamAkhir,
    required this.lokasi,
    required this.deskripsi,
    required this.jumlahTiket,
    required this.hargaTiket,
    required this.tanggalMulaiJual,
    required this.tanggalAkhirJual,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      idPenyelenggara: json['user_id'],
      namaPenyelenggara: json['full_name'],
      image: json['image_url'] ?? '',
      nama: json['name'],
      tanggalMulai: DateTime.parse(json['date_start']),
      tanggalAkhir:
          json['date_end'] != null ? DateTime.parse(json['date_end']) : null,
      jamMulai: TimeOfDay(
        hour: int.parse(json['time_start'].split(':')[0]),
        minute: int.parse(json['time_start'].split(':')[1]),
      ),
      jamAkhir: TimeOfDay(
        hour: int.parse(json['time_end'].split(':')[0]),
        minute: int.parse(json['time_end'].split(':')[1]),
      ),
      lokasi: json['location'],
      deskripsi: json['description'] ?? '',
      jumlahTiket: json['quota'],
      hargaTiket: json['price'],
      tanggalMulaiJual: DateTime.parse(json['date_buy_start']),
      tanggalAkhirJual: DateTime.parse(json['date_buy_end']),
    );
  }
}
