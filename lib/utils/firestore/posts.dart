import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sns_app/models/post.dart';

class PostFireStore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  // 色々なユーザーの投稿をまとめる全体のコレクション
  static final CollectionReference posts = _firestoreInstance.collection('posts');

  static Future<dynamic> addPost(Post newPost) async {
    try {
      // 自分だけの投稿をまとめるコレクション
      final CollectionReference _userPosts = _firestoreInstance.collection('users').doc(newPost.postAccountId).collection('my_posts');
      var result = await posts.add({
        'content': newPost.content,
        'post_account_id': newPost.postAccountId,
        'created_time': Timestamp.now(),
      });
      _userPosts.doc(result.id).set({
        'post_id': result.id,
        'created_time': Timestamp.now(),
      });
      print('投稿完了');
      return true;
    } on FirebaseException catch(e) {
      print('投稿エラー：$e');
      return false;
    }
  }
}