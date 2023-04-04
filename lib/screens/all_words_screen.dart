import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/cart.dart';

class AllWordsScreen extends StatelessWidget {
  int volume;
  List items;
  AllWordsScreen({super.key, required this.volume, required this.items});
  static const routeName = '/words';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$volume words',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            context.goNamed('/home');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed('/add-new');
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: IconButton(
              icon: Icon(Icons.visibility_outlined),
              onPressed: () {},
            ),
            title: Text(
              items[index].baseWord,
            ),
          );
        },
      ),
    );
  }
}
