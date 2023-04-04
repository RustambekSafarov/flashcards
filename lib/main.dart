import 'package:flashcards/screens/add_new_screen.dart';
import 'package:flashcards/screens/all_words_screen.dart';
import 'package:flashcards/screens/home_screen.dart';
import 'package:flashcards/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreen(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: '/add-new',
          routes: [
            GoRoute(
              path: '/',
              name: HomeScreen.routeName,
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: '/words',
              name: AllWordsScreen.routeName,
              builder: (context, state) => AllWordsScreen(
                volume: (state.extra as List)[0],
                items: (state.extra as List)[1],
              ),
            ),
            GoRoute(
              path: '/animate',
              name: '/animate',
              builder: (context, state) => MyAnimatedContainer(),
            ),
            GoRoute(
              path: '/add-new',
              name: AddNewScreen.routeName,
              builder: (context, state) => AddNewScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
