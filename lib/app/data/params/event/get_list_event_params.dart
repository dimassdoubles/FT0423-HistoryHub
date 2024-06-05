class GetListEventParams {
  final String? keyword;
  final int offset;

  static const int limit = 10;

  GetListEventParams({
    required this.keyword,
    required this.offset,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_keyword': keyword,
      'page_size': limit,
      'page': offset,
    };
  }
}
