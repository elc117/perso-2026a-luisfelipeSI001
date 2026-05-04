module InitialData where

import Types

criarSelecao :: String -> Selecao
criarSelecao nomeTime = Selecao nomeTime 0 0 0

carregarGrupo :: String -> [Selecao]
carregarGrupo conteudo =
  map criarSelecao (lines conteudo)