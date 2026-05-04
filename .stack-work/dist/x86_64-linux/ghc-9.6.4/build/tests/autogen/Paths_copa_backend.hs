{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_copa_backend (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/bin"
libdir     = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/lib/x86_64-linux-ghc-9.6.4/copa-backend-0.1.0.0-34bJX6mVtB961Si6jyxChx-tests"
dynlibdir  = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/lib/x86_64-linux-ghc-9.6.4"
datadir    = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/share/x86_64-linux-ghc-9.6.4/copa-backend-0.1.0.0"
libexecdir = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/libexec/x86_64-linux-ghc-9.6.4/copa-backend-0.1.0.0"
sysconfdir = "/workspaces/perso-2026a-luisfelipeSI001/.stack-work/install/x86_64-linux/ae9300eca721828913d32eb194a08f528457d28ba8794bfc498f691351729b76/9.6.4/etc"

getBinDir     = catchIO (getEnv "copa_backend_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "copa_backend_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "copa_backend_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "copa_backend_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "copa_backend_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "copa_backend_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
