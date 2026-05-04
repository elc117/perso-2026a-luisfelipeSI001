module Logic where

import Types
import Data.List

saldo :: Selecao -> Int
saldo s = golsPro s - golsContra s

atualizarSelecao :: Selecao -> String -> Int -> Int -> Selecao
atualizarSelecao selecao nomeTime golsFeitos golsSofridos
  | nome selecao /= nomeTime = selecao
  | otherwise =
      selecao
        { pontos = pontos selecao + novosPontos
        , golsPro = golsPro selecao + golsFeitos
        , golsContra = golsContra selecao + golsSofridos
        }
  where
    novosPontos
      | golsFeitos > golsSofridos = 3
      | golsFeitos == golsSofridos = 1
      | otherwise = 0

atualizarGrupo :: [Selecao] -> Partida -> [Selecao]
atualizarGrupo grupo partida =
  map atualizar grupo
  where
    atualizar s
      | nome s == time1 partida =
          atualizarSelecao s (time1 partida) (gols1 partida) (gols2 partida)

      | nome s == time2 partida =
          atualizarSelecao s (time2 partida) (gols2 partida) (gols1 partida)

      | otherwise = s

ordenarGrupo :: [Selecao] -> [Selecao]
ordenarGrupo =
  sortBy comparar
  where
    comparar a b
      | pontos a /= pontos b = compare (pontos b) (pontos a)
      | otherwise = compare (saldo b) (saldo a)