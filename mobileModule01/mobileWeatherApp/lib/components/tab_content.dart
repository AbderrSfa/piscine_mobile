import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_proj/main.dart';

class TabContent extends StatelessWidget {
  const TabContent({
    super.key,
    required this.section,
  });

  final String section;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);
    final locationStyle = theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.primary, fontWeight: FontWeight.bold);
    final titleStyle =
        theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          section,
          style: titleStyle,
        ),
        Text(
          appState.location,
          style: locationStyle,
        ),
      ],
    ));
  }
}
