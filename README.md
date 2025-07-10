# CEA App - Simulados para Certificação

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

Aplicativo de simulados desenvolvido em Flutter para auxiliar nos estudos para a **Certificação de Especialista em Investimentos ANBIMA (CEA)**.

## 📱 Telas do Aplicativo

*(Dica: Grave um GIF ou tire screenshots do seu app em funcionamento e coloque aqui. Isso deixa o README muito mais atrativo!)*

| Tela Inicial | Tela de Questões | Tela de Resultado |
| :----------: | :--------------: | :---------------: |
| ![Tela Inicial](https://via.placeholder.com/250x500.png?text=Tela+Inicial) | ![Tela de Questões](https://via.placeholder.com/250x500.png?text=Tela+de+Questões) | ![Tela de Resultado](https://via.placeholder.com/250x500.png?text=Tela+de+Resultado) |

## ✨ Funcionalidades

-   ✅ Múltiplos simulados com questões no estilo da prova CEA.
-   ⏱️ Cronômetro para acompanhar o tempo de resolução de cada simulado.
-   📊 Tela de resultado imediato com percentual de acertos.
-   📈 Gráfico de desempenho para visualização do progresso.
-   🗂️ Código organizado com uma arquitetura limpa e escalável.

## 🚀 Como Executar o Projeto

Siga os passos abaixo para rodar o projeto localmente.

### **Pré-requisitos**

-   É necessário ter o **[Flutter SDK](https://flutter.dev/docs/get-started/install)** instalado na sua máquina.
-   Um editor de código como **VS Code** ou **Android Studio**.

### **Passo a Passo**

1.  **Clone o repositório:**
    ```sh
    git clone [https://github.com/LuanArtacho/cea.git](https://github.com/LuanArtacho/cea.git)
    ```

2.  **Acesse a pasta do projeto:**
    ```sh
    cd cea-app
    ```

3.  **Instale as dependências:**
    ```sh
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    ```sh
    flutter run
    ```

## 📂 Estrutura de Arquivos

O projeto segue uma estrutura de pastas organizada para facilitar a manutenção e escalabilidade:
```
  lib/
  ├── data/
  │   └── simulados.dart
  ├── models/
  │   └── question_model.dart
  ├── pages/
  │   ├── desempenho_page.dart
  │   ├── home_page.dart
  │   ├── quiz_page.dart
  │   └── resultado_page.dart
  ├── widgets/
  │   └── answer_button.dart
  └── main.dart
```

**Legenda:**
-   `data/`: Contém os dados dos simulados (perguntas e respostas).
-   `models/`: Define os modelos de dados da aplicação (ex: `Question`).
-   `pages/`: Contém as telas principais do aplicativo.
-   `widgets/`: Contém widgets reutilizáveis (ex: botões, cards).
-   `main.dart`: Ponto de entrada da aplicação.

## 🛠️ Tecnologias Utilizadas

-   **[Flutter](https://flutter.dev/)**: Framework principal para o desenvolvimento da UI.
-   **[Dart](https://dart.dev/)**: Linguagem de programação.
-   **[fl_chart](https://pub.dev/packages/fl_chart)**: Biblioteca para a criação de gráficos de desempenho.

## 🔮 Próximos Passos (Roadmap)

-   [ ] **Integração com Firebase/Firestore**:
    -   [ ] Salvar resultados de cada simulado no banco de dados.
    -   [ ] Criar tela de "Histórico" para o usuário.
-   [ ] **Autenticação de Usuários**:
    -   [ ] Permitir que usuários criem contas para salvar seu progresso na nuvem.
-   [ ] **Cálculo de Métricas Avançadas**:
    -   [ ] Exibir gráficos de evolução de desempenho ao longo do tempo.
-   [ ] **Modo de Revisão**:
    -   [ ] Permitir que o usuário revise as questões que errou.