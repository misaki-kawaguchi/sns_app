import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post({
    this.id,
    required this.content,
    required this.postAccountId,
    this.createdTime,
  });

  final String? id;
  final String content;
  final String postAccountId;
  final Timestamp? createdTime;
}
