# Checklist Play Console

## Status tecnico

- Bundle release gera com sucesso via flutter build appbundle --release
- App sem coleta de dados e sem anuncios
- Sem permissoes sensiveis no manifest principal
- Nome do app configurado para Calc Combustivel
- Release preparada para usar keystore propria via android/key.properties

## Itens para revisar antes do primeiro upload

- Trocar APP_APPLICATION_ID em android/gradle.properties por um identificador unico e definitivo
- Criar android/key.properties com sua keystore real
- Confirmar nome do desenvolvedor e email de suporte
- Conferir versao e numero de build em pubspec.yaml

## Respostas esperadas no Play Console

- Data safety: o app nao coleta nem compartilha dados
- Ads: nao
- App access: nao necessario
- Content rating: utilitario, sem conteudo sensivel
- Target audience: publico geral

## Materiais de loja recomendados

- Icone 1024x1024: assets/icon/app_icon-1024.png
- Politica de privacidade: docs/privacy-policy.md
- Capturas de tela do app em uso
- Descricao curta e completa da loja