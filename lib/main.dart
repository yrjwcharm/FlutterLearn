import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myflutterproject/state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo Home Page')),
        body: StateManager(data: 'Hello, World!', child: MyCounter()),
      ),
    );
  }
}

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    var data = StateManager.of(context)?.data ?? '';

    //8个按钮
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.orange),
            ),
            child: Text('TextButton', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: Text('ElevatedButton'),
          ),
          FilledButton(
            onPressed: () {},

            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.black),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: Text('FilledButton'),
          ),
          FilledButton.tonal(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: Text('FilledButton.tonal'),
          ),

          OutlinedButton(
            onPressed: () {},

            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.yellow),
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
            child: Text('OutlinedButton'),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: Image.asset('web/icons/Icon-192.png', width: 45, height: 45),
          ),
          FloatingActionButton(
            onPressed: () {
              print('FloatingActionButton');
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
