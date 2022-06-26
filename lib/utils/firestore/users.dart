import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sns_app/models/account.dart';
import 'package:sns_app/utils/authentication.dart';

class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users =
      _firestoreInstance.collection('users');

  // Firestoreに登録したユーザーを追加
  static Future<dynamic> setUser(Account newAccount) async {
    try {
      // usersコレクションに登録する
      await users.doc(newAccount.id).set({
        'name': newAccount.name,
        'user_id': newAccount.userId,
        'self_introduction': newAccount.selfIntroduction,
        'image_path': newAccount.imagePath,
        'created_time': Timestamp.now(),
        'updated_time': Timestamp.now(),
      });
      print('新規ユーザー作成完了');
      return true;
    } on FirebaseException catch (e) {
      print('新規ユーザー作成エラー: $e');
      return false;
    }
  }

  // アカウントを取得
  static Future<dynamic> getUser(String uid) async {
    try {
      // [FirebaseFirestore]データベース内のドキュメントから読み取られたデータ
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
        id: uid,
        name: data['name'],
        imagePath: data['image_path'],
        selfIntroduction: data['self_introduction'],
        userId: data['user_id'],
        createdTime: data['created_time'],
        updatedTime: data['updated_time'],
      );
      Authentication.myAccount = myAccount;
      print('ユーザー取得完了');
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー取得エラー: $e');
      return false;
    }
  }

  // 情報を更新
  static Future<dynamic> updateUser(Account updateAccount) async {
    try {
      await users.doc(updateAccount.id).update({
        'name': updateAccount.name,
        'image_path': updateAccount.imagePath,
        'user_id': updateAccount.userId,
        'self_introduction': updateAccount.selfIntroduction,
        'updated_time': Timestamp.now(),
      });
      print('ユーザー情報の更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー情報の更新エラー： $e');
      return false;
    }
  }
}
