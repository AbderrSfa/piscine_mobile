import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    void onPress() {
      print('Button pressed');
    }

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
                  'A sample text',
                  style: textStyle,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: onPress, child: const Text('Click me'))
          ],
        ),
      ),
    );
  }
}
