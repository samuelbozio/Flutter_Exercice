
import 'package:flutter/material.dart';

class Task_Screen extends StatefulWidget {
  @override
  State<Task_Screen> createState() => _Task_ScreenState();
}

class _Task_ScreenState extends State<Task_Screen> {
  //-------
  TextEditingController nameController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController difficultController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova Tarefa"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.blue,
                      child: TextFormField(
                          controller: nameController,
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return "Preencha o nome da tarefa.";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                              border: OutlineInputBorder(),
                              hintText: "Nome...",
                              fillColor: Colors.white,
                              filled: true))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //IMAGEM
                    color: Colors.red,
                    child: TextFormField(
                      onChanged: (Text) {
                        setState(() {});
                      },
                      controller: imageController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 1) {
                          return "Insira uma dificuldade entre 1 e 5.";
                        } else
                          {return null;}
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade...",
                          fillColor: Colors.white,
                          filled: true),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green,
                    child: TextFormField(
                        controller: difficultController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Imagem Diretório...",
                            fillColor: Colors.white,
                            filled: true)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 72,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(Icons.photo_library_outlined)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      
                      if (_formKey.currentState!.validate()) {
                        print(nameController.text);
                        print(difficultController);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Salvando nova tarefas")));
                                Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.login))
              ],
            ),
          ),
        ),
      ),
    );
  }
}