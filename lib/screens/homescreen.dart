import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/database/database.dart';
import 'package:todoapp/utils/alert_dialogue.dart';
import 'package:todoapp/utils/to_do_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//reference of hivebox
  final _taskBox = Hive.box('taskbox');
  TodoDatabase database = TodoDatabase();

  final _controller = TextEditingController();

  void checkboxchanged(bool? value, int index) {
    setState(() {
      database.todoList[index][1] = !database.todoList[index][1];
    });
    database.updateDatabase();
  }

  void saveTask() {
    setState(() {
      database.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    database.updateDatabase();
  }

  void createNewTask() {
    log("message");
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textcontroller: _controller,
          onSave: () => saveTask(),
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      database.todoList.removeAt(index);
    });
    database.updateDatabase();
  }
  @override
  void initState() {
    if (_taskBox.get('TODOLIST')== null ) {
      database.createInitialData();
    }else{
      database.loadData(); 
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.green[200],
      body: ListView.builder(
        itemCount: database.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: database.todoList[index][0],
            taskComplete: database.todoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
