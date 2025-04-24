import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;

  _MyHomePageState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Text(
            '我是中国人',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
