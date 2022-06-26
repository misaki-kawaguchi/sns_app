import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FunctionUtils {
  static Future<dynamic> getImageFromGallery() async {
    ImagePicker picker = ImagePicker();
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    return pickerFile;
  }

  static Future<String> uploadImage(String uid, File image) async {
    // インスタンスを作成
    final FirebaseStorage storageInstance = FirebaseStorage.instance;
    // ファイルへの参照を作成
    final Reference ref = FirebaseStorage.instance.ref();
    // uidをフォルダ名にしてファイルを作成
    await ref.child(uid).putFile(image!);
    // アップロードした画像のURLを取得
    String downloadUrl = await storageInstance.ref(uid).getDownloadURL();
    print('image_path:$downloadUrl');
    return downloadUrl;
  }
}
