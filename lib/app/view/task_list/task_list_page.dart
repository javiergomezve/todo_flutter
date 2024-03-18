import 'package:flutter/material.dart';
import 'package:todo_app/app/model/task.dart';
import 'package:todo_app/app/widgets/h1.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int count = 0;

  final taskList = <Task>[
    Task('flask'),
    Task('react'),
    Task('typescipt'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const H1('Tasks'),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView.separated(
                  itemCount: taskList.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (_, index) => _TaskItem(
                    taskList[index],
                    onTap: () {
                      taskList[index].done = !taskList[index].done;
                      setState(() {});
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showNewTaskModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showNewTaskModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _NewTaskModal(),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem(this.task, {super.key, this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Row(
            children: [
              Icon(
                task.done ? Icons.check_box_outline_blank : Icons.check_box,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewTaskModal extends StatefulWidget {
  const _NewTaskModal({super.key});

  @override
  State<_NewTaskModal> createState() => _NewTaskModalState();
}

class _NewTaskModalState extends State<_NewTaskModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const H1('New tasks'),
          const SizedBox(height: 25),
          TextField(
            decoration: InputDecoration(
              hintText: 'Task description',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(onPressed: () {}, child: Text('Save')),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
