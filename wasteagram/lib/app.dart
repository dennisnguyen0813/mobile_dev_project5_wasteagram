import 'package:flutter/material.dart';
import 'package:wasteagram/screens/list_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 5: Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const ListScreen(),
    );
  }
}
