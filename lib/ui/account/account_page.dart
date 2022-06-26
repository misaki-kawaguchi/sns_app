import 'package:flutter/material.dart';
import 'package:sns_app/models/account.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Account myAccount = Account(
    id: '1',
    name: 'Flutterラボ',
    imagePath:
        'https://yt3.ggpht.com/ngVd2-zv5o3pGUCfiVdZXCHhnq_g1Lo1Y8DbrmB9O8G7DG0IWUQJgsacqsI_LRvZE8JTsbQIuQ=s900-c-k-c0x00ffffff-no-rj',
    selfIntroduction: 'こんばんは',
    userId: 'flutter_labo',
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('アカウント'),
      ),
    );
  }
}
