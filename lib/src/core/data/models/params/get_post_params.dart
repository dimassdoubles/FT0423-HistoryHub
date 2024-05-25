class GetPostParams {
  final String keyword;
  final List<String> listTagId;
  final int offset;

  static const int limit = 10;

  GetPostParams({
    required this.keyword,
    required this.listTagId,
    required this.offset,
  });

  Map<String, dynamic> toMap() {
    return {
      'keyword': keyword,
      'list_tag_id': listTagId,
      'limit': limit,
      'offset': offset,
    };
  }
}
