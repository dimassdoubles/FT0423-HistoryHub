import 'package:equatable/equatable.dart';

class Kecamatan extends Equatable {
  final int id;
  final int idKabupaten;
  final String nama;
  final String kode;

  const Kecamatan({
    required this.id,
    required this.idKabupaten,
    required this.nama,
    required this.kode,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) {
    return Kecamatan(
      id: json['id'],
      idKabupaten: json['id_kabupaten'],
      nama: json['nama'],
      kode: json['kode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_kabupaten': idKabupaten,
      'nama': nama,
      'kode': kode,
    };
  }

  @override
  List<Object?> get props => [id, idKabupaten, nama, kode];

  @override
  String toString() =>
      'Kecamatan(id: $id, idKabupaten: $idKabupaten, nama: $nama, kode: $kode)';
}
