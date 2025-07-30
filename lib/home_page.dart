import 'package:flutter/material.dart';
import 'package:todoapp/utils/todolist.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todolist = [
    ['learn flutter', false],
    ['say hi', false],
    ['hello there', false],
  ];

  final _newtask = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void savednewtask() {
    setState(() {
      todolist.add([_newtask.text, false]);
      _newtask.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 232, 194),
      appBar: AppBar(
        title: const Text('Simple Todo'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 183, 171),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          return Newitem(
            taskName: todolist[index][0],
            taskcomp: todolist[index][1],
            onChanged: (value) => checkBoxChanged(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _newtask,
                decoration: InputDecoration(
                  hintText: 'Add your task',
                  filled: true,
                  fillColor: Colors.tealAccent.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(onPressed: savednewtask, child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
