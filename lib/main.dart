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
  List<String> mensagens = List.empty(growable: true);
  final myController = TextEditingController();
  int iAtual = -1;

  void _adiciona() {
    setState(() {
      mensagens.add(myController.text);
      print(
          "Última Mensagem: ${myController.text} \nQuantidade de mensagens:${mensagens.length}");

      myController.clear();
    });
  }

  void _primeira() {
    setState(() {
      if (mensagens.isNotEmpty) {
        myController.text = mensagens[0];
        iAtual = 0;
      }
    });
  }

  void _ultimo() {
    setState(() {
      if (mensagens.isNotEmpty) {
        myController.text = mensagens[mensagens.length - 1];
      }
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
                        _primeira();
                      },
                      child: const Text("Primeira")),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {
                        _adiciona();
                      },
                      child: const Text('Adicionar')),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        _ultimo();
                      },
                      child: const Text('Ultimo')),
                ],
              ),
            )));
  }
}
