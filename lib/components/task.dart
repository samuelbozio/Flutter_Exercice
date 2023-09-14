// ignore: file_names
import 'package:flutter/material.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String task_Name;
  final int difficult;
  final String image_asset;

  const Task({
    super.key,
    // ignore: non_constant_identifier_names
    required this.task_Name,
    required this.difficult, required this.image_asset,
  });

  @override
  State<Task> createState() => _TaskState();
}

int nivel = 0;

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.green),
          height: 140,
        ),
        Column(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color:const  Color.fromARGB(255, 222, 219, 219),
                        width: 72,
                        height: 100,
                        child: Image.asset(widget.image_asset)
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.task_Name,
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Difficult(
                            difficultyLevel: widget.difficult,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  "UP!",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      //Container que contêm o texto e a barra de nível.
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        //Colocamos dentro de um container para delimitar o tamanho.
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.difficult > 0)
                              ? (nivel / widget.difficult) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Text(
                      "Nível: $nivel ",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
