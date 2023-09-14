import 'package:aula_2/data/data_inherited.dart';
import 'package:aula_2/screens/tela_tarefas.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Tarefas"),
      ),
      body: ListView(
        children: TaskInherited.of(context)!.taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Task_Screen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
