import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/UI.dart';
import 'package:todo_app/boxes.dart';
import 'package:todo_app/todo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  todoInfo = await Hive.openBox<Todo>('todoInfo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        dialogTheme: DialogTheme(
          backgroundColor:
              const Color.fromARGB(255, 26, 26, 51), // Set the background color
          titleTextStyle:
              const TextStyle(color: Colors.white), // Set title text color
          contentTextStyle:
              const TextStyle(color: Colors.white), // Set content text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: const UI(),
    );
  }
}
