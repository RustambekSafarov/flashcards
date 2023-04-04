import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
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
        group: 'qaysidir',
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
                          margin: EdgeInsets.all(29 * fem),
                          child: GestureDetector(
                            onTap: _flip,
                            child: TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0, end: angle),
                              duration: Duration(milliseconds: 500),
                              builder: (BuildContext context, double val, __) {
                                //here we will change the isBack val so we can change the content of the card
                                if (val >= (pi / 2)) {
                                  isBack = false;
                                } else {
                                  isBack = true;
                                }
                                return Transform(
                                  //let's make the card flip by it's center
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateY(val),
                                  child: Container(
                                      width: 309,
                                      height: 474,
                                      child: isBack
                                          ? Container(
                                              color: Colors.amber,
                                            ) //if it's back we will display here
                                          : Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.identity()
                                                ..rotateY(
                                                  pi,
                                                ), // it will flip horizontally the container
                                              child: Container(
                                                color: Colors.grey,
                                              ),
                                            ) //else we will display it here,
                                      ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        // enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.ease,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
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
                      onPressed: () {},
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
