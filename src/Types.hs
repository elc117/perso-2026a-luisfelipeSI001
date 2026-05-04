{-# LANGUAGE DeriveGeneric #-}

module Types where

import GHC.Generics
import Data.Aeson

data Selecao = Selecao
  { nome :: String
  , pontos :: Int
  , golsPro :: Int
  , golsContra :: Int
  } deriving (Show, Eq, Generic)

instance ToJSON Selecao
instance FromJSON Selecao

data Partida = Partida
  { time1 :: String
  , gols1 :: Int
  , time2 :: String
  , gols2 :: Int
  } deriving (Show, Eq, Generic)

instance ToJSON Partida
instance FromJSON Partida