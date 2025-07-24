import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TesteFirebasePage extends StatelessWidget {
  const TesteFirebasePage({Key? key}) : super(key: key);

  Future<void> _testarConexao(BuildContext context) async {
    try {
      // Tenta ler todos os documentos da coleção 'teste'
      final snapshot = await FirebaseFirestore.instance
          .collection('teste')
          .get();

      // Se não houver erro, a conexão funcionou
      final mensagem =
          'Conexão com Firebase bem-sucedida! ${snapshot.docs.length} documento(s) encontrado(s).';
      print(mensagem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagem), backgroundColor: Colors.green),
      );
    } catch (e) {
      // Se houver um erro, a conexão falhou
      final mensagem = 'Falha na conexão com Firebase. Erro: $e';
      print(mensagem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensagem), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página de Teste do Firebase')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _testarConexao(context),
          child: Text('Testar Conexão Agora'),
        ),
      ),
    );
  }
}
