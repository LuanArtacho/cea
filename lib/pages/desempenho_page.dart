import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DesempenhoPage extends StatelessWidget {
  final Map<String, double> desempenho;

  DesempenhoPage({required this.desempenho});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gráfico de Desempenho')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PieChart(
          PieChartData(
            sectionsSpace: 2,
            centerSpaceRadius: 40,
            sections: desempenho.entries.map((entry) {
              return PieChartSectionData(
                value: entry.value,
                title: '${entry.key}\n${entry.value.toStringAsFixed(1)}%',
                color: _getColorForSimulado(entry.key),
                radius: 100,
                titleStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Color _getColorForSimulado(String simulado) {
    // Você pode criar uma lógica de cores mais robusta
    final colors = [
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.red,
    ];
    final index = desempenho.keys.toList().indexOf(simulado);
    return colors[index % colors.length];
  }
}
