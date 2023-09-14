import 'package:flutter/material.dart';
import '../components/Task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({required super.child});

  final List<Task> taskList = [ 
    Task(
      task_Name: "Andar",
      difficult: 2,
      image_asset: "",
    )
  ];

  void newTask(String name, String photo, int difficult) {
    taskList.add(Task(task_Name: name, difficult: difficult, image_asset: photo));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override //Este método serve para saber quando a classe será reconstruída.
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
    //Comparando o tamanho da lista no estado antigo com a lista atual.
  }
}
