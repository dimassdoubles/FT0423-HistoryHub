class GetUserListPostParams {
  final String keyword;
  final List<String> listTagId;
  final int offset; // initial is 0

  static const int limit = 10;

  GetUserListPostParams({
    required this.keyword,
    required this.listTagId,
    required this.offset,
  });

  Map<String, dynamic> toJson() {
    return {
      // 'keyword': keyword,
      // 'list_tag_id': listTagId,
      'page_size': limit,
      'page': offset,
    };
  }
}
