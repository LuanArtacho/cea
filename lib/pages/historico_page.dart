// lib/pages/historico_page.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Usado para formatar a data

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Referência à nossa coleção no Firestore
    final CollectionReference historico = FirebaseFirestore.instance.collection(
      'historico_simulados',
    );

    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Simulados')),
      // StreamBuilder reconstrói a tela sempre que há uma alteração no banco de dados
      body: StreamBuilder<QuerySnapshot>(
        // Ordena os resultados pela data, do mais recente para o mais antigo
        stream: historico.orderBy('data', descending: true).snapshots(),
        builder: (context, snapshot) {
          // Se estiver aguardando dados, mostra um indicador de carregamento
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Se não houver dados, mostra uma mensagem
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'Nenhum simulado foi realizado ainda.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Se houver dados, constrói a lista
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var resultado = snapshot.data!.docs[index];
              double percentual = resultado['percentual'];
              Timestamp timestamp = resultado['data'];
              // Formata a data para um formato legível (ex: 12/07/2025 18:30)
              String dataFormatada = DateFormat(
                'dd/MM/yyyy HH:mm',
              ).format(timestamp.toDate());

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: percentual >= 70
                        ? Colors.green
                        : Colors.red,
                    child: Text(
                      '${percentual.toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    resultado['titulo'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Acertos: ${resultado['acertos']}/${resultado['totalPerguntas']}\n'
                    'Tempo: ${resultado['tempo']}\n'
                    'Data: $dataFormatada',
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
