import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: TabBar(
        tabs: [
          Column(
            children: [
              Icon(Icons.sunny),
              Text('Currently'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.today),
              Text('Today'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.calendar_month_rounded),
              Text('Weekly'),
            ],
          ),
        ],
      ),
    );
  }
}
