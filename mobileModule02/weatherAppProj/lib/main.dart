import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_proj/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String location = '';

  void setLocation(String input) {
    location = input;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}
