import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz CPA-20',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

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

// 🔸 SIMULADO 100 Questoes CEA
// Perguntas com imagem e falta adicionar
/* 
16-(D)*
17-(D)*
21-(B)*
23-(C)*
31-(A)*
45-(A)*
52-(B)*
54-(B)*
79-(D)*
83-(C)*
85-(B)*
87-(C)*
88-(A)*
94-(A)*
*/
final List<Question> simulado100Questoes = [
  // Pergunta 01
  Question(
    enunciado:
        'A B3 S/A tem, dentre seus objetivos, a manutenção de ambiente e sistemas adequados à realização de transações de compra e venda de títulos e valores mobiliários e de derivativos:',
    alternativas: {
      'a':
          'com autonomia operacional e dispensada das fiscalizações do Banco Central do Brasil e da Comissão de Valores Mobiliários (CVM).',
      'b':
          'complementados pela prestação de serviços de depositária central e de custódia de mercadorias; de títulos e valores mobiliários; e de outros ativos físicos e financeiros.',
      'c':
          'sendo seus membros proibidos de atuar simultaneamente no mercado de balcão organizado.',
      'd':
          'em mercados livres e abertos, para operações diretas entre quaisquer integrantes do Sistema Financeiro Nacional (SFN).',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 02
  Question(
    enunciado:
        'Conforme expressamente previsto pela regulação, podem constar do objeto social de uma sociedade Distribuidora de Títulos e Valores Mobiliários (DTVM) as atividades de,\nl – emitir moeda eletrônica.\nII – credenciar estabelecimentos comerciais para aceitar diferentes meios de pagamento.\nIII – emitir cartões de crédito.\nIV – intermediar operações de câmbio.\nEstá correto o que se afirmar, APENAS em',
    alternativas: {
      'a': 'II e III.',
      'b': 'l e III.',
      'c': 'II e IV.',
      'd': 'l e IV',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 03
  Question(
    enunciado:
        'Sobre os riscos ASG (Ambiental, Social e Governança), um exemplo de risco de Governança Corporativa em uma empresa é',
    alternativas: {
      'a': 'um acidente que ocasione o derramamento de petróleo em alto mar.',
      'b':
          'a inexistência de departamentos de compliance ou auditoria interna na empresa.',
      'c':
          'um incêndio causado por ingerência em uma área verde nos arredores da empresa.',
      'd':
          'a falta de promoção da diversidade e inclusão pelas empresas dentro do seu quadro de colaboradores.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 04
  Question(
    enunciado:
        'Uma resolução do Conselho de Segurança das Nações Unidas (CSNU) determinou indisponíveis os ativos de um cliente, não residente, e que possui conta corrente em quatro bancos, no Brasil. Esses bancos tomaram as seguintes medidas:\nI – Banco A bloqueou imediatamente todos os ativos da conta desse cliente; e comunicou o ocorrido apenas ao Ministério da Justiça e Segurança Pública.\nII – Banco B aguardou a comunicação do Banco Central do Brasil, autorizando a aplicação da sanção e, após recebê-la, bloqueou todos os ativos da conta desse cliente; e comunicou o ocorrido ao Ministério da Justiça e Segurança Pública e ao Conselho de Controle de Atividades Financeira (COAF).\nIII – Banco C aguardou a comunicação do Banco Central do Brasil, autorizando a aplicação da sanção e, após recebê-la, realizou o bloqueio dos ativos da conta desse cliente; e comunicou o ocorrido apenas ao Ministério da Justiça e Segurança Pública.\nIV – Banco D bloqueou imediatamente todos os ativos da conta desse cliente; e comunicou o ocorrido ao Banco Central do Brasil, Ministério da Justiça e Segurança Pública e ao Conselho de Controle de Atividades Financeira (COAF).\nEstá correto o que se afirmar APENAS em',
    alternativas: {'a': 'I', 'b': 'III', 'c': 'IV', 'd': 'II'},
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 05
  Question(
    enunciado:
        'Os depósitos ou recolhimento compulsórios realizados pelo Banco Central do Brasil (BACEN)\nI – são um mecanismo de combate à inflação e de manutenção da estabilidade financeira.\nII – contribuem para a fluidez do Sistema Brasileiro de Pagamentos (SPB).\nIII – não incidem sobre os recursos de depósitos de poupança.\nEstá correto e que se afirma em:',
    alternativas: {
      'a': 'I e II, apenas.',
      'b': 'I e III, apenas.',
      'c': 'II e III, apenas.',
      'd': 'I, II e III.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 06
  Question(
    enunciado:
        'Umas das possíveis medidas a serem implementadas pelo Banco Central do Brasil (BACEN) para reduzir a quantidade de dinheiro em circulação na economia e a exposição das instituições financeiras ao risco de crédito é',
    alternativas: {
      'a': 'o aumento dos depósitos compulsórios.',
      'b': 'a contenção dos gastos públicos.',
      'c': 'a compra de títulos públicos no Open Market.',
      'd':
          'o aumento da alíquota do Imposto sobre Produtos Industrializados (IPI)',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 07
  Question(
    enunciado:
        'Diante da necessidade de resgatar o crescimento da economia brasileira, o Comitê de Política Monetária (COPOM) do Banco Central promove reduções contínuas da taxa de juros Selic, tornando o cupom cambial baixo. Essa situação pode levar a',
    alternativas: {
      'a':
          'um estímulo ao investidor estrangeiro a vender dólares norte-americanos e comprar reais para aplicar em ativos financeiros.',
      'b':
          'um estímulo ao investidor estrangeiro a vender dólares norte-americanos e comprar ativos bursáteis.',
      'c': 'uma apreciação da moeda nacional.',
      'd':
          'um estímulo ao investidor estrangeiro a vender seus reais e comprar dólares norte-americanos para repatriar os seus recursos.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 08
  Question(
    enunciado:
        'Um determinado país apresenta um déficit no saldo em transações correntes sob um regime de taxas de câmbio flexíveis. Esse déficit pode ser corrigido por uma',
    alternativas: {
      'a': 'desvalorização da moeda nacional.',
      'b': 'valorização da moeda nacional.',
      'c': 'desvalorização da moeda estrangeira.',
      'd': 'diminuição no preço de divisas em moeda nacional.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 09
  Question(
    enunciado:
        'O saldo líquido da Renda Primária no Balanço de Pagamentos representa a',
    alternativas: {
      'a':
          'remuneração dos exportadores de bens e serviços; e importadores de bens e serviços.',
      'b':
          'renda obtida pelo capital de curto prazo em investimentos em carteira, renda dos investimentos diretos no país; renda dos ativos de reserva; e renda com operações de derivativos.',
      'c':
          'remuneração dos exportadores; renda dos investimentos realizados no país; renda dos investimentos em carteira; e renda dos ativos em reserva.',
      'd':
          'remuneração dos trabalhadores; renda dos investimentos diretos no país; renda dos investidores em carteira; e renda dos ativos de reserva.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 10
  Question(
    enunciado:
        'A Balança Comercial, relevante na composição das Transações Correntes do Balanço de Pagamentos, representa o registro das exportações e importações de mercadorias pelo',
    alternativas: {
      'a':
          'seu preço de venda acrescido de todas as despesas, inclusive direitos aduaneiros, bem como os riscos de perdas e danos até a entrega da mercadoria no local designado.',
      'b':
          'custo da mercadoria, inclusas todas as despesas para colocá-las a bordo do meio de transporte escolhido do país de origem para o país de destino, mais os valores referentes aos seguros e fretes.',
      'c':
          'custo da mercadoria acrescido de todas as despesas para colocá-las à custódia do transportador, indicado pelo importador.',
      'd':
          'seu preço de venda acrescido de todas as despesas para colocá-las a bordo do veículo que as transportará do país de origem para o país de destino.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 11
  Question(
    enunciado:
        'Uma indústria moveleira produz armários para cozinhas e os vende a R\$ 1.800,00 por peça. O gasto com matéria-prima para produzir uma peça é de R\$ 500,00. Em relação ao conceito do valor adicionado, no cálculo do Produto Interno Bruto - PIB, a contribuição dessa indústria por peça vendida é de',
    alternativas: {
      'a': 'R\$ 500,00',
      'b': 'R\$ 2.300,00',
      'c': 'R\$ 1.300,00',
      'd': 'R\$ 1.800,00',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 12
  Question(
    enunciado:
        'Um indivíduo contratou um financiamento de R\$ 85.000,00, na modalidade tabela price, que será pago por meio de seis prestações, com a primeira sendo antecipada e as demais vencíveis, respectivamente, em 30, 60, 90, 120 e 150 dias, da data da contratação da operação. O valor das parcelas nas suas respectivas datas de vencimento é de R\$ 14.770,70. A taxa de juros desse empréstimo foi, aproximadamente, de\nDesconsidere eventuais custos de transação e impostos.',
    alternativas: {
      'a': '2,00% a.m.',
      'b': '1,21% a.m.',
      'c': '1,70% a.m.',
      'd': '1,67% a.m.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 13
  Question(
    enunciado:
        'Um indivíduo necessita pagar um tributo no valor de R\$ 1.580,00. O pagamento deverá ser realizado em três vezes, sendo a primeira parcela no ato e as demais a cada 30 dias. Se optar pelo pagamento à vista, o órgão cobrador do tributo oferecerá um desconto de 3,00% sobre o valor devido total. Caso o indivíduo parcele, a taxa de juros embutida no imposto será, aproximadamente, de',
    alternativas: {
      'a': '3,13% a.m.',
      'b': '3,09% a.m.',
      'c': '3,00% a.m.',
      'd': '2,45% a.m.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 14
  Question(
    enunciado:
        'Um investidor pretende acumular R\$ 1.800.000,00 nos próximos 25 anos. Ele, atualmente, possui investimentos em fundos de renda fixa no valor de R\$ 100.000,00. Para atingir o seu objetivo, esse investidor deverá aplicar, mensalmente, o valor de\nDados:\n• desconsidere a inflação e Imposto de Renda (IR) (inclusive antecipação de IR)\n• considere rendimento líquido de 0,80% a. m., durante todo o período, tanto para os valores já investidos quanto para os que serão aplicados',
    alternativas: {
      'a': 'R\$ 2.332,50',
      'b': 'R\$ 1.451,84',
      'c': 'R\$ 571,19',
      'd': 'R\$ 568,65',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 15
  Question(
    enunciado:
        'O custo médio ponderado de capital de uma empresa é influenciado pela alteração do',
    alternativas: {
      'a':
          'custo do capital de giro, do custo do capital de terceiros e da alíquota de imposto de renda que a empresa está sujeita.',
      'b':
          'custo de capital próprio, do custo do capital de terceiros e da alíquota de imposto de renda que a empresa está sujeita.',
      'c':
          'custo de capital próprio, do custo do capital de giro e do custo do capital de terceiros, apenas.',
      'd':
          'custo do capital de terceiros e da alíquota de imposto de renda que a empresa está sujeita, apenas.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 19
  Question(
    enunciado:
        'Um indivíduo contratou um empréstimo de R\$ 150.000,00, que será pago por meio de quatro notas promissórias vencíveis, respectivamente, em 30, 60, 90 e 120 dias, da data da contratação do empréstimo. Os valores a serem pagos nas respectivas datas de vencimento são R\$ 40.000,00; R\$ 50.000,00; R\$ 60.000,00 e R\$ 30.000,00. A taxa de juros desse empréstimo foi, aproximadamente, de',
    alternativas: {
      'a': '4,66% a.m.',
      'b': '10,66% a.m',
      'c': '7,87% a.m.',
      'd': '6,26% a.m',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 20
  Question(
    enunciado:
        'Um investidor realizou um investimento de R\$ 5.000,00 e receberá seus recursos da seguinte forma: R\$ 2.400,00 em 30 dias; R\$ 2.240,00 em 60 dias e R\$ 1.080,00 em 90 dias. Seu custo de oportunidade é de 3,00% a.m. Nesse caso, o valor presente líquido desse investimento será, aproximadamente,',
    alternativas: {
      'a': 'R\$ 419,38',
      'b': 'R\$ 403,33',
      'c': 'R\$ 429,86',
      'd': 'R\$ 409,27',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 22
  Question(
    enunciado:
        'Um gestor de fundo de investimento negociou um lote de Letras do Tesouro Nacional – LTN’s por um Preço Unitário – PU de R\$ 947,17 com vencimento em 124 dias úteis (177 dias corridos). A taxa de juros efetiva deste título foi de',
    alternativas: {
      'a': '11,66% a.a.',
      'b': '11,85% a.a.',
      'c': '8,02% a.a.',
      'd': '17,35% a.a.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 24
  Question(
    enunciado:
        'Um gestor, ao acompanhar as negociações da Letra do Tesouro Nacional (LTN), para vencimento em 126 dias úteis (183 dias corridos), verificou que o título está sendo negociado à taxa de juros de 14,62% a.a.. A expectativa de inflação medida pelo IPCA é de 3,50% para o mesmo prazo da LTN. Dentre as alternativas abaixo, pode-se afirmar que aquela que equivale à aquisição da LTN é a da',
    alternativas: {
      'a':
          'NTN-B Principal de 126 dias úteis, com taxa de juros projetada de 6,95% a.p..',
      'b': 'NTN-F de 126 dias úteis, negociada à taxa de juros de 7,18% a.a..',
      'c':
          'NTN-B Principal de 126 dias úteis, negociada à taxa de juros de 7,00% a.a..',
      'd': 'NTN-F de 126 dias úteis, com taxa de juros projetada de 7,00% a.p.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 25
  Question(
    enunciado:
        'Na oferta pública de ações (underwriting) do tipo melhores esforços (best efforts), a instituição financeira líder, responsável pela estruturação da emissão,',
    alternativas: {
      'a':
          'assume totalmente o risco da colocação das ações no mercado, responsabilizando-se pelo pagamento do valor total das ações vendidas à sociedade emitente.',
      'b':
          'efetua uma oferta global das ações da sociedade emitente, com o objetivo de colocá-las no país de origem e, também, no exterior.',
      'c':
          'assume parcialmente o risco da colocação das ações no mercado, responsabilizando-se apenas pelo pagamento das ações ordinárias vendidas à sociedade emitente.',
      'd':
          'não assume nenhum tipo de responsabilidade sobre a integralização das ações em lançamento e o risco de sua colocação no mercado cabe exclusivamente à sociedade emitente.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 26
  Question(
    enunciado:
        'A instituição financeira intermediária de uma oferta pública de valores mobiliários, que recebeu da empresa emissora a opção de distribuição de lote suplementar, deve',
    alternativas: {
      'a':
          'informar antecipadamente à CVM – Comissão de Valores Mobiliários a data do respectivo exercício e a quantidade exata que será exercida por meio da opção.',
      'b':
          'ajustar o preço dos títulos ofertados adicionalmente conforme a demanda verificada.',
      'c':
          'disponibilizar aos investidores o acesso aos lotes suplementares de ações, na mesma proporção de sua aquisição original.',
      'd':
          'utilizar esse limite em razão da prestação de serviço de estabilização de preços dos valores mobiliários objeto da oferta.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 27
  Question(
    enunciado:
        'Um investidor é detentor de ações de uma companhia cuja Assembleia de Acionistas autorizou um aumento de capital de 30%. O preço unitário de mercado é de R\$ 2,50 por ação e a companhia concedeu um direito de subscrição aos atuais acionistas pelo preço de R\$ 2,40 por ação. Após o exercício do direito de subscrição pelos atuais acionistas, o valor teórico de mercado das ações deverá ser, aproximadamente, de',
    alternativas: {
      'a': 'R\$ 2,40',
      'b': 'R\$ 2,45',
      'c': 'R\$ 2,48',
      'd': 'R\$ 2,50',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 28
  Question(
    enunciado:
        'Em janeiro de 2016, os acionistas de uma companhia aprovaram em Assembleia Geral Extraordinária – AGE uma bonificação correspondente a 60% das reservas de lucros acumuladas no Balanço Patrimonial de 31/12/2015. Antes da aprovação pela AGE, existiam 500 ações em circulação cujo valor contábil era de R\$ 3,00. Após o evento, um investidor que possuía 30% do capital da companhia passará a deter\n• Dado: reservas de lucros acumuladas, em 31/12/2015 = R\$ 1.200,00',
    alternativas: {
      'a': '240 ações.',
      'b': '222 ações.',
      'c': '150 ações.',
      'd': '198 ações.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 29
  Question(
    enunciado:
        'Ao contratar um swap de dólar versus percentual do DI, visando a uma operação de hedge, um importador assumirá uma posição',
    alternativas: {
      'a': 'passiva em dólar e ativa em taxa de juros.',
      'b': 'ativa em dólar e ativa em taxa de juros.',
      'c': 'ativa em dólar e passiva em taxa de juros.',
      'd': 'passiva em dólar e passiva em taxa de juros.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 30
  Question(
    enunciado:
        'O titular de uma opção de venda (put) de uma ação negociada na Bolsa de Valores, no vencimento, terá',
    alternativas: {
      'a': 'o direito de comprar a ação.',
      'b': 'a obrigação de vender a ação.',
      'c': 'o direito de vender a ação.',
      'd': 'a obrigação de comprar a ação.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 32
  Question(
    enunciado:
        'Ao contratar um swap de dólar versus percentual do DI, visando a uma operação de hedge, um exportador assumirá uma posição',
    alternativas: {
      'a': 'passiva em dólar e ativa em taxa de juros.',
      'b': 'ativa em dólar e ativa em taxa de juros.',
      'c': 'ativa em dólar e passiva em taxa de juros.',
      'd': 'passiva em dólar e passiva em taxa de juros.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 33
  Question(
    enunciado:
        'Admita que um importador tenha comprado 1.400 contratos de dólar futuro com vencimento no mês de outubro, ao PU de 5.180,200 pontos no dia 1. O importador encerrou a sua posição comprada no dia 4, vendendo 1.400 contratos ao PU de 5.265,600 pontos. De acordo com esses dados, o importador obteve na operação',
    alternativas: {
      'a': 'prejuízo de R\$ 5.978.000.',
      'b': 'lucro de R\$ 119.560.',
      'c': 'prejuízo de R\$ 119.560.',
      'd': 'lucro de R\$ 5.978.000.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 34
  Question(
    enunciado:
        'A taxa de juros com base no contrato de DI futuro, para vencimento em 85 dias úteis (123 dias corridos), é negociada a 11,25% a.a. (exponencial: 252 dias úteis). O cupom cambial em taxa anual, para o mesmo período de tempo, é negociado a 6,00% a.a. (linear: 360 dias corridos). Se o dólar spot no momento for cotado a 3,1830 R\$/USS, o dólar futuro, para vencimento em 123 dias corridos (85 dias úteis), deverá ser negociado a',
    alternativas: {
      'a': 'R\$ 3,2361 por US\$ 1,00',
      'b': 'R\$ 3,2857 por US\$ 1,00',
      'c': 'R\$ 3,2869 por US\$ 1,00',
      'd': 'R\$ 3,2333 por US\$ 1,00',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 35
  Question(
    enunciado:
        'O gestor de um fundo de ações, em janeiro de 2015, negociou 10 contratos do Ibovespa Futuro com vencimento para dezembro de 2015 a 46.000 pontos, realizando um hedge para se proteger contra a queda do Ibovespa. No vencimento dos contratos, o Ibovespa Futuro estava sendo negociado a 67.000 pontos. Se cada ponto equivale a R\$ 1,00, em relação ao total dos ajustes diários, pode-se afirmar que o fundo\n• Dado: desconsidere os custos de corretagem e outras despesas',
    alternativas: {
      'a': 'recebeu R\$ 210.000,00',
      'b': 'recebeu R\$ 21.000,00',
      'c': 'pagou R\$ 210.000,00',
      'd': 'pagou R\$ 21.000,00',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 36
  Question(
    enunciado:
        'Um importador comprou do exterior, na data de hoje, produtos por USS 100 milhões, a serem pagos no prazo de 120 dias corridos (ou 75 dias úteis). O dólar spot (à vista) está cotado a R\$ 5,15 e o mercado de swaps “dólar x taxa pré” cotado à variação do dólar x 12% ao ano over. Para fazer o hedge, o importador deveria estar na ponta “X” do swap e se no vencimento da operação o dólar estiver cotado a R\$ 5,25, ele terá um resultado “Y”. Os termos que substituem corretamente “X” e “Y”, respectivamente, são:',
    alternativas: {
      'a': '“passiva” e “positivo de R\$ 10.000.000,00”.',
      'b': '“ativa” e “negativo de R\$ 7.666.580,58”.',
      'c': '“passiva” e “negativo de R\$ 6.569.569,00”.',
      'd': '“ativa” e “positivo de R\$ 6.569.569,00”.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 37
  Question(
    enunciado:
        'Uma operação típica de repo (Repurchase Agreement) no mercado internacional de renda fixa, a parte que vende os títulos',
    alternativas: {
      'a': 'mantém os direitos de propriedade sobre os titulos.',
      'b':
          'recebe eventuais pagamentos de cupom ocorridos ao longo da operação.',
      'c': 'empresta recursos à outra contraparte.',
      'd': 'recebe da contraparte a taxa de juros da operação (repo rate).',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 38
  Question(
    enunciado:
        'O Tesouro Norte-Americano realizará um leilão de títulos públicos. Os investidores que pretendam adquirir títulos do tipo zero cupom e títulos que os protejam de uma alta inflacionária deverão comprar, respectivamente,',
    alternativas: {
      'a': 'T-Notes e TIPS',
      'b': 'T-Bills e TIPS',
      'c': 'T-Notes e T-Bonds',
      'd': 'T-Bills e T-Bonds',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 39
  Question(
    enunciado:
        'São títulos negociados no mercado norte-americano que implicam risco de reinvestimento no recebimento de cupons',
    alternativas: {
      'a': 'T-Notes e T-Bills',
      'b': 'T-Bills e TIPS',
      'c': 'T-Bills e T-Bonds',
      'd': 'T-Notes e T-Bonds',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 40
  Question(
    enunciado:
        'NÃO são exemplos de renda tributável, renda isenta e renda de tributação exclusiva ou definitiva, respectivamente,',
    alternativas: {
      'a':
          'ganhos de representantes comerciais autônomos; rendimentos de Letra de Crédito do Agronegócio (LCA) e Participação nos Lucros e Resultados (PLR).',
      'b':
          'pró-labore; rendimentos de Letra de Crédito Imobiliário (LCI) e Juros sobre Capital Próprio.',
      'c':
          'recebimentos de aluguéis; rendimentos de debêntures e rendimentos de previdência complementar.',
      'd': 'férias; rendimentos de poupança e 13° salário.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 41
  Question(
    enunciado:
        'Um investidor, pessoa física, residente e domiciliado no Brasil comprou a termo, em Bolsa de Valores, 5.000 ações de uma empresa, com vencimento para 30 dias, ao preço de R\$ 5,00 por ação. O valor do contrato totalizou R\$ 25.000,00. No vencimento do termo, o investidor vendeu no mercado à vista as 5.000 ações ao preço de R\$ 15,00 por ação. Nesse caso, o Imposto de Renda foi:\n• Dado: desconsidere os custos de corretagem e outras despesas',
    alternativas: {
      'a': 'R\$ 10.000,00',
      'b': 'R\$ 11.250,00',
      'c': 'R\$ 13.750,00',
      'd': 'R\$ 7.500,00',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 42
  Question(
    enunciado:
        'Os rendimentos recebidos na forma de dividendos por um investidor, residente e domiciliado no Brasil, referentes a sua carteira de ações no Brasil e a sua carteira de ADRs negociados em Nova lorque, respectivamente, serão',
    alternativas: {
      'a':
          'isentos de Imposto de Renda e tributados à alíquota de 15,00% na declaração anual do imposto de renda.',
      'b': 'isentos de Imposto de Renda e isentos de Imposto de Renda.',
      'c':
          'isentos de Imposto de Renda e tributados à alíquota de até 27,50% (carne-leão).',
      'd':
          'tributados à alíquota de 15,00% na fonte e isentos de Imposto de Renda.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 43
  Question(
    enunciado:
        'Em 05/05/2015, uma pessoa física, residente e domiciliada no Brasil, adquiriu 50 contratos futuros de Ibovespa com cotação de 68.050 pontos e os vendeu, no mesmo dia, utilizando a mesma corretora de valores, pela cotação de 68.550 pontos. Nesse caso, se cada ponto equivale a R\$ 1,00, o Imposto de Renda retido na fonte pela corretora foi\nDado: desconsidere os custos de corretagem e outras despesas',
    alternativas: {
      'a': 'R\$ 250,00',
      'b': 'R\$ 5.000,00',
      'c': 'R\$ 3.750,00',
      'd': 'R\$ 0,00',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 44
  Question(
    enunciado:
        'Um investidor, pessoa física, domiciliado e residente no Brasil, realizou duas operações de hedge cambial, pelo prazo de 240 dias corridos, utilizando um contrato de swap cambial e um de Non Deliverable Forward (NDF). Recebeu dois créditos em conta corrente: R\$ 75.000,00 referentes ao contrato de swap cambial e R\$ 75.000,00 referentes ao contrato de NDF. Nesse caso, o Imposto de Renda devido pelo investidor será',
    alternativas: {
      'a': 'R\$ 11.250,00 tanto para o swap quanto para o NDF.',
      'b': 'R\$ 11.250,00 sobre o swap e R\$ 15.000,00 sobre o NDF.',
      'c': 'R\$ 15.000,00 sobre o swap e R\$ 11.250,00 sobre o NDF.',
      'd': 'R\$ 15.000,00 tanto para o swap quanto para o NDF.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 46
  Question(
    enunciado:
        'Um investidor de um fundo cambial reclama que não obteve a totalidade da expressiva desvalorização ocorrida do real. O mesmo deve ser informado de que, além da taxa de administração,',
    alternativas: {
      'a':
          'o spread existente entre as cotações de compra e venda de moeda estrangeira reduz a rentabilidade do fundo.',
      'b':
          '105355 b) a existência de fusos horários nos principais mercados financeiros inibe a correta precificação de ativos denominados em moeda estrangeira.',
      'c':
          'a redução do cupom cambial poderá ter impacto negativo no valor da cota.',
      'd':
          'a elevação do cupom cambial poderá provocar desvalorização da cota.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 47
  Question(
    enunciado:
        'O objetivo de uma classe Renda Fixa Simples de um Fundo de Investimento destinado ao segmento de varejo é o de ter uma carteira de títulos com baixo risco de crédito e baixo risco de mercado. Esse objetivo é atingido com uma carteira composta por',
    alternativas: {
      'a': 'títulos do governo federal e de alta duração.',
      'b': 'títulos de instituições financeiras e de baixa duração.',
      'c': 'títulos do governo federal e de baixa duração.',
      'd': 'títulos de instituições financeiras e de alta duração.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 48
  Question(
    enunciado:
        'Um investidor que queira investir em fundos de investimento em ações (FIA) abertos, indexados ao Ibovespa, ou em ETF (Exchage Traded Funds), que tenham como referência o Ibovespa,',
    alternativas: {
      'a':
          'pode comprar e vender o ETF em sua instituição financeira distribuidora; e comprar e vender o FIA na B3, via home broker.',
      'b': 'pode comprar e vender ambos os fundos na B3, via home broker.',
      'c':
          'pode comprar e vender o ETF na B3, via home broker; e comprar e vender o FIA em sua instituição financeira distribuidora.',
      'd':
          'pode comprar e vender ambos os fundos em suas respectivas instituições financeiras distribuidoras.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 49
  Question(
    enunciado:
        'Um fundo multimercado de capital protegido oferece as seguintes rentabilidades a seus investidores, em um dado período:\n− 110% da Taxa DI do período, se ocorrer alta superior a 20% do Ibovespa a qualquer momento\n− 100% da Taxa DI do período, se a variação do Ibovespa ficar entre 0% e 20% ao final desse período\n− 0%, se a variação do Ibovespa for negativa ao final do período\nConsidere os seguintes dados realizados:\n− Ibovespa, em pontos, no dia da aplicação: 65.000\n− Ibovespa, em pontos, no dia do resgate: 75.000\n− Taxa DI acumulada no período do investimento: 4,50%\n− despreze os custos de transação e taxas de administração nos cálculos\nCaso um investidor tenha aplicado R\$ 10.000.000,00 nesse fundo e o Ibovespa tenha atingido cotação máxima de 79.500 pontos, o rendimento bruto será de',
    alternativas: {
      'a': 'R\$ 1.538.461,54',
      'b': 'R\$ 223.076,92',
      'c': 'R\$ 450.000,00',
      'd': 'R\$ 495.000,00',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 50
  Question(
    enunciado:
        'Considere um investidor que tenha comprado 1.000 cotas de um fundo multimercado com a seguinte alocação:\n− 10% em moeda (dólar norte-americano)\n− 30% em renda variável (ETF que replica o Ibovespa)\n− 60% em renda fixa (100% pós-fixado em Taxa DI)\nSupondo a manutenção desses percentuais, desde a sua entrada no fundo até o resgate, e as condições abaixo no período de investimento:\n− valorização do dólar norte-americano: 15,00%\n− desvalorização do Ibovespa: 20,00%\n− Taxa DI acumulada no período: 10,00%\nAs cotas compradas, desconsiderando quaisquer taxas e custos associados à operação, tiveram um retorno acumulado no período de',
    alternativas: {'a': '1,50%', 'b': '1,20%', 'c': '1,67%', 'd': '5,00%'},
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 51
  Question(
    enunciado:
        'Um investidor, pessoa física, residente e domiciliado no Brasil, estará isento da cobrança de Imposto de Renda nos rendimentos distribuídos por um Fundo de Investimento Imobiliário (FI), caso\nI – as cotas sejam negociadas exclusivamente em mercados de bolsa ou balcão organizado.\nII – o FII possua, no mínimo, 100 cotistas.\nIII – o cotista possua, no máximo, 10% da totalidade das cotas.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'II e III, apenas.',
      'b': 'l e III, apenas.',
      'c': 'I, II e III.',
      'd': 'I e II, apenas.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 53
  Question(
    enunciado:
        'Em junho de 2018, um investidor adquiriu cotas da classe de um fundo de investimento de renda fixa curto prazo no valor de R\$ 100.000,00 e, até o final de novembro, a classe desse fundo obteve um rendimento de 10,00%. Caso esse investidor não resgate suas cotas, o valor líquido no primeiro dia útil de dezembro será, aproximadamente, de',
    alternativas: {
      'a': 'R\$ 108.500,00',
      'b': 'R\$ 110.000,00',
      'c': 'R\$ 108.000,00',
      'd': 'R\$ 107.750,00',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 55
  Question(
    enunciado:
        'Segundo o Código de Administração e Gestão de Recursos de Terceiros da ANBIMA, a gestão do risco de liquidez da carteira de um Fundo Renda Fixa Aberto, destinado a investidores não qualificados, deverá ser desempenhada pelo:\nI – administrador.\nII – custodiante.\nIII – gestor.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'III, apenas.',
      'b': 'I e III, apenas.',
      'c': 'I e II, apenas.',
      'd': 'II, apenas.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 56
  Question(
    enunciado:
        'Segundo as Regras e Procedimentos de Administração e Gestão de Recursos de Terceiros da ANBIMA, para o Apreçamento dos veículos de investimentos, podemos afirmar que:\nI – as regras, procedimentos e metodologias utilizadas pelo Administrador Fiduciário no apreçamento dos ativos financeiros dos veículos de investimento, sob sua administração, deverão ser públicas.\nII – o Administrador Fiduciário deverá divulgar em seu site versão completa do seu Manual de Apreçamento.\nIII – as informações de preços ou fatores utilizados no Apreçamento de ativos financeiros deverão ser convertidos da moeda estrangeira para a moeda nacional, utilizando a taxa de câmbio referencial (D2), divulgada pela B3.\nEstá correto o que se afirma em',
    alternativas: {
      'a': 'I, II e III.',
      'b': 'I e II, apenas.',
      'c': 'I e III, apenas.',
      'd': 'II e III, apenas.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 57
  Question(
    enunciado:
        'Segundo as Regras e Procedimentos de Administração e Gestão de Recursos de Terceiros da ANBIMA para o Apreçamento dos Fundos de Investimento,\nI – o Administrador Fiduciário é o responsável final pelo apreçamento dos ativos financeiros integrantes das carteiras de investimento dos fundos sob sua administração.\nII – o Administrador Fiduciário deve divulgar, no mínimo, a versão simplificada do seu Manual de Apreçamento.\nIII – a instituição responsável pelo apreçamento dos ativos financeiros dos fundos não pode adotar preços ou procedimentos de mensuração diversos, quando se tratar de um mesmo ativo financeiro.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'I e II, apenas.',
      'b': 'I, II e III.',
      'c': 'I e III, apenas.',
      'd': 'II e III, apenas.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 58
  Question(
    enunciado:
        'Paulo estava aposentado por um plano de previdência complementar há cinco anos, quando ficou doente e, infelizmente, veio a falecer. Após o falecimento, sua esposa Luciana, continuou recebendo a aposentadoria integral por mais 15 anos. Nesse caso, o tipo de renda atuarial habilitada no plano de Paulo é o de',
    alternativas: {
      'a': 'renda vitalícia com prazo mínimo garantido.',
      'b': 'renda vitalícia com reversão ao beneficiário indicado.',
      'c': 'renda vitalícia, apenas.',
      'd': 'renda temporária.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 59
  Question(
    enunciado: 'Nos planos de previdência complementar, a tábua atuarial',
    alternativas: {
      'a': 'antiga não beneficia ao participante.',
      'b': 'mais recente implica maior privilégio ao participante.',
      'c': 'é importante nos casos em que se deseja habilitar renda mensal.',
      'd': 'é atualizada a cada cinco anos.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 60
  Question(
    enunciado:
        'Camila, uma psicóloga aposentada de 67 anos de idade, recebe renda mensal vitalícia do seu plano de previdência complementar há dois anos. Com a oportunidade da aquisição de um imóvel, ela pretendeu resgatar parte de sua reserva para concretizar o negócio, porém, a seguradora informou-lhe não ser possível. A negativa recebida explica-se pelo fato de a',
    alternativas: {
      'a':
          'reserva estar investida para o longo prazo e, portanto, só conseguiria resgatá-la daqui há dois anos.',
      'b': 'renda mensal cessar ao resgatar a reserva.',
      'c':
          'reserva não ser suficiente para a renda vitalícia acrescida do resgate pretendido.',
      'd': 'reserva acumulada não ser mais dela.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 61
  Question(
    enunciado:
        'Um investidor, ao aplicar recursos em um plano de previdência complementar do tipo Plano Gerador de Benefício Livre (PGBL) de Renda Fixa Pós-Fixada, durante a fase de contribuição, assumirá',
    alternativas: {
      'a':
          'o risco de mercado dos ativos que compõem a carteira do fundo de investimento especialmente constituído para o plano, apenas.',
      'b':
          'tanto o risco de crédito da seguradora proprietária do plano quanto o de mercado dos ativos que compõem a carteira do fundo de investimento especialmente constituído para o plano.',
      'c':
          'tanto o risco de crédito do administrador do plano, quanto o de mercado dos ativos que compõem a carteira de fundo de investimento especialmente constituído para o plano.',
      'd': 'o risco de crédito da seguradora proprietária do plano, apenas.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 62
  Question(
    enunciado:
        'Um indivíduo, 75 anos de idade, residente e domiciliado no Brasil, recebeu uma herança inesperada, vinda de um parente distante. Atualmente, a sua aposentadoria pelo Regime Geral de Previdência Social (RGPS) é insuficiente para honrar os compromissos mensais e foi aconselhado pelo especialista de investimentos a utilizar o montante recebido para realizar um aporte único em um plano de previdência complementar, com benefício de renda vitalícia. Nesse caso,\nI – é vedada a contratação de plano de previdência complementar por pessoas com mais de 65 anos de idade.\nII – não é permitida a contratação de plano de previdência complementar, com benefício de renda vitalícia, mediante um aporte único.\nIII – dentre os tipos de rendas atuariais disponíveis, a renda temporária é a que proporciona o maior valor mensal.\nIV – não existe tempo mínimo de permanência no plano de previdência complementar para optar pela transformação da reserva em renda mensal.\nEstá correto o que se afirmar em',
    alternativas: {'a': 'I e IV.', 'b': 'III e IV.', 'c': 'I.', 'd': 'l e ll.'},
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 63
  Question(
    enunciado:
        'Ricardo, solteiro, sem filhos, 45 anos de idade, residente e domiciliado no Brasil, é empregado de uma empresa. Recebe um salário mensal de R\$ 25.000,00 e possui um apartamento alugado que lhe rende mais R\$ 5.000,00, totalizando uma renda mensal de R\$ 30.000,00. Ele pretende trabalhar por mais 25 anos e, posteriormente, se aposentar. Procurou um especialista em investimentos para orientá-lo na contratação de um plano de previdência complementar e recebeu as seguintes informações:\nI – Para capturar o benefício fiscal proporcionado pela contratação de um plano do tipo PGBL é preciso possuir vínculo com o Regime Geral de Previdência Social ou com o Regime Próprio de Previdência Social.\nII – O plano do tipo VGBL é o mais indicado para constituir uma reserva para a sua aposentadoria, pois é o único que possibilita a transformação da reserva em renda mensal vitalícia.\nIII – Para a contratação de um plano do tipo PGBL, com benefício de postergar seu imposto, é necessária a utilização do modelo completo da Declaração de Ajuste Anual do Imposto de Renda da pessoa física.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'I, II e III.',
      'b': 'I e II, apenas.',
      'c': 'II e III, apenas.',
      'd': 'I e III, apenas.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 64
  Question(
    enunciado:
        'A modalidade do Plano Gerador de Benefício Livre (PGBL) é utilizada como ferramenta de planejamento tributário, uma vez que reduz a base de cálculo para cobrança do Imposto de Renda. Tal redução é justificada',
    alternativas: {
      'a': 'pelo aumento do volume de despesas dedutíveis daquela base.',
      'b': 'pelo aumento do Imposto de Renda retido na fonte.',
      'c': 'pela diminuição do Imposto de Renda no ajuste anual.',
      'd': 'pela diminuição da alíquota que incide sobre aquela base.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 65
  Question(
    enunciado:
        'Um investidor possui uma reserva significativa em um plano de previdência complementar antigo, cujo objetivo é o de transformá-lo em renda mensal para complementação de orçamento na aposentadoria próxima. Após consulta, diante do cenário atual, verificou que a rentabilidade do fundo é baixa e a taxa de administração alta. Nesse caso, um especialista de investimento deve recomendar-lhe que',
    alternativas: {
      'a':
          'resgate todo o valor acumulado no plano para conseguir maior rentabilidade em outro tipo de investimento e, na época da aposentadoria, administrar a reserva por meio de resgates parciais.',
      'b':
          'faça a portabilidade interna para um plano com melhor rentabilidade e menor taxa de administração, contribuindo para o aumento da reserva acumulada e, na época da aposentadoria, contrate novamente um outro com tábua atuarial antiga utilizado para receber a reserva e realizar a habilitação da renda mensal.',
      'c':
          'aproveite o tempo que ainda falta para a aposentadoria e realize a portabilidade interna para um plano com menor taxa de administração, de forma que capture melhor rentabilidade para potencializar a acumulação de sua reserva.',
      'd':
          'mantenha seu plano atual, uma vez que o intuito é o da habilitação de renda, pois planos antigos tendem a possuir tábuas atuariais mais vantajosas em relação aos valores de projeção de renda mensal.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 66
  Question(
    enunciado:
        'Um cirurgião dentista, 53 anos de idade, residente e domiciliado no Brasil, pretende se aposentar aos 65 anos. Preocupado com a sua renda na aposentadoria, quer iniciar um plano de previdência complementar, contribuindo com R\$ 1.200,00 ao mês. Como o seu perfil de investidor tolera riscos, escolheu um plano que projeta ganhos de 8,00% a.a. e com taxa de carregamento na entrada de 2,00% sobre as contribuições. Nesse caso, o montante acumulado, antes dos impostos, quando ele completar 12 anos de contribuição, será',
    alternativas: {
      'a': 'R\$ 279.273,66',
      'b': 'R\$ 284.973, 12',
      'c': 'R\$ 277.488,30',
      'd': 'R\$ 283.151,32',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 67
  Question(
    enunciado:
        'Um investidor, residente e domiciliado no Brasil, procurou um especialista em investimento para aconselhá-lo na escolha de um plano de previdência complementar da modalidade Plano Gerador de Benefício Livre (PGBL) no qual pretende permanecer por 10 anos, realizando um único aporte no valor de R\$ 25.000,00. Quatro opções de planos de mesma modalidade são apresentadas ao investidor que diferem, apenas nas taxas de carregamento de entrada e administração. Ao considerar um rendimento projetado da carteira de 14,00% a.a. para todo o período, a MELHOR opção de composição que contempla as taxas de carregamento e administração e, respectivamente,',
    alternativas: {
      'a': '3,00% e 0,80% a.a',
      'b': '1,00% e 1,40% a.a.',
      'c': '2,00% e 1,10% a.a.',
      'd': '4,00% e 0,50% a.a.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 68
  Question(
    enunciado:
        'Carolina, 30 anos de idade, residente e domiciliada no Brasil, trabalha na iniciativa privada e recebe um salário mensal bruto de R\$ 18.000,00. Possui investimentos financeiros no valor total de R\$ 300.000,00, sendo R\$ 120.000,00 aplicados em um plano de previdência complementar do tipo Plano Gerador de Benefício Livre (PGBL), para o qual ela faz questão de utilizar todo o diferimento fiscal que lhe é permitido. Nesse PGBL, ela faz contribuições mensais de R\$ 2.160,00 e deposita todo o 13° salário como contribuição adicional, ao final de cada ano. Diante do contexto, um especialista de investimentos deve recomendar-lhe',
    alternativas: {
      'a':
          'cancelar as contribuições mensais no PGBL e manter apenas a contribuição anual no valor do 13° salário.',
      'b':
          'manter as contribuições mensais no PGBL em 12,00% da renda bruta mensal tributável e reduzir a contribuição anual para metade do 13° salário.',
      'c':
          'manter as contribuições mensais para o PGBL e diminuir a contribuição anual para 12,00% do 13° salário.',
      'd':
          'continuar a aplicar o valor mensal no PGBL e contratar um plano do tipo Vida Gerador de Benefício Livre (VGBL) para o 13° salário.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 69
  Question(
    enunciado:
        'Um investidor realiza um único aporte, hoje, de R\$ 500.000,00 em um plano de previdência complementar do tipo Vida Gerador de Benefício Livre – VGBL, com regime de tributação exclusivo na fonte (tabela regressiva) e solicita a um especialista em investimento que faça uma simulação de seu saldo líquido, após 15 anos. Nesse caso, este especialista informará que o saldo líquido nesse plano, ao final do 15° ano será, aproximadamente, de\n• Dado: rendimento bruto anual constante para os 15 anos: 8,00% a.a.',
    alternativas: {
      'a': 'R\$ 1.477.476, 10',
      'b': 'R\$ 1.586.084,56',
      'c': 'R\$ 1.427.476, 10',
      'd': 'R\$ 977.476, 10',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 70
  Question(
    enunciado:
        'Um indivíduo, 35 anos de idade, pretende se aposentar aos 65 anos. Sua única fonte de renda é o seu salário mensal de R\$ 16.000,00 e ele possui, atualmente, uma capacidade de poupança equivalente a 10% de sua renda. Realiza a Declaração de Ajuste Anual do Imposto de Renda no modelo simplificado e suas despesas dedutíveis, incluindo a contribuição ao Instituto Nacional do Seguro Social (INSS), representam pouco mais de 18% de sua renda anual tributável. Nesse caso, a MELHOR opção será:',
    alternativas: {
      'a':
          'manter o modelo da Declaração e contribuir para um plano de previdência complementar do tipo Plano Gerador de Benefício Livre (PGBL).',
      'b':
          'alterar o modelo da Declaração no próximo ano e contribuir para um plano de previdência complementar do tipo Plano Gerador de Benefício Livre (PGBL).',
      'c':
          'manter o modelo da Declaração e contribuir para um plano de previdência complementar do tipo Vida Gerador de Benefício Livre(VGBL).',
      'd':
          'alterar o modelo da Declaração no próximo ano e contribuir para um plano de previdência complementar do tipo Vida Gerador de Benefício Livre (VGBL).',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 71
  Question(
    enunciado:
        'Um indivíduo, 38 anos de idade, realizou uma única aplicação no valor de R\$ 500.000,00, em um plano de previdência complementar do tipo Plano Gerador de Benefício Livre (PGBL), com regime de tributação exclusivo na fonte (tabela regressiva). Caso esse indivíduo efetue o resgate total aos 50 anos de idade e o rendimento bruto anual do PGBL seja constante de 11,00% a.a., durante todo o período, ele receberá o valor líquido de\n• Dado: desconsidere outras taxas e deduções',
    alternativas: {
      'a': 'R\$ 1.574.302,77',
      'b': 'R\$ 1.268.188,34',
      'c': 'R\$ 1.624.302,77',
      'd': 'R\$ 1.486.841,50',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 72
  Question(
    enunciado:
        'Ao contratar um plano de previdência complementar do tipo Vida Gerador de Benefício Livre – VGBL, com regime de tributação compensável (tabela progressiva), um indivíduo optou por uma contribuição mensal de R\$ 500,00 durante o período de 10 anos, sendo que a primeira aplicação foi realizada no ato da contratação. Durante este período, o rendimento médio do plano foi de 0,65% a.m. Caso efetue o resgate total do valor acumulado nesse plano, o valor do Imposto de Renda na fonte será de',
    alternativas: {
      'a': 'R\$ 3.104,75',
      'b': 'R\$ 13.657,12',
      'c': 'R\$ 7.989,23',
      'd': 'R\$ 4.657,12',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 73
  Question(
    enunciado:
        'Um indivíduo, 63 anos de idade contribuiu, mensalmente, dos 40 aos 50 anos com dois planos de previdência complementar dos tipos:\nI – Plano Gerador de Benefício Livre (PGBL) com regime de tributação exclusivo na fonte (tabela regressiva) e acumulou recursos no valor de R\$ 694.367,97.\nII – Vida Gerador de Benefício Livre (VGBL) com regime de tributação compensável (tabela progressiva) e acumulou recursos no valor de R\$ 694.367,97, sendo que, desse montante, R\$ 159.704,63 referem-se à rentabilidade do plano.\nEsses dois planos proporcionarão, em partes iguais, uma renda mensal vitalícia com o mesmo valor de um teto do Instituto Nacional de Seguridade Social (INSS) que, atualmente, é R\$ 7.087,22. Nesse caso, o valor líquido total recebido em cada mês será',
    alternativas: {
      'a': 'R\$ 6.732,85',
      'b': 'R\$ 6.201,31',
      'c': 'R\$ 6.508,71',
      'd': 'R\$ 6.610,24',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 74
  Question(
    enunciado:
        'Beatriz, residente e domiciliada no Brasil trabalha no mercado financeiro e recebe, anualmente, R\$ 260.000,00, incluindo o 13° salário. Adicionalmente, tem um apartamento alugado, que lhe rende mensalmente R\$ 1.000,00. Para atingir o máximo diferimento fiscal no exercício, a contribuição para um plano de previdência complementar para a modalidade Plano Gerador de Benefício Livre (PGBL) é',
    alternativas: {
      'a': 'R\$ 31.200,00.',
      'b': 'R\$ 30.240,00.',
      'c': 'R\$ 32.640,00.',
      'd': 'R\$ 28.800,00.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 75
  Question(
    enunciado:
        'Após ter avaliado o perfil e o horizonte de investimento, um especialista identificou que seu cliente, executivo de uma empresa privada, apresenta uma alta propensão a correr riscos; objetiva obter ganhos de capital; e utilizar os recursos após 90 meses. Ele contribui para um plano de previdência complementar patrocinado pela empresa onde trabalha, até o limite de abatimento do Imposto de Renda. Caso ele pretenda obter uma renda mensal complementar de R\$ 7.000,00, em valores atuais, a recomendação MAIS adequada ao perfil desse investidor será a aplicação em um plano de previdência complementar do tipo',
    alternativas: {
      'a': 'Vida Gerador de Benefício Livre (VGBL) do tipo Composto.',
      'b': 'Plano Gerador de Benefício Livre (PGBL) do tipo Renda Fixa.',
      'c': 'Plano Gerador de Benefício Livre (PGBL) do tipo Composto.',
      'd': 'Vida Gerador de Benefício Livre (VGBL) do tipo Renda Fixa.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 76
  Question(
    enunciado:
        'Na análise de um conjunto contendo, no mínimo, 30 dados aleatórios, a escolha de uma medida descritiva deve considerar que a',
    alternativas: {
      'a': 'média é maior do que a mediana em conjuntos assimétricos de dados.',
      'b':
          'soma dos quadrados dos desvios de cada dado em relação à média é igual a zero.',
      'c':
          'mediana não é afetada por alterações nos valores extremos dos dados.',
      'd': 'moda é sempre única.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 77
  Question(
    enunciado:
        'Um investidor vendeu ações de uma empresa do setor de petróleo e gás e, simultaneamente, adquiriu quatro ações de setores diferentes. Nesse caso, esse investidor visa a redução do risco',
    alternativas: {
      'a': 'de crédito.',
      'b': 'de mercado.',
      'c': 'não sistemático.',
      'd': 'sistemático',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 78
  Question(
    enunciado:
        'Em relação ao coeficiente beta de uma ação, pode-se afirmar que se',
    alternativas: {
      'a':
          'maior do que 1,0, o risco sistemático será menor do que o da carteira de mercado.',
      'b':
          'igual a 1,0, o risco sistemático será igual ao da carteira de mercado.',
      'c':
          'menor do que 1,0, o risco sistemático será maior do que o da carteira de mercado.',
      'd':
          'igual a zero, o risco sistemático será igual ao da carteira de mercado.',
    },
    respostaCorreta: '', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 80
  Question(
    enunciado:
        'Em relação ao teste de stress\nI – O objetivo é identificar cenários incomuns que não ocorreriam nos modelos de Value at Risk conhecidos.\nII – O intuito é simular choques que refletem mudanças estruturais permanentes ou mudanças temporárias nos padrões estatísticos.\nIII – O intuito é simular mudanças utilizando dados históricos recentes.\nEstá correto o que se afirma em',
    alternativas: {
      'a': 'II, apenas.',
      'b': 'I e II, apenas.',
      'c': 'I, Il e III.',
      'd': 'l, apenas.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 81
  Question(
    enunciado:
        'A função de um stress test é medir o prejuízo potencial de uma carteira, durante um determinado período de tempo, com base',
    alternativas: {
      'a': 'na análise de probabilidades dos retornos dos ativos.',
      'b': 'em situações atípicas de variação dos preços do mercado.',
      'c': 'na volatilidade histórica.',
      'd': 'na volatilidade implícita.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 82
  Question(
    enunciado:
        'O indicador utilizado para comparar o desempenho de fundos de investimento e que relaciona o retorno adicional (em relação à taxa de retorno livre de risco) com o risco sistemático (beta) assumido pelo gestor para obtê-lo é o',
    alternativas: {
      'a': 'índice de Sharpe.',
      'b': 'tracking error.',
      'c': 'Value at Risk.',
      'd': 'índice de Treynor',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 84
  Question(
    enunciado:
        'A taxa projetada para um ano do ativo livre de risco é de 9,00% a.a. e o retorno do mercado de ações, para o mesmo prazo, é de 22,00% a.a. Com base no modelo CAPM, uma carteira de ações com beta igual a um deverá ter retorno projetado, para o mesmo período de tempo, de',
    alternativas: {
      'a': '13,00% a.a.',
      'b': '31,00% а.а.',
      'c': '9,00% а.а.',
      'd': '22,00% a.a.',
    },
    respostaCorreta: 'd', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 86
  Question(
    enunciado:
        'A Fronteira Eficiente de Markowitz representa o conjunto de portfólios de investimentos que possuem',
    alternativas: {
      'a': 'o maior retorno esperado em relação a um nível de risco.',
      'b': 'o maior retorno esperado dentre todos os portfólios.',
      'c': 'o menor retorno esperado em relação a uma determinada variância.',
      'd': 'a menor variância dentre todos os portfólios.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 89
  Question(
    enunciado:
        'Um cliente apresenta perfil moderado e busca uma estratégia que tenha potencial de preservar o seu capital a médio prazo e, simultaneamente, propicie um fluxo de caixa para geração de renda recorrente e, ainda, atinja o máximo de eficiência tributária. Nesse caso, a recomendação MAIS adequada é',
    alternativas: {
      'a':
          'fundos imobiliários que seguem o IFIX e fundos multimercado que replicam o IFMM.',
      'b':
          'debêntures incentivadas que seguem o IMA-B e fundos imobiliários que replicam o IFIX.',
      'c':
          'ações que seguem o IBOV e debêntures incentivadas que replicam o IMA-B.',
      'd': 'ações que seguem o IBOV e fundos multimercado que replicam o IFMM.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 90
  Question(
    enunciado:
        'Sobre a teoria de finanças comportamentais, que se contrapõe à teoria tradicional, fundamentada no pressuposto da racionalidade do investidor,\nI – os vieses cognitivos sistemáticos permeiam o processo decisório e afastam o julgamento dos agentes daquilo que seria previsto pelo postulado da racionalidade.\nII – o comportamento enviesado dos indivíduos pode exercer um impacto importante sobre os preços dos ativos negociados no mercado.\nIII – os agentes econômicos avaliam decisões em condições de incerteza de acordo com as suposições da teoria da utilidade esperada.\nEstá correto o que se afirmar em:',
    alternativas: {
      'a': 'I e II, apenas.',
      'b': 'I, II e III.',
      'c': 'II e III, apenas.',
      'd': 'I e III, apenas.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 91
  Question(
    enunciado:
        'Ao discutir com o gestor do seu portfólio, André afirma: "não perdi dinheiro nessas ações que estão em baixa, pois nem as vendi, ainda". Nesse caso, ele apresenta o viés da heurística',
    alternativas: {
      'a': 'da representatividade.',
      'b': 'da ilusão de controle.',
      'c': 'da aversão à perda.',
      'd': 'do excesso de confiança.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 92
  Question(
    enunciado:
        'Um investidor implementa suas decisões de investimento por meio de fundos, considerando os dados históricos de rentabilidade como estimativa dos retornos futuros; e não se importando com as perspectivas das estratégias desses produtos. Nesse caso, o viés cognitivo apresentado e o',
    alternativas: {
      'a': 'da ancoragem.',
      'b': 'do excesso de confiança.',
      'c': 'da aversão à perda.',
      'd': 'do framing.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 93
  Question(
    enunciado:
        'Pela definição da Comissão de Valores Mobiliários (CVM) as pessoas habilitadas a atuar como integrantes do sistema de distribuição e os consultores de valores mobiliários ficam vedadas de recomendar produtos ao cliente quando\nI – o perfil do cliente não seja adequado ao produto de investimento.\nII – não sejam obtidas as informações que permitam a identificação do perfil do cliente.\nIII – as informações relativas ao perfil do cliente não estejam atualizadas.\nEstá correto o que se afirmar em:',
    alternativas: {
      'a': 'l e III, apenas.',
      'b': 'I, II e III.',
      'c': 'II e III, apenas.',
      'd': 'l e II, apenas.',
    },
    respostaCorreta: 'b', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 95
  Question(
    enunciado:
        'Na elaboração do orçamento pessoal, o indivíduo necessita\nI – considerar a sua situação financeira atual e as projeções futuras de geração de caixa e despesas.\nII – determinar o esforço necessário para acumular recursos frente às necessidades atuais e futuras.\nIII – avaliar quais os produtos financeiros mais adequados para constituir sua reserva de emergência.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'I e II, apenas.',
      'b': 'I, II e III.',
      'c': 'II e III, apenas.',
      'd': 'I e III, apenas.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 96
  Question(
    enunciado:
        'Para estruturar um plano de investimento a um cliente, um especialista financeiro, na fase de coleta de dados, deverá entrevistar o cliente e aplicar questionários que sejam capazes de\nI – identificar a situação patrimonial do cliente e seu fluxo de caixa.\nII – entender os objetivos e metas do cliente a curto, médio e longo prazo.\nIII – avaliar os valores, atitudes e expectativas do cliente.\nIV – determinar as características dos investimentos detidos.\nEstá correto o que se afirmar em:',
    alternativas: {
      'a': 'I, II e III e IV.',
      'b': 'II e III, apenas.',
      'c': 'I e III, apenas.',
      'd': 'l e II, apenas.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 97
  Question(
    enunciado:
        'Um indivíduo contratou um especialista em investimento para elaborar um planejamento financeiro de sua família baseado no processo definido pela Associação Brasileira de Planejadores Financeiros (PLANEJAR). Esse especialista, na fase “coleta das informações”, deverá:\nI – definir a responsabilidade de ambos (planejador e cliente) durante o trabalho.\nII – identificar eventuais problemas de saúde desse indivíduo.\nIII – identificar se as relações familiares podem dificultar as estratégias de planejamento sucessório.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'I e III, apenas.',
      'b': 'l e II, apenas.',
      'c': 'II e III, apenas.',
      'd': 'I, II e III.',
    },
    respostaCorreta: 'c', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 98
  Question(
    enunciado:
        'Uma das etapas do processo de elaboração do planejamento financeiro, conforme a Associação Brasileira de Planejadores Financeiros (Planejar) é o desenvolvimento e apresentação de recomendações ao cliente. Sobre essa etapa, deve-se assegurar o planejador que o cliente tenha um adequado entendimento\nI – dos fatores e premissas atuais que foram fundamentais para as recomendações.\nII – dos riscos das estratégias.\nIII – do provável impacto das recomendações sobre a capacidade do cliente atingir seus objetivos, devendo evitar apresentar sua opinião como um fato.\nEstá correto o que se afirmar em',
    alternativas: {
      'a': 'I, II e III.',
      'b': 'I, apenas.',
      'c': 'III, apenas',
      'd': 'l e II, apenas.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 99
  Question(
    enunciado:
        'Observe as afirmações apresentadas sobre as etapas do processo da elaboração de um planejamento financeiro:\nI – análise e avaliação das condições financeiras do cliente.\nII – definição da forma de relacionamento entre o planejador financeiro e o cliente.\nIII – obtenção de informações, dados e objetivos do cliente.\nIV – desenvolvimento e sugestão de alternativas do plano financeiro para o cliente.\nV – monitoramento das recomendações apresentadas no plano financeiro.\nVI – execução das recomendações apresentadas no plano financeiro.\nSegundo a Planejar (Associação Brasileira de Planejadores Financeiros), a ordem correta é:',
    alternativas: {
      'a': 'II, III, I, IV, VI e V',
      'b': 'I, II, III, IV, V e VI',
      'c': 'II, III, I, IV, V e VI',
      'd': 'I, III, IV, II, VI e V',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),

  // Pergunta 100
  Question(
    enunciado:
        'Segundo a PLANEJAR (Associação Brasileira de Planejadores Financeiros), no processo de elaboração de um planejamento financeiro pessoal, NÃO faz parte',
    alternativas: {
      'a':
          'a análise de ações de companhias abertas que podem ser adquiridas pelo cliente.',
      'b': 'o monitoramento das recomendações apresentadas ao cliente.',
      'c': 'a execução das recomendações apresentadas ao cliente.',
      'd': 'a análise e avaliação das condições financeiras do cliente.',
    },
    respostaCorreta: 'a', // Você pode inserir a resposta correta aqui
  ),
];

// SIMULADOO 2 ---------------------------------------------------------------------
// FALTA 21-a | 25-d | 30-b | 32-a | 50-a | 52-c | 53-c | 55-b | 58-c | 64-d | 70-a
// SIMULADOO 2 ---------------------------------------------------------------------

final List<Question> simulado1CEA = [
  // Pergunta 01
  Question(
    enunciado:
        'O órgão responsável pelo controle e fiscalização dos Planos de Previdência Complementar Aberta e que pode ser acessado pelos indivíduos que queiram informações sobre os produtos disponíveis é:',
    alternativas: {
      'a': 'a CVM - Comissão de Valores Mobiliários.',
      'b': 'BACEN - Banco Centra do Brasil.',
      'c': 'SUSEP - Superintendência de Seguros Privados.',
      'd': 'PREVIC - Superintendência Nacional de Previdência Complementar.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 02
  Question(
    enunciado:
        'Segundo a Lei Complementar nº 179, de 24 de fevereiro de 2021, a autonomia legal dada ao Bacen, exigirá maior transparência da instituição, o que poderá ser alcançado por meio de um conjunto de instrumentos, sendo que um deles é que o presidente do Banco Central deverá apresentar, em arguição pública, no primeiro e no segundo semestre de cada ano, relatório de inflação e relatório de estabilidade financeira, explicando as decisões tomadas no semestre anterior. Este relatório deverá ser apresentado no:',
    alternativas: {
      'a': 'Conselho Monetário Nacional',
      'b': 'Superior Tribunal Federal',
      'c': 'Comitê de Políticas Monetárias',
      'd': 'Senado Federal',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 03
  Question(
    enunciado:
        'Segundo o Código ANBIMA de Distribuição de Produtos de Investimento, as instituições participantes estão dispensadas de observar os artigos dispostos no Código, na distribuição',
    alternativas: {
      'a': 'da Caderneta de Poupança.',
      'b': 'dos Títulos Públicos Federais.',
      'c': 'do Fundo de Investimento de Renda Fixa Simples.',
      'd': 'do Certificado de Depósito Bancário.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 04
  Question(
    enunciado:
        'Segundo o Código Anbima de Distribuição de Produtos de Investimentos, são considerados produtos de investimentos que devem seguir o código:',
    alternativas: {
      'a': 'fundos de investimento.',
      'b': 'fundos de investimentos e carteira administrada.',
      'c': 'fundos de pensão.',
      'd': 'fundos de pensão e carteira administrada.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 05
  Question(
    enunciado:
        'São considerados indícios do crime de lavagem de dinheiro:\nI – Um cliente private adquire uma debênture com remuneração de 60% CDI com prazo de vencimento em 10 anos.\nII – Um cliente private compra um bem por R\$ 40.000,00 e vende, no mesmo mês, por R\$ 200.000,00.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'I, apenas.',
      'b': 'II, apenas.',
      'c': 'I e II.',
      'd': 'Nenhuma das duas.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 06
  Question(
    enunciado:
        'Gustavo, diretor da empresa XYZ, comenta a seu irmão Rodrigo, que a sua empresa será comprada pelo dobro do valor que está sendo negociada na bolsa. Com isso, seu irmão liga para o seu corretor Victório, para comprar as ações antes desta notícia ser divulgada ao mercado. Victório, sem questionar nada, executa a ordem de compra. Um mês depois, com a notícia de compra da empresa ocorrendo, Rodrigo liga novamente para seu corretor Victório e solicita a venda das ações pelo dobro do valor adquirido. Victório, novamente sem questionar nada, executa a ordem de venda e ainda o parabeniza pela operação. Após isso, Rodrigo divide o lucro com seu irmão Gustavo. Desta forma, podemos afirmar que:',
    alternativas: {
      'a':
          'Os irmãos Gustavo e Rodrigo, e o corretor Victório cometeram crime de insider trading.',
      'b':
          'Os irmãos Gustavo e Rodrigo cometeram crime de insider trading, e o corretor Victório cometeu uma infração administrativa.',
      'c':
          'Os irmãos Gustavo e Rodrigo cometeram crime de insider trading, e o corretor Victório não cometeu nem crime e nem infração administrativa.',
      'd': 'Não houve nenhuma ilegalidade.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 07
  Question(
    enunciado: 'A melhor definição da taxa DI é:',
    alternativas: {
      'a': 'Meta da taxa de juros básica da economia.',
      'b':
          'Média ponderada das operações interfinanceiras, por 1 dia, lastreadas em títulos públicos federais.',
      'c':
          'Média das taxas de juros em empréstimos interbancários realizada exclusivamente entre bancos que não são do mesmo grupo financeiro.',
      'd': 'Taxa de inflação atrelada aos preços do varejo.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 08
  Question(
    enunciado:
        'Uma empresa brasileira recebeu um aporte de capital de um grupo Italiano e utilizou esses recursos para comprar um equipamento na Alemanha. A empresa alemã enviou este maquinário por uma empresa de logística americana, na qual foi cobrado da empresa brasileira a taxa de transporte e os devidos seguros. Além disso, os donos do grupo, solicitaram que os seus salários fossem depositados na Itália. Dentro da Balança de Pagamentos, os valores citados serão lançados da seguinte forma:',
    alternativas: {
      'a':
          'Por ser uma operação de compra e venda internacional, todos os valores serão lançados na Balança Comercial.',
      'b':
          'O aporte Italiano entrará na Conta Financeira. Já os demais valores (da empresa alemã, americana e os devidos salários), serão lançados dentro das Transações Correntes, mais especificamente, na Balança Comercial.',
      'c':
          'O aporte Italiano entrará na Conta Financeira, o pagamento para a empresa alemã será lançado na Balança Comercial, o valor para a empresa americana estará na Balança de Serviços e os salários na Balança de Rendas.',
      'd':
          'Não será lançado em nenhuma conta, pois a receita federal, juntamente com o COAF, considerará esta operação ilegal, pois todos os salários devem ser pagos no Brasil.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 09
  Question(
    enunciado:
        'Um país que tem sua balança comercial superavitária significa que:',
    alternativas: {
      'a':
          'o total de bens exportados são inferiores ao total de bens importados.',
      'b':
          'o total de bens exportados são superiores ao total de bens importados.',
      'c':
          'tenha um maior volume de remessas de lucros e juros de empréstimos enviados para o exterior.',
      'd':
          'tenha um menor volume de remessas de lucros e juros de empréstimos enviados para o exterior.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 10
  Question(
    enunciado:
        'A taxa de câmbio no Brasil, nos últimos meses, apresentou uma valorização do Real em relação ao Dólar Norte-Americano. Tal valorização produziu',
    alternativas: {
      'a':
          'redução do déficit da conta turismo e redução da margem de ganho dos exportadores.',
      'b':
          'aumento do déficit da conta turismo e aumento da margem de ganho dos exportadores.',
      'c':
          'aumento do déficit da conta turismo e redução da margem de ganho dos exportadores.',
      'd':
          'redução do déficit da conta turismo e aumento da margem de ganho dos exportadores.',
    },
    respostaCorreta: '10', // Insira a resposta correta aqui
  ),

  // Pergunta 11
  Question(
    enunciado:
        'Uma indústria de metais vende equipamentos pelo valor de R\$ 7.200,00, através de sua equipe de vendas. Para realizar este produto, a empresa tem um custo de matéria prima de R\$ 4.000,00. Sabendo que os vendedores recebem R\$ 1.000,00 por cada venda e que o imposto de renda (IRPJ) é de 15%, que o PIB gerado por essa companhia, através da ótica do valor adicionado, é de:',
    alternativas: {
      'a': 'R\$ 2.200,00',
      'b': 'R\$ 2.720,00',
      'c': 'R\$ 3.200,00',
      'd': 'R\$ 7.200,00',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 12
  Question(
    enunciado:
        'Um determinado investidor deseja comprar um imóvel no valor de R\$ 535 mil. Sabendo que ele possui uma aplicação financeira em Renda Fixa no valor de R\$ 150 mil que rende 0,75% líquido ao mês, e que o mesmo irá realizar aportes mensais no valor de R\$ 3.150,00 nessa mesma aplicação, em quantos meses ele conseguirá comprar o imóvel, caso deseja pagar à vista?',
    alternativas: {
      'a': '70 meses',
      'b': '88 meses',
      'c': '110 meses',
      'd': '170 meses',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 13
  Question(
    enunciado:
        'Rafael fez um investimento de R\$ 150.000,00 e recebeu o seguinte fluxo:\n● Caixa gerado no final do primeiro ano: R\$ 11.250,00\n● Caixa gerado no final do segundo ano: R\$ 11.250,00\n● Caixa gerado no final do terceiro ano: R\$ 161.250,00\nConsiderando um custo de oportunidade de 7% ao ano, o Valor Presente Líquido (VPL) aproximado deste investimento é de:',
    alternativas: {
      'a': '- R\$ 1.968,00',
      'b': '+ R\$1.968,00',
      'c': '- R\$ 4.923,00',
      'd': '+ R\$ 4.923,00',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 14
  Question(
    enunciado:
        'O Comite de Politica Monetária COPOM, em ata de sua reunião ordinária informou que, diante dos sinais de forte recuperação da demanda doméstica, pode-se projetar uma elevação da média dos índices de inflação. Um especialista em investimento, após a leitura desse documento, enquanto perdurar tais expectativas quanto aos índices de inflação, recomendará a seus clientes que:\nI – reduzam as aplicações em Letras Financeiras do Tesouro - LFT.\nII – aumentem as aplicações indexadas ao DI.\nIII – aumentem o prazo médio das aplicações de renda fixa prefixadas.\nEstá correto o que se afirma em',
    alternativas: {
      'a': 'I, II e III.',
      'b': 'II e III, apenas.',
      'c': 'III, apenas.',
      'd': 'II, apenas.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 15
  Question(
    enunciado:
        'Um cliente possui os seguintes ativos:\nI – LCI (Letra de Crédito Imobiliário)\nII – LCA (Letra de Crédito do Agronegócio)\nIII – CRA (Certificado de Recebimento do Agronegócio)\nIV – Operação Compromissada lastreada em Debêntures, emitido por empresa ligada em 2014.\nEm relação a proteção do FGC, os ativos que possuem esta garantia são:',
    alternativas: {
      'a': 'I e II, apenas.',
      'b': 'II e III, apenas.',
      'c': 'I, II e IV, apenas.',
      'd': 'I, III e IV, apenas.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 16
  Question(
    enunciado:
        'Um cliente investiu R\$ 100.000,00 em um CDB com rentabilidade de 100% do CDI durante 270 dias úteis (390 dias corridos). Sabendo que no momento do resgate, a taxa do CDI do período foi de 11,75% e ele teve mais um spread de 0,65% ao ano, qual foi o valor aproximado do resgate líquido?',
    alternativas: {
      'a': 'R\$ 110.018,00',
      'b': 'R\$ 110.336,00',
      'c': 'R\$ 111.312,00',
      'd': 'R\$ 112.530,00',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 17
  Question(
    enunciado: 'Em uma operação de Repurchase Agreement, podemos afirmar que:',
    alternativas: {
      'a': 'A taxa repo da operação é recebida pelo mutuário.',
      'b':
          'Enquanto o comprador repo deter os títulos que estão servindo de colateral da operação, os cupons que forem pagos são geralmente repassados diretamente ao vendedor da repo.',
      'c': 'O vendedor da repo é quem recebe a taxa de juros da operação.',
      'd':
          'O comprador da repo vende os títulos no início da operação para, em um segundo momento, recompra-los pagando também a “taxa de recompra”.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 18
  Question(
    enunciado:
        'O patrimônio líquido de uma empresa é de R\$ 20.000.000,00 e sua dívida total é de R\$ 90.000.000,00. A empresa tem custo médio da dívida igual a 11,00% a.a., custo de capital próprio de 18,00% a.a. e está sujeita à aliquota do Imposto de Renda de 25,00% sobre o lucro líquido. O Custo Médio Ponderado de Capital dessa empresa é, aproximadamente,',
    alternativas: {
      'a': '9,20% a.a.',
      'b': '10,02% a.a.',
      'c': '11,45% a.a.',
      'd': '12,27% a.a.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 19
  Question(
    enunciado:
        'Uma empresa apresentou, ao final do último Exercício Social de 2015, as seguintes Demonstrações de Resultados dos Exercícios de 2014 e 2015:',
    imagem: 'assets/images/questao19-S1.png', // Caminho da imagem
    alternativas: {
      'a': 'R\$ 21.800,00',
      'b': 'R\$ 9.960,00',
      'c': 'R\$ 17.600,00',
      'd': 'R\$ 14.600,00',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 20
  Question(
    enunciado:
        'Para adesão ao segmento especial de listagem Nível 1 da B3, as empresas listadas devem:',
    alternativas: {
      'a':
          'Disponibilizar balanços semestrais seguindo os padrões do International Financial Reporting Standards (IFRS).',
      'b':
          'possuir, no mínimo, 20% de conselheiros independentes no Conselho de Administração.',
      'c':
          'Comprometer-se em manter, no mínimo, 25% das suas ações em circulação no mercado.',
      'd':
          'possuir no seu capital exclusivamente ações ordinárias com direito a voto.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 22
  Question(
    enunciado:
        'O lançador de uma opção de compra (call) de dólar norte-americano negociada na Bolsa de Valores, no vencimento, terá',
    alternativas: {
      'a': 'o direito de vender a moeda.',
      'b': 'a obrigação de comprar a moeda.',
      'c': 'a obrigação de vender a moeda.',
      'd': 'o direito de comprar a moeda.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 23
  Question(
    enunciado: 'A operação com opções chamada Strangle se caracteriza por:',
    alternativas: {
      'a':
          'Comprar uma put e uma call do mesmo ativo-objeto, com igual vencimento, mas com preços de exercício diferentes.',
      'b':
          'Comprar uma put e uma call do mesmo ativo-objeto, com vencimento diferentes, mas com preços de exercício iguais.',
      'c':
          'Comprar duas calls do mesmo ativo-objeto, com vencimentos diferentes e com preço de exercícios diferentes.',
      'd':
          'Comprar duas puts do mesmo ativo-objeto, com igual vencimento, mas com preço de exercícios diferentes.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 24
  Question(
    enunciado:
        'Uma instituição financeira acaba de emitir um COE (Certificado de Operações Estruturadas), produzindo o DIE (Documento de Informações Essenciais), que especifica as características do produto e o termo de Adesão e Ciência de Risco (TA) dessa emissão. No momento da distribuição aos investidores não profissionais, a instituição deve',
    alternativas: {
      'a': 'obrigatoriamente entregar o DIE e colher a assinatura no TA.',
      'b':
          'opcionalmente entregar o DIE e obrigatoriamente colher a assinatura no TA.',
      'c': 'opcionalmente entregar o DIE e colher a assinatura no TA.',
      'd':
          'obrigatoriamente entregar o DIE e opcionalmente colher a assinatura no TA.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 26
  Question(
    enunciado:
        'Guilherme comprou 50 contratos de Índice Futuro a 60.200 pontos e vendeu no mesmo dia, na mesma corretora esses mesmos contratos a 60.600 pontos. Desta forma, o valor do I.R. retido na fonte será de:',
    alternativas: {
      'a': 'R\$ 0,00',
      'b': 'R\$ 1,00',
      'c': 'R\$ 200,00',
      'd': 'R\$ 3.000,00',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 27
  Question(
    enunciado:
        'Um brasileiro, residente no Brasil, comprou ações de uma empresa brasileira e também comprou ADRs de uma empresa de Londres. Caso ele receba dividendos em ambas as posições, o Imposto de Renda que deverá ser recolhido pelo investidor, respectivamente nestas operações, será de:',
    alternativas: {
      'a': 'Isento e isento.',
      'b': 'Isento e 15%.',
      'c': 'Isento e carne leão até 27,5%.',
      'd': 'Carne leão até 27,5% e isento.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 28
  Question(
    enunciado:
        'De acordo com a Resolução CVM 175, em casos excepcionais de iliquidez dos ativos componentes da carteira, inclusive em decorrência de pedidos de resgates incompatíveis com a liquidez existente, ou que possam implicar alteração do tratamento tributário do fundo ou do conjunto dos cotistas em prejuízos destes últimos, o administrador, o gestor ou ambos, de acordo com o disposto no Regulamento, podem declarar:',
    alternativas: {
      'a': 'a falência do fundo.',
      'b': 'a substituição dos prestadores de serviços essenciais.',
      'c': 'a transformação da classe aberta para classe fechada.',
      'd': 'o fechamento da classe de cotas para realização de resgates.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 29
  Question(
    enunciado:
        'A classe aberta de um fundo de investimento está investindo em renda fixa, através de CDBs de instituições financeiras e outros ativos financeiros de crédito privado. Com relação a gestão de liquidez, podemos afirmar que:',
    alternativas: {
      'a':
          'O gestor de recursos e o administrador fiduciário, conjuntamente, são responsáveis pela liquidez da classe de cotas.',
      'b':
          'O administrador fiduciário, exclusivamente, é o responsável pela liquidez da classe de cotas.',
      'c':
          'O gestor de recursos, exclusivamente, é o responsável pela liquidez da classe de cotas.',
      'd':
          'Os cotistas são responsáveis pela gestão da liquidez do fundo, através da definição do Regulamento.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 31
  Question(
    enunciado:
        'Um fundo de investimento aplica seus recursos exclusivamente em títulos públicos de longo prazo indexados ao dólar. Durante um certo período, a variação do dólar comercial à vista foi 14,5% e, no entanto, a classe rendeu apenas 8,5%. Essa diferença, provavelmente, deveu-se à:',
    alternativas: {
      'a': 'baixa do cupom cambial no mercado brasileiro.',
      'b': 'baixa das taxas de juro em dólar no mercado norte-americano.',
      'c': 'alta das taxas de juro em dólar no mercado norte americano.',
      'd': 'alta do cupom cambial no mercado brasileiro.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 33
  Question(
    enunciado: 'São características das classes:',
    alternativas: {
      'a':
          'exclusivas serem voltados para um segmento de mercado, como empresas do segmento de energia elétrica.',
      'b': 'tipificadas como multimercados serem fechadas.',
      'c':
          'tipificadas como ações, por determinação legal, não poderem comprar cotas de outros fundos.',
      'd':
          'fechadas serem aqueles em que os cotistas não podem resgatar as suas cotas.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 34
  Question(
    enunciado:
        'Avalie as alternativas abaixo à respeito dos Fundos Imobiliários (FII):\nI – Pode ser composto por investidores de varejo ou investidores qualificados.\nII – As classes de cotas são constituídas sob a forma de regime fechado.\nIII – Permite a utilização de derivativos apenas para proteção de carteira.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'I, apenas.',
      'b': 'II, apenas.',
      'c': 'I e III, apenas.',
      'd': 'I, II e III.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 35
  Question(
    enunciado:
        'Sobre o FIDC, analise as alternativas a seguir:\nI – Somente pode investir em direitos creditórios.\nII – Pode ser constituído como regime aberto ou regime fechado.\nIII – Somente pode ser objeto de oferta para investidores qualificados.\nIV – Podem possuir cotas Subordinadas, Sênior e Ordinária\nEstá correto o que se afirma APENAS em:',
    alternativas: {
      'a': 'II',
      'b': 'II e III',
      'c': 'II, III e IV',
      'd': 'I e IV',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 36
  Question(
    enunciado:
        'A compensação de imposto de renda em aplicações em fundos de investimento pode ser:\nI – Feita pelo investidor, mesmo que ainda não tenha vendido suas cotas com prejuízo.\nII – Feita apenas entre fundos de mesmo tratamento tributário.\nIII – Declarada no IRPF (Imposto de Renda Pessoa Física), deduzindo a base de cálculo do imposto a ser pago, na declaração de ajuste anual.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'I, apenas.',
      'b': 'II, apenas.',
      'c': 'I e III, apenas.',
      'd': 'II e III, apenas.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 37
  Question(
    enunciado:
        'Um investidor adquiriu cotas de um fundo de renda variável no valor de R\$ 200.000,00 e, após 60 dias, as vendeu integralmente por R\$ 220.000,00. Nesse caso, o agente responsável pelo recolhimento dos tributos é o:',
    alternativas: {
      'a': 'gestor',
      'b': 'administrador',
      'c': 'custodiante',
      'd': 'investidor',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 38
  Question(
    enunciado:
        'Dentre as alternativas abaixo, o Código ANBIMA de Regulação e Melhores Práticas para Administração de Recursos de Terceiros não se aplica:',
    alternativas: {
      'a': 'Clube de Investimentos, apenas.',
      'b': 'Fundo Exclusivo, apenas.',
      'c': 'FIP, apenas.',
      'd': 'FIP e Clube de Investimentos.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 39
  Question(
    enunciado:
        'De acordo com o Código Anbima de Administração de Recursos de Terceiros, representam obrigações do Gestor de Recursos:',
    alternativas: {
      'a': 'elaboração de todos os documentos relacionados aos fundos.',
      'b':
          'constituição, administração, funcionamento e divulgação de informações dos fundos.',
      'c':
          'negociação, alocação e rateio das ordens dos veículos de investimento, quando aplicável.',
      'd':
          'controle dos ativos financeiros da carteira, despesas e encargos sobre eles incidentes.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 40
  Question(
    enunciado:
        'O apreçamento é definido, segundo o Código Anbima de Regulação e Melhores Práticas para Administração e Gestão de Recursos de Terceiros, como a precificação dos ativos de fundos de investimentos, pelo:',
    alternativas: {
      'a':
          'preço médio, se esses ativos pertencerem a classe de renda fixa ou pelo preço de fechamento do mercado.',
      'b':
          'preço de aquisição, se esses ativos pertencerem a classe de renda fixa ou pelo preço médio se forem de renda variável.',
      'c':
          'preço de mercado, se esses ativos forem líquidos ou por estimativa, se forem ilíquidos.',
      'd':
          'preço de fechamento, se esses ativos forem líquidos ou pelo último preço negociado, se forem ilíquidos.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 41
  Question(
    enunciado: 'A portabilidade permite que haja transferências:',
    alternativas: {
      'a':
          'De PGBL para PGBL, de VGBL para VGBL, de PGBL para VGBL, de VGBL para PGBL, todas sem imposto de renda.',
      'b':
          'Sem imposto de renda quando for PGBL para PGBL, ou de VGBL para VGBL. Com imposto de renda quando for de PGBL para VGBL, ou de VGBL para PGBL.',
      'c': 'De PGBL para PGBL, de VGBL para VGBL com imposto de renda.',
      'd': 'De PGBL para PGBL, de VGBL para VGBL sem imposto de renda.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 42
  Question(
    enunciado:
        'Guilherme possui um plano de previdência do tipo PGBL no qual investe 100% dos recursos em renda fixa. Certo dia, ele vai ao banco e informa ao seu gerente que agora ele está mais propenso ao risco e gostaria de trocar sua aplicação para um outro plano de previdência que aplique até 30% em renda variável. Desta forma, o gerente poderia informar que ele:',
    alternativas: {
      'a':
          'Poderá trocar de perfil e realizar a portabilidade para outro plano, porém haverá cobrança de Imposto de Renda no momento da realização da transferência.',
      'b':
          'Poderá trocar de perfil e realizar a portabilidade para outro plano, não havendo cobrança de Imposto de Renda no momento da realização da transferência, caso ele permaneça em um plano do tipo PGBL.',
      'c':
          'Uma vez definido o perfil do investidor em planos de previdência, não poderá mais ser feita a portabilidade para planos mais arrojados, mas poderá resgatar os recursos pagando imposto de renda e realizar novos aportes em planos mais arrojados.',
      'd':
          'Poderia trocar de plano fazendo uma portabilidade sem cobrança de imposto de renda, desde que contratasse um seguro de vida também.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 43
  Question(
    enunciado:
        'Um cliente possui dois planos de previdência com os mesmos valores acumulados e mesmos prazos, decidiu fazer um resgate total. O primeiro plano era um PGBL regressivo e o segundo, um VGBL progressivo. No momento dele realizar o resgate, o cliente pergunta ao seu gerente como ele deverá declarar esses valores no seu Imposto de Renda. Este gerente responde corretamente que os valores resgatados deverão ser declarados, respectivamente, em:',
    alternativas: {
      'a':
          'Rendimentos Tributáveis recebidos de Pessoa Jurídica e Rendimentos Sujeitos à Tributação Exclusiva.',
      'b':
          'Rendimentos Sujeitos à Tributação Exclusiva e Rendimentos Tributáveis recebidos de Pessoa Jurídica.',
      'c': 'Rendimentos Sujeitos à Tributação Exclusiva, ambos os valores.',
      'd':
          'Rendimentos Tributáveis recebidos de Pessoa Jurídica, ambos os valores.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 44
  Question(
    enunciado:
        'João tem 55 anos e pretende se aposentar aos 60 anos de idade. Ele possui um plano de previdência privada AT 83 + 0%, com tabela regressiva, e tem intuito de converter os recursos em uma renda temporária por 20 anos. Certo dia, um assessor de investimentos, que é amigo do seu filho, oferta a portabilidade desses recursos a outra instituição financeira, pois possui uma taxa de administração menor. Sabendo que ele já contribui há mais de 15 anos neste plano, João:',
    alternativas: {
      'a':
          'Deve realizar a portabilidade apenas se a tábua atuarial for igual ou mais antiga que a atual.',
      'b':
          'Deve realizar a portabilidade apenas se a tábua atuarial for igual ou mais nova que a atual.',
      'c':
          'Deve realizar a portabilidade, pois nesse tipo de renda, é indiferente a tábua atuarial.',
      'd':
          'Não deve realizar a portabilidade, pois ele já contribui há mais de 10 anos no plano atual e faria ele recomeçar do zero a contagem da tabela regressiva.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 45
  Question(
    enunciado:
        'Um investidor deseja na sua aposentadoria, uma renda vitalícia de R\$ 10.000,00. Sabendo que o INSS pagará uma aposentadoria de R\$ 2.800,00, quanto ele precisará ter acumulado? Considere que a taxa da aplicação renderá 0,60% ao mês e o imposto de renda sobre as aplicações de 15%.',
    alternativas: {
      'a': 'R\$ 1.200.000,00',
      'b': 'R\$ 1.411.764,00',
      'c': 'R\$ 1.454.681,00',
      'd': 'R\$ 1.960.784,00',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 46
  Question(
    enunciado:
        'Guilherme tem o desejo de atingir sua independência financeira em 25 anos. Ele lhe informa que já tem acumulado R\$ 100.000,00 e que, para atingir seu objetivo, necessita de uma renda perpétua de R\$ 20.000,00 mensais. Na sua projeção, ele estima que os recursos terão um retorno mensal de 0,80% a partir de hoje. Diante dessas informações, para que ele possa atingir seu objetivo, Guilherme deveria fazer aportes mensais até a sua independência financeira no valor aproximado de:',
    alternativas: {
      'a': 'R\$ 1.135,00',
      'b': 'R\$ 2.016,00',
      'c': 'R\$ 2.897,00',
      'd': 'R\$ 14.245,00',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 47
  Question(
    enunciado:
        'Rafael possui uma renda tributável de R\$ 120.000,00 por ano e lhe diz que deseja fazer um uma previdência para o filho ter uma renda mensal de R\$ 1.000,00 para custear a faculdade daqui 5 anos. Sabendo que ele já contribuiu R\$ 15.000,00 no ano em um PGBL em seu nome, qual das seguintes alternativas é a mais recomendada?',
    alternativas: {
      'a': 'VGBL tabela progressiva.',
      'b': 'VGBL tabela regressiva.',
      'c': 'PGBL tabela progressiva.',
      'd': 'PGBL tabela regressiva.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 48
  Question(
    enunciado:
        'Rafael contribuiu R\$ 1.350,00 por mês durante 15 anos em um VGBL. Sabendo que ele deseja resgatar todo o valor acumulado e teve uma rentabilidade bruta de 8% ao ano, qual o valor aproximado do imposto de renda que lhe será descontado na fonte, sabendo que ele havia optado pela tabela compensável?',
    alternativas: {
      'a': 'R\$ 21.276,00',
      'b': 'R\$ 31.915,00',
      'c': 'R\$ 45.576,00',
      'd': 'R\$ 68.365,00',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 49
  Question(
    enunciado:
        'Uma carteira aplica no ativo A com retorno esperado de 10%, no ativo B com retorno esperado de 12% e no ativo C com retorno esperado de 20%. Qual é o retorno esperado da carteira se os pesos dos ativos A, B e C são respectivamente 60%, 30% e 10%?',
    alternativas: {
      'a': '11,6%',
      'b': '14,0%',
      'c': '16,6%',
      'd':
          'Não é possível calcular o retorno esperado sem saber as covariâncias entre os retornos dos produtos',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 51
  Question(
    enunciado:
        'Um investidor possui R\$ 20.000,00 no ativo X e R\$ 50.000,00 no ativo Y, no qual possuem, respectivamente, volatilidade de 15% e de 5%. Sabendo que esses ativos possuem um coeficiente de correlação de 0,65, você como profissional do mercado financeiro, responde ao cliente que o risco da carteira é de:',
    alternativas: {'a': '1,89%', 'b': '5,16%', 'c': '7,14%', 'd': '8,77%'},
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 54
  Question(
    enunciado:
        'Sobre a Capital Market Line (CML), assinale a alternativa correta:',
    alternativas: {
      'a': 'É a fronteira eficiente.',
      'b':
          'É onde localizam-se as carteiras com a maior rentabilidade possível.',
      'c':
          'É a carteira de mercado, onde o investidor estará 100% comprado em mercado.',
      'd':
          'É uma evolução ao Modelo de Markowitz, ao adicionar um ativo livre de risco à fronteira eficiente',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 56
  Question(
    enunciado:
        'A perda do VaR (Value at Risk) da carteira investimentos de um cliente, já superou em 8%. Qual o procedimento correto que o gestor contratado deve tomar?',
    alternativas: {
      'a':
          'Se valer de derivativos para aumentar a posição direcional da carteira de investimentos.',
      'b':
          'Solicitar novos aportes ao cliente, para se valer da estratégia de preço médio.',
      'c': 'Recalcular o Back Test da carteira de investimentos.',
      'd': 'Acionar o Stop Loss.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 57
  Question(
    enunciado:
        'Considere as seguintes afirmativas sobre o Tracking Error:\nI – Serve para mensurar o risco do ativo não entregar o seu devido benchmark.\nII – Quanto maior o seu valor, maiores são as oscilações perante o benchmark.\nIII – Quanto menor o índice, menor a aderência do fundo em relação ao seu parâmetro de performance.\nEstá correto o que se afirma apenas em:',
    alternativas: {
      'a': 'I, apenas',
      'b': 'II, apenas',
      'c': 'I e II, apenas',
      'd': 'I, II e III',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 59
  Question(
    enunciado:
        'Em um processo de API qual dos fatores abaixo não é levado em consideração:',
    alternativas: {
      'a': 'Situação financeira.',
      'b': 'Objetivo de investimento.',
      'c': 'Experiência em investimento.',
      'd': 'Cenário macroeconômico.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 60
  Question(
    enunciado:
        'Segundo a Resolução nº 30 da CVM, os profissionais que fazem recomendação de produtos de investimento para clientes têm o dever, dentre outras atribuições, de verificar se\nI – a situação financeira do cliente é compatível com o produto, serviço ou operação apresentada.\nII – o produto, serviço ou operação é adequado aos objetivos de investimento do cliente.\nIII – o cliente possui conhecimento necessário para compreender os riscos relacionados ao produto, serviço ou operação apresentada.\nEstá correto o que se afirma em',
    alternativas: {
      'a': 'I e III, apenas.',
      'b': 'I, II e III.',
      'c': 'II e III, apenas.',
      'd': 'I e II, apenas.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 61
  Question(
    enunciado:
        'Um investidor, que está considerando adquirir ações de uma empresa, assiste a uma palestra onde o apresentador fornece apenas dados positivos sobre a companhia, enaltecendo o retorno acima de 20% ao ano, registrado nos últimos 3 anos. O investidor decide então, por comprar a ação, mas, quando solicita que o corretor execute a ordem de compra, recebe um relatório afirmando que o retorno dessa ação ajustado ao risco nos últimos 3 anos, foi bastante desfavorável. Isso faz com que o investidor desista de comprar a ação. Nesse caso, pode-se afirmar que esse investidor apresenta o comportamento viesado conhecido por:',
    alternativas: {
      'a': 'Framing',
      'b': 'Auto Atribuição',
      'c': 'Desconto Hiperbólico',
      'd': 'Aversão a perdas',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 62
  Question(
    enunciado:
        'Segundo a Teoria de Finanças Comportamentais, a estratégia adotada pelos investidores ao tomarem o primeiro preço de compra de uma ação como referência e, a partir desse preço estimar o desempenho futuro dessa ação, é uma consequência da aplicação da heurística denominada:',
    alternativas: {
      'a': 'aversão ao risco.',
      'b': 'disponibilidade.',
      'c': 'ancoragem.',
      'd': 'representatividade.',
    },
    respostaCorreta: 'c', // Insira a resposta correta aqui
  ),

  // Pergunta 63
  Question(
    enunciado:
        'Milene foi aconselhada pelo seu gestor de investimento a adquirir ações de uma determinada empresa, pois os analistas atribuíam uma possibilidade de grande retorno no longo prazo. Passados 15 dias da compra, decidiu vende-las com 2,00% de retorno. Nesse caso, ela exibiu o viés da heurística da:',
    alternativas: {
      'a': 'disponibilidade.',
      'b': 'do excesso de confiança.',
      'c': 'da ancoragem.',
      'd': 'da aversão à perda.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 65
  Question(
    enunciado:
        'Rafael recebeu uma herança em 2020 e deseja investir este valor por 18 meses. Considerando que a Selic-Meta fique acima de 8,5% durante todo o período, que a Taxa Referencial seja 2% ao ano e a taxa do CDI seja de 10% ao ano, ambas constantes durante todo o período, qual a aplicação financeira que terá a maior rentabilidade?',
    alternativas: {
      'a': 'Tesouro Prefixado (LTN) negociada a R\$ 862,07.',
      'b': 'LCI Pós Fixada a 85% CDI.',
      'c': 'CDB Pós Fixado a 100% CDI.',
      'd': 'Caderneta de Poupança.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),

  // Pergunta 66
  Question(
    enunciado:
        'Considere as seguintes afirmativas abaixo em relação a remuneração de um profissional CFP®:\nI – Pode receber de acordo com a performance da carteira do cliente.\nII – Pode receber através de indicação e venda de produtos.\nIII – Pode receber um salário fixo dos clientes.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'I, apenas.',
      'b': 'I e II, apenas.',
      'c': 'II e III, apenas.',
      'd': 'I, II e III.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 67
  Question(
    enunciado:
        'Considere os seguintes fatores:\nI – Horizonte de tempo.\nII – Liquidez.\nIII – Regulamentação.\nIV – Impostos.\nV – Circunstâncias específicas.\nVI – Expectativa para o mercado de capitais.\nSão consideradas restrições do investidor a serem explicitadas em um IPS (Política de Investimentos):',
    alternativas: {
      'a': 'I, II, III e IV, apenas.',
      'b': 'I, II, III, IV e V, apenas.',
      'c': 'III, IV, V e VI, apenas.',
      'd': 'I, II, III, IV, V e VI.',
    },
    respostaCorreta: 'b', // Insira a resposta correta aqui
  ),

  // Pergunta 68
  Question(
    enunciado:
        'Dentre as alternativas abaixo, com base nos padrões da PLANEJAR (Associação Brasileira de Planejadores Financeiros), aquela que não faz parte das etapas de elaboração de um planejamento financeiro pessoal é:',
    alternativas: {
      'a':
          'Identificar os problemas legais do cliente que afetem o plano financeiro pessoal.',
      'b': 'Medir o progresso em direção à conquista dos objetivos do cliente.',
      'c':
          'Executar a implementação das recomendações apresentadas ao cliente.',
      'd':
          'Realizar análise fundamentalista ou técnica de ações de companhias brasileiras adquiridas pelo cliente.',
    },
    respostaCorreta: 'd', // Insira a resposta correta aqui
  ),

  // Pergunta 69
  Question(
    enunciado:
        'No processo de planejamento financeiro descritos pela Planejar, são atividades que fazem parte da fase de Coleta:\nI – Determinar a tolerância do cliente ao risco de investimento.\nII – Determinar as características das apólices de seguro.\nIII – Calcular os possíveis custos em função da morte.\nEstá correto o que se afirma em:',
    alternativas: {
      'a': 'I, apenas.',
      'b': 'I e II, apenas.',
      'c': 'II e III, apenas.',
      'd': 'I, II e III.',
    },
    respostaCorreta: 'a', // Insira a resposta correta aqui
  ),
];

//SIMULADO 2 ----------------------------------------------------------------------------------------------

//SIMULADO 2 ----------------------------------------------------------------------------------------------

final List<Question> simulado2 = [
  // Pergunta 01
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
];

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
            sections: desempenho.entries.map((entry) {
              return PieChartSectionData(
                value: entry.value,
                title: '${entry.key} \n${entry.value.toStringAsFixed(1)}%',
                color: _getColorForSimulado(entry.key),
                radius: 80,
                titleStyle: TextStyle(fontSize: 14, color: Colors.white),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Color _getColorForSimulado(String simulado) {
    switch (simulado) {
      case 'Simulado 1':
        return Colors.blue;
      case 'Simulado 2':
        return Colors.orange;
      case 'Simulado 3':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

class HomePage extends StatelessWidget {
  void navegarParaSimulado(BuildContext context, List<Question> perguntas) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuizPage(perguntas: perguntas)),
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
          children: [
            ElevatedButton(
              onPressed: () =>
                  navegarParaSimulado(context, simulado100Questoes),
              child: Text('Simulado 1OO Questões CEA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navegarParaSimulado(context, simulado1CEA),
              child: Text('Simulado 1 CEA'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navegarParaSimulado(context, simulado2),
              child: Text('Simulado 2'),
            ),
            SizedBox(height: 40), // Espaço extra
            // 🔹 Botão para abrir o gráfico de desempenho
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesempenhoPage(
                      desempenho: {
                        'Simulado 1': 80.0,
                        'Simulado 2': 60.0,
                        'Simulado 3': 90.0,
                      },
                    ),
                  ),
                );
              },
              child: Text('Ver Gráfico de Desempenho'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<Question> perguntas;

  QuizPage({required this.perguntas});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int perguntaAtual = 0;
  String? respostaSelecionada;
  bool respondeu = false;
  Timer? _timer;
  int _secondsElapsed = 0;
  int acertos = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  void perguntaAnterior() {
    if (perguntaAtual > 0) {
      setState(() {
        perguntaAtual--;
        respostaSelecionada = null;
        respondeu = false;
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  void responder(String letra) {
    if (respondeu) return;
    setState(() {
      respostaSelecionada = letra;
      respondeu = true;
      if (letra == widget.perguntas[perguntaAtual].respostaCorreta) {
        acertos++;
      }
    });
  }

  void proximaPergunta() {
    if (perguntaAtual + 1 >= widget.perguntas.length) {
      _timer?.cancel();
      double percentual = (acertos / widget.perguntas.length) * 100;
      bool passou = percentual >= 70;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(
            acertos: acertos,
            total: widget.perguntas.length,
            tempo: _formatTime(_secondsElapsed),
            passou: passou,
          ),
        ),
      );
    } else {
      setState(() {
        perguntaAtual++;
        respostaSelecionada = null;
        respondeu = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pergunta = widget.perguntas[perguntaAtual];

    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${perguntaAtual + 1}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                _formatTime(_secondsElapsed),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pergunta.enunciado, style: TextStyle(fontSize: 18)),
            if (pergunta.imagem != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(
                  pergunta.imagem!,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            SizedBox(height: 20),
            ...pergunta.alternativas.entries.map((entry) {
              final letra = entry.key;
              final texto = entry.value;
              final cor = !respondeu
                  ? Colors.blue
                  : letra == pergunta.respostaCorreta
                  ? Colors.green
                  : (letra == respostaSelecionada ? Colors.red : Colors.grey);
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cor,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => responder(letra),
                  child: Row(
                    children: [
                      Text('$letra) ', style: TextStyle(fontSize: 16)),
                      Expanded(
                        child: Text(texto, style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              );
            }),
            if (respondeu)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (perguntaAtual > 0)
                    ElevatedButton(
                      onPressed: perguntaAnterior,
                      child: Text('Voltar'),
                    ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: proximaPergunta,
                    child: Text(
                      perguntaAtual + 1 >= widget.perguntas.length
                          ? 'Finalizar'
                          : 'Próxima Pergunta',
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class ResultadoPage extends StatelessWidget {
  final int acertos;
  final int total;
  final String tempo;
  final bool passou;

  ResultadoPage({
    required this.acertos,
    required this.total,
    required this.tempo,
    required this.passou,
  });

  @override
  Widget build(BuildContext context) {
    double percentual = (acertos / total) * 100;
    return Scaffold(
      appBar: AppBar(title: Text('Resultado')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você acertou $acertos de $total perguntas.',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text('Tempo total: $tempo', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text(
                'Desempenho: ${percentual.toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                passou
                    ? '✅ Parabéns! Você passou.'
                    : '⚠️ Você não atingiu 70%. Estude mais!',
                style: TextStyle(
                  fontSize: 20,
                  color: passou ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (_) => false,
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
