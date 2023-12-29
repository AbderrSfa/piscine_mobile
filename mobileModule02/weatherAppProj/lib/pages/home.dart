import 'package:flutter/material.dart';
import 'package:weatherapp_proj/components/my_bottom_app_bar.dart';
import 'package:weatherapp_proj/components/tab_content.dart';
import 'package:weatherapp_proj/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _myAppBar(theme, appState),
        bottomNavigationBar: const MyBottomAppBar(),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TabBarView(
            children: [
              TabContent(section: 'Currently'),
              TabContent(section: 'Today'),
              TabContent(section: 'Weekly'),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _myAppBar(ThemeData theme, MyAppState appState) {
    TextEditingController textFieldController = TextEditingController();

    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      title: TextField(
        controller: textFieldController,
        onSubmitted: (value) {
          appState.setLocation(textFieldController.text);
        },
        cursorColor: theme.colorScheme.onPrimary,
        style: TextStyle(color: theme.colorScheme.onPrimary),
        decoration: InputDecoration(
            hintText: 'Search location...',
            hintStyle: TextStyle(color: theme.colorScheme.onPrimary),
            prefixIcon: GestureDetector(
              onTap: () => appState.setLocation(textFieldController.text),
              child: Icon(
                Icons.search,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () async {
                appState.getGeolocation();
              },
              child: Icon(
                Icons.gps_fixed_rounded,
                color: theme.colorScheme.onPrimary,
              ),
            )),
      ),
    );
  }
}
