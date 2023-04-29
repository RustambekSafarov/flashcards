import 'dart:convert';

import 'package:flashcards/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/todos.dart';

class AddNewScreen extends StatefulWidget {
  AddNewScreen({super.key});
  static const routeName = '/add-new';

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  TextEditingController wordController = TextEditingController();

  TextEditingController translationController = TextEditingController();

  TextEditingController groupController = TextEditingController();

  double baseWidth = 430;

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
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add word',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            context.goNamed('/home');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10 * fem),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10 * fem),
              child: TextField(
                controller: wordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10 * fem),
              child: TextField(
                controller: translationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25 * fem, left: 10 * fem),
                  child: Text('Group'),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 80 * fem,
                  padding: EdgeInsets.only(left: 10 * fem, bottom: 10 * fem),
                  child: TextField(
                    controller: groupController,
                  ),
                ),
              ],
            ),
            FilledButton(
              onPressed: () {
                Provider.of<Todos>(context, listen: false).addTodo(Cart(
                  id: DateTime.now().toIso8601String(),
                  baseWord: wordController.text,
                  translated: translationController.text,
                  group: groupController.text,
                ));

                context.goNamed('/home');
              },
              style: FilledButton.styleFrom(
                // backgroundColor: wordController.text != '' &&
                //         translationController.text != ''
                //     ? Colors.blue
                //     : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(350 * fem, 45 * fem),
              ),
              // : null,
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
