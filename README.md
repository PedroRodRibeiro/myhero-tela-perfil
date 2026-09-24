# MyHero — Tela de Perfil

Projeto desenvolvido como atividade da disciplina de **Desenvolvimento Mobile II**, do curso de **Análise e Desenvolvimento de Sistemas — 4º período**, no **IPOG**.

A atividade consiste na implementação de uma nova tela em um projeto Flutter existente, mantendo a identidade visual e os padrões já utilizados pela aplicação.

## 📱 Funcionalidade implementada

Foi desenvolvida uma nova **Tela de Perfil**, integrada à aplicação MyHero.

A tela apresenta:

* Identificação do usuário;
* Status do perfil;
* Acesso aos Dados Pessoais;
* Heróis Favoritos;
* Notificações;
* Configurações;
* Botão para retornar à tela anterior.

A implementação preserva o padrão visual existente no projeto, utilizando componentes do Material Design, cores, tipografia, espaçamentos e elementos compatíveis com as demais telas.

## 🔄 Navegação

A Tela de Perfil pode ser acessada diretamente pela **Home** da aplicação.

O fluxo implementado é:

```text
Home / Lista de Heróis
        ↓
   Ícone de Perfil
        ↓
    Meu Perfil
        ↓
      Voltar
        ↓
Home / Lista de Heróis
```

A navegação utiliza o sistema de rotas nomeadas já existente no projeto Flutter.

## 🛠 Tecnologias utilizadas

* Flutter
* Dart
* Material Design / Material 3
* MobX
* Provider
* Android SDK
* Git e GitHub

## 📂 Principais arquivos alterados

```text
lib/
├── main.dart
└── ui/
    ├── home/
    │   └── list_hero.dart
    └── user_profile/
        └── user_profile.dart
```

O arquivo `user_profile.dart` contém a nova interface, enquanto `main.dart` registra a nova rota e `list_hero.dart` disponibiliza o acesso à tela pela Home.

## ▶️ Como executar

Clone o repositório:

```bash
git clone https://github.com/PedroRodRibeiro/myhero-tela-perfil.git
```

Acesse a pasta:

```bash
cd myhero-tela-perfil
```

Instale as dependências:

```bash
flutter pub get
```

Com um dispositivo Android ou emulador disponível, execute:

```bash
flutter run
```

## ✅ Validação

O projeto foi validado com:

```bash
flutter analyze
```

Resultado:

```text
No issues found!
```

A funcionalidade também foi executada e validada em emulador Android.

## 👨‍💻 Autor

**Pedro Henrique Rodovalho Ribeiro**

Análise e Desenvolvimento de Sistemas — 4º período
IPOG — Instituto de Pós-Graduação e Graduação
