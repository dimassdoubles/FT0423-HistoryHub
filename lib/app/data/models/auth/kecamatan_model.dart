import 'package:equatable/equatable.dart';

class KecamatanModel extends Equatable {
  final int id;
  final int idKabupaten;
  final String nama;
  final String kode;

  const KecamatanModel({
    required this.id,
    required this.idKabupaten,
    required this.nama,
    required this.kode,
  });

  factory KecamatanModel.fromJson(Map<String, dynamic> json) {
    return KecamatanModel(
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
      'KecamatanModel(id: $id, idKabupaten: $idKabupaten, nama: $nama, kode: $kode)';
}
