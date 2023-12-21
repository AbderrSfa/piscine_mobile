import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex01/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'ex01',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var text = "A simple text";

  void toggleText() {
    text = text == 'A simple text' ? 'Hello world!' : 'A simple text';
    notifyListeners();
  }
}
