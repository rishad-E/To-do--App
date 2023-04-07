import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/screens/homescreen.dart';

void main()async{
  //initialize hive
 await Hive.initFlutter();

//open box
var taskBox = await Hive.openBox('taskbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}