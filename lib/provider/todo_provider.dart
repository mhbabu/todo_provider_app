import 'package:flutter/material.dart';
import 'package:provider_app/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todoList = [];

  List<TodoModel> get allTodoList => _todoList;

  void addTodoList(TodoModel todoModel) {
    _todoList.add(todoModel);
    notifyListeners();
  }

  void todoStatusChanged(TodoModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    _todoList[index].toggleIsCompleted();
    notifyListeners();
  }

  void removeTodoList(TodoModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    _todoList.removeAt(index);
    notifyListeners();
  }

}
