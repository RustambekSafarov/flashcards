import 'package:flashcards/screens/all_words_screen.dart';
import 'package:flashcards/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: [
          GoRoute(
              path: '/home',
              name: HomeScreen.routeName,
              builder: (context, state) => HomeScreen(),
              routes: [
                GoRoute(
                  path: '/words',
                  name: AllWordsScreen.routeName,
                  builder: (context, state) => AllWordsScreen(),
                )
              ])
        ],
      ),
    );
  }
}
