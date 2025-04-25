import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutterproject/main/second.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  final myController = TextEditingController();

  _MyHomePageState(this.title);
  @override
  void initState() {
    super.initState();
    loadAsset()
        .then((value) {
          // 解析 JSON 数据
          Map<String, dynamic> jsonData = jsonDecode(value);
          print(
            jsonData['name'], // 输出: John Doe
          );
        })
        .catchError((error) {
          print(error);
        });
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              child: Text('打开路由'),
            ),
          ),
        ],
      ),
    );
  }
}
