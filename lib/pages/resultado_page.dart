// lib/pages/resultado_page.dart

import 'package:flutter/material.dart';
import 'package:cea_app/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 1. Importe o Firestore

class ResultadoPage extends StatelessWidget {
  final int acertos;
  final int total;
  final String tempo;
  final String tituloSimulado; // 2. Adicione esta linha para receber o título

  ResultadoPage({
    required this.acertos,
    required this.total,
    required this.tempo,
    required this.tituloSimulado, // 3. Adicione este parâmetro
  });

  // 4. Crie a função para salvar os dados no Firebase
  Future<void> _salvarResultado() async {
    try {
      final firestore = FirebaseFirestore.instance;
      // 'historico_simulados' será o nome da nossa coleção no banco de dados
      await firestore.collection('historico_simulados').add({
        'titulo': tituloSimulado,
        'acertos': acertos,
        'totalPerguntas': total,
        'percentual': (acertos / total) * 100,
        'tempo': tempo,
        'data': Timestamp.now(), // Salva a data e hora exatas da finalização
      });
      print('Resultado salvo com sucesso no Firestore!');
    } catch (e) {
      print('Ocorreu um erro ao salvar o resultado: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 5. Chame a função para salvar assim que a página for construída
    // A função é "async", então ela rodará em segundo plano sem travar a UI.
    _salvarResultado();

    double percentual = (acertos / total) * 100;
    bool passou = percentual >= 70;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Simulado'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                passou ? 'Parabéns!' : 'Não foi desta vez!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: passou ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Você acertou $acertos de $total perguntas.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text('Tempo total: $tempo', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                'Desempenho: ${percentual.toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                passou
                    ? '✅ Você atingiu a pontuação para aprovação!'
                    : '⚠️ Você não atingiu 70%. Continue estudando!',
                style: TextStyle(
                  fontSize: 18,
                  color: passou ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text('Voltar ao Início'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
