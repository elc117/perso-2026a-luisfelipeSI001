{-# LANGUAGE OverloadedStrings #-}

module Main where

import Network.Wai.Middleware.Static
import Web.Scotty
import Control.Monad.IO.Class
import Data.IORef

import Types
import Logic
import InitialData

main :: IO ()
main = do

  conteudo <- readFile "data/grupoA.txt"

  estado <- newIORef (carregarGrupo conteudo)

  scotty 3000 $ do

    middleware $ staticPolicy (noDots >-> addBase "static")

    get "/" $ do
      file "static/index.html"

    get "/grupo" $ do
      grupo <- liftIO $ readIORef estado
      json (ordenarGrupo grupo)

    post "/resultado" $ do
      partida <- jsonData

      liftIO $ modifyIORef estado (\grupo -> atualizarGrupo grupo partida)

      novoGrupo <- liftIO $ readIORef estado

      json (ordenarGrupo novoGrupo)