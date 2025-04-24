import 'package:flutter/material.dart';

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
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    String label = 'Unfocused';
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          GestureDetector(
            // When the child is tapped, show a snackbar.
            onTap: () {
              const snackBar = SnackBar(content: Text('Tap'));

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            // The custom button
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('My Button'),
            ),
          ),
          // The InkWell wraps the custom flat button widget.
          InkWell(
            splashColor: Colors.transparent, // 移除点击涟漪
            highlightColor: Colors.transparent, // 移除长按高亮
            // When the user taps the button, show a snackbar.
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Tap')));
            },
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Flat Button'),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '请输入',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your username',
              hintText: 'Username',
            ),
          ),
          Focus(
            onFocusChange: (focused) {
              setState(() {
                color = focused ? Colors.black26 : Colors.white;
                label = focused ? 'Focused' : 'Unfocused';
              });
            },
            child: Center(
              child: Container(
                width: 300,
                height: 50,
                alignment: Alignment.center,
                color: color,
                child: Text(label),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
