class GetListKelurahanParams {
  final String kecamatanId;

  GetListKelurahanParams(this.kecamatanId);

  Map<String, dynamic> toJson() {
    return {
      'kecamatan_id': kecamatanId,
    };
  }
}
