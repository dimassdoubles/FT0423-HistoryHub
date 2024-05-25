import 'package:equatable/equatable.dart';

class Kabupaten extends Equatable {
  final int id;
  final String nama;
  final String kode;

  const Kabupaten({
    required this.id,
    required this.nama,
    required this.kode,
  });

  factory Kabupaten.fromJson(Map<String, dynamic> json) {
    return Kabupaten(
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
  String toString() => 'Kabupaten(id: $id, nama: $nama, kode: $kode)';
}
