module Main where

import Types
import Logic

brasil :: Selecao
brasil = Selecao "Brasil" 0 0 0

main :: IO ()
main = do

  let vencedor = atualizarSelecao brasil "Brasil" 2 1

  if pontos vencedor == 3
    then putStrLn "Teste vitória OK"
    else putStrLn "Teste vitória FALHOU"

  let empate = atualizarSelecao brasil "Brasil" 1 1

  if pontos empate == 1
    then putStrLn "Teste empate OK"
    else putStrLn "Teste empate FALHOU"