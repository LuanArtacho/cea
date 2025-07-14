// lib/pages/desempenho_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// A classe agora não precisa mais receber o parâmetro 'desempenho'
class DesempenhoPage extends StatelessWidget {
  const DesempenhoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Evolução do Desempenho')),
      // O StreamBuilder vai se conectar ao Firebase e ouvir as mudanças em tempo real
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('historico_simulados')
            .orderBy(
              'data',
              descending: false,
            ) // Ordena do mais antigo ao mais novo
            .snapshots(),
        builder: (context, snapshot) {
          // Enquanto os dados não chegam, mostra um círculo de carregamento
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Se não houver dados ou houver menos de 2 simulados, mostra uma mensagem
          if (!snapshot.hasData || snapshot.data!.docs.length < 2) {
            return Center(
              child: Text(
                'Realize pelo menos 2 simulados para ver seu progresso.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Transforma os documentos do Firebase em pontos para o gráfico
          final spots = snapshot.data!.docs.asMap().entries.map((entry) {
            final index = entry.key;
            final doc = entry.value;
            return FlSpot(index.toDouble(), doc['percentual'].toDouble());
          }).toList();

          // Constrói o gráfico de linhas
          return Padding(
            padding: const EdgeInsets.all(20),
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text('${value.toInt()}%');
                      },
                      reservedSize: 40,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text('S${value.toInt() + 1}');
                      },
                      reservedSize: 30,
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d), width: 1),
                ),
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 4,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
