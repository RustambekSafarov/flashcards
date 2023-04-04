import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/cart.dart';

class HomeScreen extends StatefulWidget with ChangeNotifier {
  HomeScreen({super.key});
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //declare the isBack bool
  bool isBack = true;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    List<Cart> items = [
      Cart(
        id: 1,
        baseWord: 'Something',
        translated: 'Nimadir',
      )
    ];

    return Scaffold(
      body: LayoutBuilder(
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
                    bottom: 40 * fem,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Swipe',
                        style:
                            TextStyle(fontSize: 30 * fem, color: Colors.grey),
                      ),
                      Text(
                        'left or right',
                        style:
                            TextStyle(fontSize: 30 * fem, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 28 * fem,
                        top: 30 * fem,
                        right: 30 * fem,
                        bottom: 15 * fem,
                      ),
                      child: Text(
                        'Group: 1',
                        style: TextStyle(
                          color: Color.fromARGB(255, 80, 80, 80),
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: EdgeInsets.only(
                            left: 50 * fem,
                            right: 50 * fem,
                            top: 10 * fem,
                            bottom: 10 * fem,
                          ),
                          child: FlipCard(
                            speed: 250,
                            direction: FlipDirection.HORIZONTAL,
                            front: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  items[index].baseWord,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            back: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(items[index].translated),
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, shape: CircleBorder()),
                      onPressed: () {},
                      child: Icon(
                        Icons.star_border,
                        color: Colors.grey,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, shape: CircleBorder()),
                      onPressed: () {
                        context.goNamed(
                          '/words',
                          extra: [
                            items.length,
                            items,
                          ],
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 15 * fem,
                          top: 15 * fem,
                          right: 15 * fem,
                          bottom: 15 * fem,
                        ),
                        child: Icon(
                          Icons.copy,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, shape: CircleBorder()),
                      onPressed: () {},
                      child: Icon(
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
      ),
    );
  }
}
