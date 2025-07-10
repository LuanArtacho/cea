import 'package:flutter/material.dart';
import 'package:cea_app/pages/home_page.dart';

class ResultadoPage extends StatelessWidget {
  final int acertos;
  final int total;
  final String tempo;

  ResultadoPage({
    required this.acertos,
    required this.total,
    required this.tempo,
  });

  @override
  Widget build(BuildContext context) {
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
