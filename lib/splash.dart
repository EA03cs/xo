import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:xo/homescreen.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF00061a),
          shadowColor: const Color(0xFF001456),
          splashColor: const Color(0xFF4169e8),
        ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(logo: Image.asset('assets/Picsart_23-10-16_14-32-35-557.png',),
        backgroundColor: const Color(0xFF00061a),
          showLoader: true,
          loaderColor: Colors.white,
          loadingText: Text('enjoy it'.toUpperCase()),
          navigator: const HomePage(),
          durationInSeconds: 5,
          logoWidth: 100,
        ),
      )
    );
  }
}
