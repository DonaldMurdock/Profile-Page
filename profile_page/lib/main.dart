import 'package:flutter/material.dart';

import 'screens/profile_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(primaryColor: Colors.white),
      home: ProfileScreen()
    );
  }
}

