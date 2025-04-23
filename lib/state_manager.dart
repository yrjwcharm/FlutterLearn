import 'package:flutter/material.dart';

class StateManager extends InheritedWidget {
  const StateManager({super.key, required this.child, required this.data})
    : super(child: child);

  @override
  final Widget child;

  final String data;

  static StateManager? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StateManager>();
  }

  @override
  bool updateShouldNotify(StateManager oldWidget) {
    return data != oldWidget.data;
  }
}
