// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:cea_app/data/simulados.dart';
import 'package:cea_app/models/question_model.dart'; // <-- ADICIONE ESTA LINHA
import 'package:cea_app/pages/quiz_page.dart';
import 'package:cea_app/pages/desempenho_page.dart';

class HomePage extends StatelessWidget {
  void navegarParaSimulado(
    BuildContext context,
    List<Question> perguntas,
    String titulo,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(perguntas: perguntas, titulo: titulo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecionar Simulado')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => navegarParaSimulado(
                context,
                simulado100Questoes,
                'Simulado 100 Questões',
              ),
              child: Text('Simulado 100 Questões CEA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado1CEA, 'Simulado 1'),
              child: Text('Simulado 1 CEA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado2, 'Simulado 2'),
              child: Text('Simulado 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado3, 'Simulado 3'),
              child: Text('Simulado 3'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado4, 'Simulado 4'),
              child: Text('Simulado 4'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesempenhoPage(
                      desempenho: {
                        'Simulado 1': 80.0,
                        'Simulado 2': 60.0,
                        'Simulado 3': 90.0,
                      },
                    ),
                  ),
                );
              },
              child: Text('Ver Gráfico de Desempenho'),
            ),
          ],
        ),
      ),
    );
  }
}
