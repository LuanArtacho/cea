// lib/pages/quiz_page.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cea_app/models/question_model.dart'; // <-- ADICIONE ESTA LINHA
import 'package:cea_app/pages/resultado_page.dart';
import 'package:cea_app/widgets/answer_button.dart';

class QuizPage extends StatefulWidget {
  final List<Question> perguntas;
  final String titulo;

  QuizPage({required this.perguntas, required this.titulo});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int perguntaAtual = 0;
  String? respostaSelecionada;
  bool respondeu = false;
  Timer? _timer;
  int _secondsElapsed = 0;
  int acertos = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void responder(String letra) {
    if (respondeu) return;
    setState(() {
      respostaSelecionada = letra;
      respondeu = true;
      if (letra == widget.perguntas[perguntaAtual].respostaCorreta) {
        acertos++;
      }
    });
  }

  void proximaPergunta() {
    if (perguntaAtual < widget.perguntas.length - 1) {
      setState(() {
        perguntaAtual++;
        respostaSelecionada = null;
        respondeu = false;
      });
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(
            acertos: acertos,
            total: widget.perguntas.length,
            tempo: _formatTime(_secondsElapsed),
          ),
        ),
      );
    }
  }

  void perguntaAnterior() {
    if (perguntaAtual > 0) {
      setState(() {
        perguntaAtual--;
        // Aqui você pode decidir se quer manter o estado da resposta anterior
        // ou resetar. Para este exemplo, vamos resetar.
        respostaSelecionada = null;
        respondeu = false;
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = widget.perguntas[perguntaAtual];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.titulo} - Pergunta ${perguntaAtual + 1}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                _formatTime(_secondsElapsed),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              pergunta.enunciado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (pergunta.imagem != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(
                  pergunta.imagem!,
                ), // Lembre-se de adicionar as imagens em assets
              ),
            SizedBox(height: 20),
            ...pergunta.alternativas.entries.map((entry) {
              return AnswerButton(
                letra: entry.key,
                texto: entry.value,
                respondeu: respondeu,
                respostaCorreta: pergunta.respostaCorreta,
                respostaSelecionada: respostaSelecionada,
                onPressed: () => responder(entry.key),
              );
            }).toList(),
            SizedBox(height: 20),
            if (respondeu)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (perguntaAtual > 0)
                    ElevatedButton(
                      onPressed: perguntaAnterior,
                      child: Text('Anterior'),
                    ),
                  ElevatedButton(
                    onPressed: proximaPergunta,
                    child: Text(
                      perguntaAtual == widget.perguntas.length - 1
                          ? 'Finalizar'
                          : 'Próxima',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
