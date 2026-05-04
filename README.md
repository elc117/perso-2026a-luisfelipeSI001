Backend Web com Haskell + Scotty

---

## 1. Identificação

- Nome: Luis Felipe Martins  
- Curso: Sistemas de Informação  

---

## 2. Tema/objetivo

O projeto consiste no desenvolvimento de um backend web em Haskell utilizando a biblioteca Scotty para simular partidas da Copa do Mundo.

O sistema permite visualizar a classificação de um grupo, registrar resultados de partidas e atualizar automaticamente a tabela.

A lógica principal foi implementada utilizando programação funcional, com funções puras responsáveis por atualizar pontuação, gols e ordenação da classificação.

Os dados das seleções são carregados a partir de um arquivo externo, evitando acoplamento direto com o código e facilitando alterações futuras.

---

## 3. Processo de desenvolvimento

Inicialmente a ideia do projeto era desenvolver um simulador mais completo da Copa do Mundo de 2026, contemplando todos os grupos e seleções participantes, além das fases eliminatórias.

Durante a prática, foi possível perceber que essa abordagem tornaria o projeto muito extenso para o tempo disponível e poderia comprometer a qualidade da implementação.

Dessa forma, foi tomada a decisão de simplificar, focando em apenas um grupo com quatro seleções e na simulação da fase de grupos. Essa escolha permitiu concentrar esforços na implementação correta da lógica funcional, garantindo que o sistema fosse consistente, testável e funcional.

O desenvolvimento começou com a configuração do ambiente Haskell e testes iniciais com o Scotty para validar a criação de rotas HTTP.

Uma das principais dificuldades encontradas foi a organização dos módulos Haskell, principalmente a relação entre nomes de arquivos e nomes de módulos. Também houve dificuldades na configuração do ambiente dentro do Codespaces, incluindo instalação do GHC e Stack.

A lógica da aplicação foi separada da camada web, permitindo que as funções fossem testadas independentemente do servidor HTTP. Isso ajudou a entender melhor conceitos de programação funcional.

Inicialmente os dados das seleções estavam definidos diretamente no código. Após orientação, foi implementada a leitura a partir de arquivo externo, melhorando a organização do sistema.

Também foram encontrados erros na manipulação de JSON nas requisições POST, o que ajudou a compreender melhor a integração entre Scotty e a biblioteca Aeson.

Por fim, foi adicionada uma interface web simples para facilitar a interação com o sistema, permitindo simular partidas de forma mais visual.

---

## 4. Testes

Os testes foram realizados em um arquivo separado, contendo chamadas diretas às funções puras responsáveis pela lógica do sistema.

Foram testados principalmente:
- atualização de pontuação em caso de vitória;
- atualização em caso de empate.

Esses testes garantem que a lógica principal funcione corretamente sem depender da camada web.

---

## 5. Execução

Para executar o projeto localmente:

bash
stack setup
stack build
stack run
O servidor será iniciado na porta 3000.

Acesse no navegador:
http://localhost:3000

Para executar os testes:

stack run tests
## 6. Deploy

O deploy foi tentado utilizando o Render com Docker, porém foram encontrados erros relacionados à configuração do ambiente Haskell e compatibilidade de versões do GHC durante o processo de build.

Mesmo com tentativas de ajuste no Dockerfile e na configuração do Stack, o serviço não foi concluído com sucesso dentro do tempo disponível.

Apesar disso, o sistema funciona corretamente em ambiente local, atendendo aos requisitos principais do trabalho.

## 7. Resultado final

O sistema final permite:

visualização da tabela de classificação;
simulação de partidas;
atualização automática dos resultados.

A interface web facilita a interação com o backend, tornando o sistema mais próximo de um simulador real.

(Inserir aqui GIF ou vídeo curto demonstrando o funcionamento)

## 8. Uso de IA
8.1 Ferramentas utilizadas
ChatGPT (GPT-5.3)
8.2 Interações relevantes
Interação 1
Objetivo: estruturar o backend em Haskell
O que foi utilizado: organização do projeto e separação entre lógica e rotas
Interação 2
Objetivo: resolver erros de compilação
O que foi utilizado: correções relacionadas ao Stack, GHC e organização dos módulos
Interação 3
Objetivo: implementar integração com Scotty e JSON
O que foi utilizado: criação das rotas GET e POST e manipulação de dados com Aeson

### 8.3 Exemplo de erro da IA

Em alguns momentos, a IA sugeriu configurações de Docker e Stack que não funcionaram corretamente no ambiente do Render, sendo necessário ajustar manualmente a configuração.

### 8.4 Comentário pessoal

O uso de IA ajudou bastante no desenvolvimento, principalmente na resolução de erros e organização do código.

Porém, foi necessário entender o funcionamento das soluções para adaptar ao projeto, principalmente na parte de lógica funcional e integração com o backend.

## 9. Referências
Documentação do Scotty: https://hackage.haskell.org/package/scotty
Documentação do Stack: https://docs.haskellstack.org
Render: https://render.com
Material de aula da disciplina
