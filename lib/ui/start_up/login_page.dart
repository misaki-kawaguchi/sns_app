import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sns_app/ui/screen.dart';
import 'package:sns_app/ui/start_up/create_account_page.dart';
import 'package:sns_app/utils/authentication.dart';
import 'package:sns_app/utils/firestore/users.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Flutterラボ SNS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
                  controller: passController,
                  decoration: const InputDecoration(
                    hintText: 'パスワード',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: 'アカウント作成していない方は'),
                    TextSpan(
                      text: 'こちら',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateAccountPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () async{
                  var result = await Authentication.emailSignIn(emailController.text, passController.text);
                  if (result is UserCredential) {
                    var _result = await UserFirestore.getUser(result.user!.uid);
                    if (_result == true) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Screen()));
                    }
                  }
                },
                child: const Text('emailでログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
