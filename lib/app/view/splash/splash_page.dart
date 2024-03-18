import 'package:flutter/material.dart';
import 'package:todo_app/app/view/task_list/task_list_page.dart';
import 'package:todo_app/app/widgets/h1.dart';
import 'package:todo_app/app/widgets/shape.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
               Shape(),
            ],
          ),
          const SizedBox(height: 80),
          Image.asset(
            "assets/images/onboarding-image.png",
            width: 180,
            height: 168,
          ),
          const SizedBox(height: 99),
          const H1('Lista de Tareas'),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const TaskListPage();
              }));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 21, horizontal: 32),
              child: Text(
                'La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
