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

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const DetailScreen()),
    );
    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!context.mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('测试标题')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _navigateAndDisplaySelection(context);
            },
            child: Text('按钮'),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
