import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: home(),
    ),
  );
}
