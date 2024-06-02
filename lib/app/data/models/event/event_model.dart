import 'package:flutter/material.dart';

class EventModel {
  final String id;
  final String idPenyelenggara;
  final String namaPenyelenggara;
  final String? image;
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

  EventModel({
    required this.id,
    required this.idPenyelenggara,
    required this.namaPenyelenggara,
    this.image,
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

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      idPenyelenggara: json['id_penyelenggara'],
      namaPenyelenggara: json['nama_penyelenggara'],
      image: json['image'],
      nama: json['nama'],
      tanggalMulai: DateTime.parse(json['tanggal_mulai']),
      tanggalAkhir: json['tanggal_akhir'] != null
          ? DateTime.parse(json['tanggal_akhir'])
          : null,
      jamMulai: TimeOfDay(
        hour: int.parse(json['jam_mulai'].split(':')[0]),
        minute: int.parse(json['jam_mulai'].split(':')[1]),
      ),
      jamAkhir: TimeOfDay(
        hour: int.parse(json['jam_akhir'].split(':')[0]),
        minute: int.parse(json['jam_akhir'].split(':')[1]),
      ),
      lokasi: json['lokasi'],
      deskripsi: json['deskripsi'],
      jumlahTiket: json['jumlah_tiket'],
      hargaTiket: json['harga_tiket'],
      tanggalMulaiJual: DateTime.parse(json['tanggal_mulai_jual']),
      tanggalAkhirJual: DateTime.parse(json['tanggal_akhir_jual']),
    );
  }
}
