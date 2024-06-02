class GetListPostParams {
  final String myUserId;
  final String keyword;
  final List<String> listTagId;
  final int offset;

  static const int limit = 10;

  GetListPostParams({
    required this.myUserId,
    required this.keyword,
    required this.listTagId,
    required this.offset,
  });

  Map<String, dynamic> toMap() {
    return {
      'my_user_id': myUserId,
      'keyword': keyword,
      'list_tag_id': listTagId,
      'limit': limit,
      'offset': offset,
    };
  }
}
