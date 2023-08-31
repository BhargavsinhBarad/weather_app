import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 8),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("lib/Assets/2.gif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
