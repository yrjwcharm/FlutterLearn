import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutterproject/main/second.dart';
import 'package:myflutterproject/modal/Todo.dart';

class MyHomePage extends StatefulWidget {
  final todos = List.generate(
    20,
    (i) =>
        Todo('Todo $i', 'A description of what needs to be done for Todo $i'),
  );

  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState(todos: todos);
}

class _MyHomePageState extends State<MyHomePage> {
  // Requiring the list of todos.

  final List<Todo> todos;

  _MyHomePageState({required this.todos});
  @override
  void initState() {
    super.initState();
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('测试标题')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => DetailScreen(todo: todos[index]),
                  builder: (context) => DetailScreen(),
                  settings: RouteSettings(arguments: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
