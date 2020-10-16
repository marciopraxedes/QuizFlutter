import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    //List<Map<String, Object>>
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'pontuacao': 0},
        {'texto': 'Preto', 'pontuacao': 0},
        {'texto': 'Verde', 'pontuacao': 10},
        {'texto': 'Amarelo', 'pontuacao': 0}
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 0},
        {'texto': 'Gato', 'pontuacao': 10},
        {'texto': 'Arara', 'pontuacao': 0}
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });

    print(_pontuacaoTotal);
  }

  @override
  Widget build(BuildContext context) {
    //for (var textResp in respostas) {
    //  listWidget.add(Resposta(textResp, _responder));
    //}

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              responder: _responder)
          : Resultado(_pontuacaoTotal),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
