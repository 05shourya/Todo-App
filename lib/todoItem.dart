// ignore_for_file: camel_case_types

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/boxes.dart';

class ToDoItem extends StatefulWidget {
  final String text;
  final int index;
  final Function callback;

  const ToDoItem({
    super.key,
    required this.text,
    required this.index,
    required this.callback,
  });

  @override
  State<StatefulWidget> createState() {
    return _ToDoItem();
  }
}

class _ToDoItem extends State<ToDoItem> {
  bool isChecked = false;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(
                          todoInfo.getAt(widget.index).text.toString(),
                          style: const TextStyle(fontSize: 20, wordSpacing: 5),
                        ),
                      );
                    });
              },
              onLongPress: () {
                if (!isChecked) {
                  _confettiController.play();
                }
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 20, 24, 32),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 11, 13, 16),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              if (!isChecked) {
                                _confettiController.play();
                              }
                              isChecked = value ?? false;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        widget.text,
                        style: const TextStyle(
                          //   backgroundColor: Colors.red,
                          color: Colors.white,
                          fontSize: 22,
                          //   fontFamily: 'Lexend_Regular',
                          fontFamily: 'GT Walsheim Pro Regular',
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onLongPress: () {},
                      onTap: () {
                        todoInfo.deleteAt(widget.index);
                        widget.callback();
                      },
                      child: const deleteTodo(),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _confettiController,
                // blastDirection: 3 * pi / 2,
                numberOfParticles: 15,
                emissionFrequency: .12,
                blastDirectionality: BlastDirectionality.explosive,
                gravity: 0.1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class deleteTodo extends StatefulWidget {
  const deleteTodo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _deleteTodo();
  }
}

class _deleteTodo extends State<deleteTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 196, 97, 97),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.delete,
        size: 32,
        color: Color.fromARGB(255, 231, 50, 34),
      ),
    );
  }
}
