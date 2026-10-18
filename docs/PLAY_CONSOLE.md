# Play Console — Calc Combustível

- Conta: joseph santiago (ID 5435993092870364557), app 4972286821322815846
- Pacote: `br.com.seuprojeto.calccombustivel` (definitivo; não dá para trocar)
- Versão na loja: 1 (1.0.0), AAB enviado em 05/06/2026, SDK alvo 36, mín. 24, 16 KB ok

## Feito em 18/10/2026

- Conteúdo do app: sem anúncios, sem ID de publicidade, sem coleta/compartilhamento de dados,
  não governamental, sem recursos financeiros, sem recursos de saúde, público 13+,
  classificação IARC "outros apps" com tudo "Não" (ClassInd Livre, PEGI 3).
- Política de privacidade: https://josephsantiagos.github.io/pilitica-de-privacidade-play-sotre-/calc-combustivel (sem .html: com .html a checagem do Console acusou 404 por engano logo depois do deploy)
- Loja: categoria Automóveis e veículos; contato josephsantiago250@gmail.com, site https://josephsantiagos.github.io
- Ficha pt-BR: textos em `store/descricao-*.txt`, ícone e gráfico em `store/`, 4 capturas em `store/screens/`
  (build web deste código em Chrome headless, 360x640 dp @3 = 1080x1920; arte em `store/arte/*.html`).
- Teste fechado Alpha: Brasil, listas "Combrix interno" + "teste de apps", feedback por e-mail,
  versão 1 (1.0.0) da biblioteca. 14 mudanças ENVIADAS PARA REVISÃO em 18/10/2026 ~16:02.

## Pendências para uma versão 2

- A chave de upload da versão 1 não está nesta máquina (SHA-1 do certificado de upload no Console:
  A8:90:D5:AE:37:CD:4B:5D:81:36:8C:ED:6D:71:B6:C9:56:0D:1B:25). Para enviar build nova é preciso
  achar essa chave ou pedir a redefinição da chave de upload no Console.
- `android/app/src/main/res/values/strings.xml` (app_name) não está no repositório; o manifesto usa
  `@string/app_name`, então o build Android deste código falha até criar o arquivo.
- Textos sem acento (Combustivel, Distancia, Preco, medio, nao) e números com ponto (13.85) em vez de vírgula.
- Link da política de privacidade dentro do app (a política do Google pede link na ficha e no app).
- O PNG do ícone do launcher (`assets/icon/app_icon-1024.png`) saiu com a gota em polígono;
  `store/arte/icone.html` desenha a gota certa a partir do SVG.
