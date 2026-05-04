{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Control.Monad.IO.Class
import Data.IORef

import Types
import Logic
import InitialData

main :: IO ()
main = do

  estado <- newIORef grupoA

  scotty 3000 $ do

    get "/" $ do
      text "API da Copa funcionando"

    get "/grupo" $ do
      grupo <- liftIO $ readIORef estado
      json (ordenarGrupo grupo)

    post "/resultado" $ do
      partida <- jsonData

      liftIO $ modifyIORef estado (\grupo -> atualizarGrupo grupo partida)

      novoGrupo <- liftIO $ readIORef estado

      json (ordenarGrupo novoGrupo)