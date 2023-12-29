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
    final locationStyle = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.primary,
      fontWeight: FontWeight.bold,
    );
    final titleStyle =
        theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    final errorStyle = titleStyle.copyWith(color: theme.colorScheme.error);

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: !appState.geolocationPermError
          ? [
              Text(
                section,
                style: titleStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                appState.location,
                style: locationStyle,
                textAlign: TextAlign.center,
              ),
            ]
          : [
              Text(
                'Geolocation is not available, please enable it in you App settings',
                style: errorStyle,
                textAlign: TextAlign.center,
              )
            ],
    ));
  }
}
