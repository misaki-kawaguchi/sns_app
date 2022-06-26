import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns_app/utils/authentication.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final pickerFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      setState(() {
        image = File(pickerFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          '新規登録',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  getImageFromGallery();
                },
                child: CircleAvatar(
                  foregroundImage: image == null ? null : FileImage(image!),
                  radius: 40,
                  child: const Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: '名前',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: userIdController,
                    decoration: const InputDecoration(
                      hintText: 'ユーザーID',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: selfIntroductionController,
                  decoration: const InputDecoration(
                    hintText: '自己紹介',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'メールアドレス',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'パスワード',
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async{
                  if (nameController.text.isNotEmpty &&
                      userIdController.text.isNotEmpty &&
                      selfIntroductionController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      image != null) {
                    var result = await Authentication.signUp(emailController.text, passwordController.text);
                    if (result == true) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: const Text(
                  'アカウントを作成',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
