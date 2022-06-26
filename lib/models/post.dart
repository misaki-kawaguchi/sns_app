class Post {
  Post({
    required this.id,
    required this.content,
    required this.postAccountId,
    this.createdTime,
  });

  final String id;
  final String content;
  final String postAccountId;
  final DateTime? createdTime;
}
