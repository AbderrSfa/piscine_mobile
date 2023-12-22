import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = 'A simple text';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: theme.colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    text = text == 'A simple text'
                        ? 'Hello World!'
                        : 'A simple text';
                  });
                },
                child: const Text('Click me'))
          ],
        ),
      ),
    );
  }
}
