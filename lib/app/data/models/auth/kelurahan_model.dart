import 'package:equatable/equatable.dart';

class KelurahanModel extends Equatable {
  final int id;
  final int idKecamatan;
  final String nama;
  final String kode;

  const KelurahanModel({
    required this.id,
    required this.idKecamatan,
    required this.nama,
    required this.kode,
  });

  factory KelurahanModel.fromJson(Map<String, dynamic> json) {
    return KelurahanModel(
      id: json['id'],
      idKecamatan: json['id_kecamatan'],
      nama: json['nama'],
      kode: json['kode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_kecamatan': idKecamatan,
      'nama': nama,
      'kode': kode,
    };
  }

  @override
  List<Object?> get props => [id, idKecamatan, nama, kode];

  @override
  String toString() =>
      'KelurahanModel(id: $id, idKecamatan: $idKecamatan, nama: $nama, kode: $kode)';
}
