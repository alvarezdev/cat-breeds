import 'dart:async';
import 'package:cat_breeds/shared/constants.dart';
import 'package:cat_breeds/shared/dimensions.dart';
import 'package:flutter/material.dart';
import '../landing/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LandingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.d32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            Text(
              "Cat breeds",
              style: TextStyle(fontSize: Dimensions.d28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Dimensions.d40),
            Image(image: AssetImage(Constants.catImage)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
