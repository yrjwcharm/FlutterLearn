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
          Text('测试主题', style: Theme.of(context).textTheme.titleLarge),
          Container(
            color: Colors.red,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('测试主题', style: Theme.of(context).textTheme.titleLarge),
          ),
          Theme(
            data: ThemeData(
              textTheme: Theme.of(context).textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                ),
              ),
            ),
            child: Builder(
              builder:
                  (context) => Text(
                    '测试主题',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
