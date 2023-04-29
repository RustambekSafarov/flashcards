import 'package:flashcards/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'screens/add_new_screen.dart';
import 'screens/all_words_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

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
          create: (context) => Todos(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              name: SplashScreen.rounteName,
              builder: (context, state) => SplashScreen(),
            ),
            GoRoute(
              path: '/home',
              name: HomeScreen.routeName,
              builder: (context, state) => HomeScreen(),
              routes: [],
            ),
            GoRoute(
              path: '/words',
              name: AllWordsScreen.routeName,
              builder: (context, state) => AllWordsScreen(),
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
