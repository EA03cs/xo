import 'package:flutter/material.dart';
import 'package:xo/splash.dart';

void main(){
  runApp(const XO());
}
class XO extends StatelessWidget {
  const XO({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}

