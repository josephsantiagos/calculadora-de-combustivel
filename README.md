# Calculadora de Combustivel

Aplicativo Flutter para calculo rapido de eficiencia e custo de viagem.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Visao Geral

Este projeto foi criado com foco em simplicidade de uso, performance e calculo confiavel para uso no dia a dia. O app recebe distancia, combustivel gasto e preco por litro, retornando os principais indicadores da viagem.

## Funcionalidades

- Calculo de consumo em `km/L`
- Conversao para `L/100 km`
- Calculo de custo por km
- Calculo de custo total da viagem
- Validacao de formulario com suporte a `,` e `.` em numeros decimais
- Funcionamento 100% offline
- Nenhuma coleta de dados pessoais

## Stack e Arquitetura

- Flutter + Dart
- Material 3
- Estrutura simples e direta em `lib/main.dart`
- Lints com `flutter_lints`

## Preview

Os diagramas de apoio do projeto estao em:

- `docs/estrutura_codigo.svg`
- `docs/fluxo_calculadora.svg`

## Como Rodar Localmente

### Pre-requisitos

- Flutter SDK 3.x
- Dart SDK 3.x

### Passos

```bash
git clone https://github.com/josephsantiagos/calculadora-de-combustivel.git
cd calculadora-de-combustivel
flutter pub get
flutter run
```

## Qualidade

```bash
flutter analyze
flutter test
```

Este repositorio inclui CI no GitHub Actions para executar analise estatica e testes automaticos a cada push/pull request.

## Build Android (Play Console)

1. Ajuste o ID do app em `android/gradle.properties` na propriedade `APP_APPLICATION_ID`.
2. Crie `android/key.properties` a partir de `android/key.properties.example`.
3. Configure a keystore em `android/key.properties`.
4. Gere o bundle:

```bash
flutter build appbundle --release
```

## Publicacao e Compliance

- Politica de privacidade: [docs/privacy-policy.md](docs/privacy-policy.md)
- Checklist Play Console: [docs/play_console_checklist.md](docs/play_console_checklist.md)

## Roadmap

- Melhorar internacionalizacao (pt-BR/en)
- Adicionar testes de widget para o fluxo principal
- Publicar screenshot oficial da interface no README

## Licenca

Distribuido sob a licenca MIT. Veja [LICENSE](LICENSE) para mais detalhes.
