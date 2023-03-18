import 'package:flutter/foundation.dart';
import 'package:pvdr/model/todo.dart';

class Todoprovider extends ChangeNotifier {
  List<Todo> todo = [];
  addNewTodo(title, Description) {
    var newTodo = Todo(title: title, Description: Description);
    todo.add(newTodo);
    notifyListeners();
  }

  deleteTodo(index) {
    todo.removeAt(index);
    notifyListeners();
  }
}
