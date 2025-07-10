// lib/data/simulados.dart
import 'package:cea_app/models/question_model.dart';

// 🔸 SIMULADO 100 Questoes CEA
// ... (seu simulado de 100 questões aqui) ...
final List<Question> simulado100Questoes = [
  // Suas 100 questões aqui...
];

// SIMULADO 1 CEA
final List<Question> simulado1CEA = [
  // Suas questões do simulado 1 aqui...
];

// SIMULADO 2 (Completo e Corrigido)
final List<Question> simulado2 = [
  Question(
    enunciado: 'Uma das atribuições do Banco Central é:',
    alternativas: {
      'a': 'Emitir papel moeda juntamente com o Conselho Monetário Nacional.',
      'b': 'Disciplinar o crédito em todas as modalidades.',
      'c': 'Definir a taxa de redesconto.',
      'd': 'Estimular investimentos no mercado acionário.',
    },
    respostaCorreta: 'c',
  ),
  Question(
    enunciado:
        'A apólice que cobre riscos de um grupo de pessoas, geralmente funcionários de uma mesma empresa, é chamada de:',
    alternativas: {
      'a': 'Apólice individual',
      'b': 'Apólice de grupo',
      'c': 'Apólice coletiva',
      'd': 'Apólice de acidentes pessoais',
    },
    respostaCorreta: 'c',
  ),
  Question(
    enunciado:
        'Em um Fundo de Investimento, a responsabilidade pela compra e venda dos ativos da carteira é do:',
    alternativas: {
      'a': 'Administrador',
      'b': 'Gestor',
      'c': 'Custodiante',
      'd': 'Auditor independente',
    },
    respostaCorreta: 'b',
  ),
  // ... adicione mais 8-10 questões para completar o simulado 2
];

// NOVO SIMULADO 3
final List<Question> simulado3 = [
  Question(
    enunciado: 'O que significa o termo "default" no contexto financeiro?',
    alternativas: {
      'a': 'O pagamento de um dividendo.',
      'b': 'O não pagamento de uma dívida.',
      'c': 'A compra de um ativo.',
      'd': 'A venda de um ativo.',
    },
    respostaCorreta: 'b',
  ),
  Question(
    enunciado: 'Qual dos seguintes não é considerado um título de renda fixa?',
    alternativas: {
      'a': 'CDB',
      'b': 'Ação',
      'c': 'Debênture',
      'd': 'Tesouro Direto',
    },
    respostaCorreta: 'b',
  ),
  Question(
    enunciado: 'O que é o "spread" bancário?',
    alternativas: {
      'a': 'A taxa de juros que o banco paga aos investidores.',
      'b':
          'A diferença entre a taxa de captação e a taxa de empréstimo do banco.',
      'c': 'Um tipo de investimento de alto risco.',
      'd': 'A comissão cobrada pelo gerente do banco.',
    },
    respostaCorreta: 'b',
  ),
  // ... adicione mais 7-10 questões para o simulado 3
];

// NOVO SIMULADO 4
final List<Question> simulado4 = [
  Question(
    enunciado: 'O que o Índice Bovespa (IBOV) representa?',
    alternativas: {
      'a': 'O desempenho médio das ações mais negociadas na B3.',
      'b': 'A inflação oficial do Brasil.',
      'c': 'A taxa de juros básica da economia.',
      'd': 'O valor do dólar em relação ao real.',
    },
    respostaCorreta: 'a',
  ),
  Question(
    enunciado:
        'Qual a principal característica de um Fundo de Investimento Imobiliário (FII)?',
    alternativas: {
      'a': 'Investir exclusivamente em ações de empresas do setor imobiliário.',
      'b': 'Ser negociado apenas diretamente com o gestor do fundo.',
      'c':
          'Distribuir a maior parte de seus resultados como rendimentos aos cotistas.',
      'd': 'Ter isenção total de imposto de renda sobre os ganhos.',
    },
    respostaCorreta: 'c',
  ),
  Question(
    enunciado: 'O que é "liquidez" em um investimento?',
    alternativas: {
      'a': 'A rentabilidade do investimento.',
      'b': 'O risco de perder dinheiro.',
      'c': 'A facilidade de converter o investimento em dinheiro.',
      'd': 'O prazo de vencimento do investimento.',
    },
    respostaCorreta: 'c',
  ),
  // ... adicione mais 7-10 questões para o simulado 4
];
