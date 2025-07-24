// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:cea_app/data/simulados.dart';
import 'package:cea_app/models/question_model.dart';
import 'package:cea_app/pages/quiz_page.dart';
import 'package:cea_app/pages/desempenho_page.dart';
import 'package:cea_app/pages/historico_page.dart';
import 'package:cea_app/pages/teste_firebase_page.dart'; // 1. Import the new test page

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
            // 2. Add the temporary test button here
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TesteFirebasePage(),
                  ),
                );
              },
              child: const Text('PÁGINA DE TESTE FIREBASE'),
            ),
            const SizedBox(height: 40),

            // --- Rest of your original buttons ---
            ElevatedButton(
              onPressed: () => navegarParaSimulado(
                context,
                simulado100Questoes,
                'Simulado 100 Questões',
              ),
              child: const Text('Simulado 100 Questões CEA'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado1CEA, 'Simulado 1'),
              child: const Text('Simulado 1 CEA'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado2, 'Simulado 2'),
              child: const Text('Simulado 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado3, 'Simulado 3'),
              child: const Text('Simulado 3'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado4, 'Simulado 4'),
              child: const Text('Simulado 4'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoricoPage(),
                  ),
                );
              },
              child: const Text('Ver Histórico de Resultados'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DesempenhoPage(),
                  ),
                );
              },
              child: const Text('Ver Gráfico de Desempenho'),
            ),
          ],
        ),
      ),
    );
  }
}
