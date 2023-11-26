import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      height: 60,
      width: double.infinity,
      decoration: const  BoxDecoration(
        color: Colors.amber
      ),
    ),);
  }
}