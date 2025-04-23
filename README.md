  在 Flutter 中遇到 Vertical  viewport was given unbounded height 错误，是由于 **垂直滚动的 GridView 在垂直方向没有高度约束​ ​**。以下是问题分析和解决方案：
  
  ```dart
  import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(leading: Icon(Icons.map), title: Text('Map')),
        ListTile(leading: Icon(Icons.photo_album), title: Text('Album')),
        ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Layout Demo')),
        body: const Center(child: MyApp()),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            // Create a grid with 2 columns.
            // If you change the scrollDirection to horizontal,
            // this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the list.
            children: List.generate(100, (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: TextTheme.of(context).headlineSmall,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
  ```