import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String letra;
  final String texto;
  final bool respondeu;
  final String respostaCorreta;
  final String? respostaSelecionada;
  final VoidCallback onPressed;

  const AnswerButton({
    Key? key,
    required this.letra,
    required this.texto,
    required this.respondeu,
    required this.respostaCorreta,
    required this.respostaSelecionada,
    required this.onPressed,
  }) : super(key: key);

  Color _getColor() {
    if (!respondeu) {
      return Colors.blue;
    }
    if (letra == respostaCorreta) {
      return Colors.green;
    }
    if (letra == respostaSelecionada) {
      return Colors.red;
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _getColor(),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              '$letra) ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Text(
                texto,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
