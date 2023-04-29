import 'package:flashcards/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const rounteName = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(HomeScreen.routeName);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash_screen.png'),
        ],
      )),
    );
  }
}
