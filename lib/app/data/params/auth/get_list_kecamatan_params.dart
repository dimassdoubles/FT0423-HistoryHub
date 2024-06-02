class GetListKecamatanParams {
  final String kabupatenId;

  GetListKecamatanParams(this.kabupatenId);

  Map<String, dynamic> toJson() {
    return {
      'kabupaten_id': kabupatenId,
    };
  }
}
