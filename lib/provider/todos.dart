import 'package:flutter/material.dart';

import '../models/cart.dart';

class Todos with ChangeNotifier {
  List<Cart> _todos = [];
  List<Cart> get todos {
    return [..._todos];
  }

  addTodo(Cart todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
