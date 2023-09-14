import 'package:aula_2/data/data_inherited.dart';
import 'package:aula_2/screens/tela.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter-Demo",
        theme: ThemeData(primarySwatch: Colors.green),
        //TaskInherited só irá funcionar caso ele seja o pai do widget principal.
        home: TaskInherited(child: const Screen()));
  }
}
