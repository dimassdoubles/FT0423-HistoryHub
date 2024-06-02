class GetListEventParams {
  final String myUserId;
  final String keyword;
  final int offset;

  static const int limit = 10;

  GetListEventParams({
    required this.myUserId,
    required this.keyword,
    required this.offset,
  });

  Map<String, dynamic> toMap() {
    return {
      'my_user_id': myUserId,
      'keyword': keyword,
      'limit': limit,
      'offset': offset,
    };
  }
}
