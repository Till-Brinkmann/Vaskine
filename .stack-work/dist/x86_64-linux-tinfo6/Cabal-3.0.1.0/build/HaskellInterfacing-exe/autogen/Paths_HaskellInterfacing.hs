{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_HaskellInterfacing (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/bin"
libdir     = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/lib/x86_64-linux-ghc-8.8.4/HaskellInterfacing-0.1.0.0-8uKryXPURbz1PDdqXjHLW6-HaskellInterfacing-exe"
dynlibdir  = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/share/x86_64-linux-ghc-8.8.4/HaskellInterfacing-0.1.0.0"
libexecdir = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/libexec/x86_64-linux-ghc-8.8.4/HaskellInterfacing-0.1.0.0"
sysconfdir = "/home/can/Dokumente/Haskell/Vaskine/.stack-work/install/x86_64-linux-tinfo6/f673781d349334b30e6934086e9e2bc52aab64056c21c545a3265847bcbb2599/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HaskellInterfacing_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HaskellInterfacing_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HaskellInterfacing_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HaskellInterfacing_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HaskellInterfacing_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HaskellInterfacing_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
