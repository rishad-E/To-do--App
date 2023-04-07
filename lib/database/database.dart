import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  //reference of box
  final _taskBox = Hive.box('taskbox');

  void createInitialData() {
    todoList = [
      ['take medicine', false],
      ['make breakfast', false],
    ];
  }

  void loadData() {
    todoList = _taskBox.get('TODOLIST');
  }

  void updateDatabase() {
    _taskBox.put('TODOLIST', todoList);
  }
}
