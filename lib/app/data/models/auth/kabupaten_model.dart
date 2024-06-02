import 'package:equatable/equatable.dart';

class KabupatenModel extends Equatable {
  final int id;
  final String nama;
  final String kode;

  const KabupatenModel({
    required this.id,
    required this.nama,
    required this.kode,
  });

  factory KabupatenModel.fromJson(Map<String, dynamic> json) {
    return KabupatenModel(
      id: json['id'],
      nama: json['nama'],
      kode: json['kode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kode': kode,
    };
  }

  @override
  List<Object?> get props => [id, nama, kode];

  @override
  String toString() => 'KabupatenModel(id: $id, nama: $nama, kode: $kode)';
}
