class Question {
  final String enunciado;
  final Map<String, String> alternativas;
  final String respostaCorreta;
  final String? imagem;

  Question({
    required this.enunciado,
    required this.alternativas,
    required this.respostaCorreta,
    this.imagem,
  });
}
