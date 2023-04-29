import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../provider/todos.dart';

class AllWordsScreen extends StatefulWidget {
  const AllWordsScreen({super.key});
  static const routeName = '/words';

  @override
  State<AllWordsScreen> createState() => _AllWordsScreenState();
}

class _AllWordsScreenState extends State<AllWordsScreen> {
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
    return Consumer<Todos>(
      builder: (context, todo, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              ' words',
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
            itemCount: todo.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: IconButton(
                  icon: Icon(Icons.visibility_outlined),
                  onPressed: () {},
                ),
                title: Text(
                  todo.todos[index].baseWord,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
