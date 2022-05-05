import 'package:flutter/material.dart';

void main() {
  runApp(const Principal(title: "Lista de Mensagens"));
}

class Principal extends StatefulWidget {
  const Principal({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Principal> createState() => _PrincipalEstado();
}

class _PrincipalEstado extends State<Principal> {
  final myController = TextEditingController();

  void _mostra() {
    setState(() {
      print("Mensagem:${myController.text}");

      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Lista de Mensagens",
        home: Scaffold(
            appBar: AppBar(title: const Text("Lista de Mensagens")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    "Mensagem:",
                  ),
                  TextField(
                      controller: myController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      minLines: 1,
                      maxLines: 5),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {
                        _mostra();
                      },
                      child: const Text("Mostrar"))
                ],
              ),
            )));
  }
}
