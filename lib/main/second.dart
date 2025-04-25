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
    Todo todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}
