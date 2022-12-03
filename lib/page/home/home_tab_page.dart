

import 'package:flutter/material.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body:
      Center(
        child:
        Text(
          'say something in home screen!', style: theme.textTheme.headline1,
        ),
      ),
    );
  }
}
