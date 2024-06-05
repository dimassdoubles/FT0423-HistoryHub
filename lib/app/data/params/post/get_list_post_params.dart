class GetListPostParams {
  final String? keyword;
  final String? userId;
  final List<String> listTagId;
  final int offset; // initial is 0

  static const int limit = 10;

  GetListPostParams({
    required this.keyword,
    required this.listTagId,
    required this.offset,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'p_keyword': keyword,
      // 'list_tag_id': listTagId,
      'p_user_id': userId,
      'page_size': limit,
      'page': offset,
    };
  }
}
