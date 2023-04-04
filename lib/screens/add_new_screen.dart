import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});
  static const routeName = '/add-new';
  @override
  _addCart(String word, String translation, String group) {}

  @override
  Widget build(BuildContext context) {
    TextEditingController wordController = TextEditingController();
    TextEditingController translationController = TextEditingController();
    TextEditingController groupController = TextEditingController();
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add word',
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
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
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
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
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
                  child: TextField(),
                ),
              ],
            ),
            FilledButton(
              onPressed:
                  // wordController.text != '' && translationController.text != ''
                  () {},
              // : null,
              child: Text('Add'),
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
            )
          ],
        ),
      ),
    );
  }
}
