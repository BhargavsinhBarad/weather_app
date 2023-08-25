import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wather_app/Screens/home_screen.dart';
import 'package:wather_app/Screens/splash.dart';

import 'Screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (ctx) => Splash(),
        'home': (ctx) => home_Screen(),
      },
    ),
  );
}
