import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    //List<Map<String, Object>>
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Azul', 'Preto', 'Verde', 'Amarelo']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Arara']
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  void _voltar() {
    setState(() {
      _perguntaSelecionada--;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    //for (var textResp in respostas) {
    //  listWidget.add(Resposta(textResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto']),
                  ...respostas
                      .map((t) => Resposta(t, _responder))
                      .toList(), //Três pontinhos se chama 'spread' e serve para preencher percorrendo uma lista
                ],
              )
            : Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _voltar,
                  child: Text('Voltar'),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
