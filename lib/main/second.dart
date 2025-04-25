import 'package:flutter/material.dart';
import 'package:myflutterproject/modal/Todo.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, this.todo});

  // Declare a field that holds the Todo.
  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    // final todo = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('第二个屏幕')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '返回的参数');
              },
              child: Text('测试点击'),
            ),
          ],
        ),
      ),
    );
  }
}
