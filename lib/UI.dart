// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:Todo/boxes.dart';
import 'package:Todo/todo.dart';
import 'package:Todo/todoItem.dart';

class UI extends StatefulWidget {
  const UI({super.key});
  @override
  State<StatefulWidget> createState() => _UI();
}

class _UI extends State<UI> {
  TextEditingController addTodoController = TextEditingController();

  void AddToDo() {
    if (addTodoController.text.trim().isNotEmpty) {
      todoInfo.add(
        Todo(
          text: addTodoController.text.toString(),
          time: DateTime.now(),
          isChecked: true,
        ),
      );
      setState(() {});
    } else {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Something"),
        ),
      );
    }
    Navigator.of(context).pop();
    addTodoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 27, 27, 46),
            Color.fromARGB(255, 11, 31, 48)
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                "ToDo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend_Regular',
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
          floatingActionButton: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 44, 44, 112),
                  Color.fromARGB(255, 12, 36, 54)
                ],
              ),
            ),
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Add To Do",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      content: TextField(
                        autofocus: true,
                        controller: addTodoController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          labelText: "Enter To do",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 154, 156, 189),
                          ),
                        ),
                        onSubmitted: (String value) {
                          AddToDo();
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: AddToDo,
                          child: const Text("Add"),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colors.transparent,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: ListView.builder(
            itemBuilder: (context, index) {
              return ToDoItem(
                text: todoInfo.getAt(index).text.toString(),
                index: index,
                callback: () {
                  setState(() {});
                },
              );
            },
            itemCount: todoInfo.length,
          ),
        ),
      ),
    );
  }
}
