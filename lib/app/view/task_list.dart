import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task list'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Icon(Icons.arrow_back)),
        ),
      ),
      body: Center(child: Text('The counter is $count')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
