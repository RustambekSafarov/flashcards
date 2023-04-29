import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/todos.dart';

class HomeScreen extends StatefulWidget with ChangeNotifier {
  HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBack = false;
  bool isInit = true;

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
    SharedPreferences prefs;
    Map str;
    getF() async {
      prefs = await SharedPreferences.getInstance();
      str = jsonDecode(prefs.getString('key')!);
    }

    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isInit == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<Todos>(builder: (context, todo, child) {
              return LayoutBuilder(
                builder: (ctx, constrainst) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 28 * fem,
                            top: 50 * fem,
                            right: 30 * fem,
                            bottom: 35 * fem,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Swipe',
                                style: TextStyle(fontSize: 30 * fem, color: Colors.grey),
                              ),
                              Text(
                                'left or right',
                                style: TextStyle(fontSize: 30 * fem, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 28 * fem,
                                top: 15 * fem,
                                right: 30 * fem,
                                bottom: 15 * fem,
                              ),
                              child: const Text(
                                'Group: 1',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 80, 80, 80),
                                ),
                              ),
                            ),
                            CarouselSlider.builder(
                              itemCount: todo.todos.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 50 * fem,
                                    right: 50 * fem,
                                    // top: 5 * fem,
                                    // bottom: 5 * fem,
                                  ),
                                  child: FlipCard(
                                    speed: 250,
                                    direction: FlipDirection.HORIZONTAL,
                                    front: isBack
                                        ? Container(
                                            height: 300 * fem,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F5F5),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(1, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                todo.todos[index].translated,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 300 * fem,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F5F5),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: const [
                                                BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(1, 3)),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                todo.todos[index].baseWord,
                                                style: const TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                    back: isBack
                                        ? Container(
                                            height: 300 * fem,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F5F5),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(1, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                todo.todos[index].baseWord,
                                                style: const TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 300 * fem,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF5F5F5),
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(1, 3),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                todo.todos[index].translated,
                                                style: const TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                // enlargeStrategy: CenterPageEnlargeStrategy.height,
                                enlargeCenterPage: true,
                                autoPlayCurve: Curves.ease,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                enableInfiniteScroll: false,
                                aspectRatio: 1.3,
                                viewportFraction: 0.99,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: const CircleBorder()),
                              onPressed: () {},
                              child: const Icon(
                                Icons.star_border,
                                color: Colors.grey,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: const CircleBorder()),
                              onPressed: () {
                                context.goNamed(
                                  '/words',
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 15 * fem,
                                  top: 15 * fem,
                                  right: 15 * fem,
                                  bottom: 15 * fem,
                                ),
                                child: const Icon(
                                  Icons.copy,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: const CircleBorder()),
                              onPressed: () {
                                setState(() {
                                  isBack = !isBack;
                                });
                              },
                              child: const Icon(
                                Icons.sync_alt,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }),
    );
  }
}
