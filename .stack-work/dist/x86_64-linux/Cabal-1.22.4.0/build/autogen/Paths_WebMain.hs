module Paths_WebMain (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/frank/Documents/Haskell/Scotty/WebMain/.stack-work/install/x86_64-linux/lts-3.2/7.10.2/bin"
libdir     = "/home/frank/Documents/Haskell/Scotty/WebMain/.stack-work/install/x86_64-linux/lts-3.2/7.10.2/lib/x86_64-linux-ghc-7.10.2/WebMain-0.1.0.0-HcMiOXLrJVUKCffsyFmsLT"
datadir    = "/home/frank/Documents/Haskell/Scotty/WebMain/.stack-work/install/x86_64-linux/lts-3.2/7.10.2/share/x86_64-linux-ghc-7.10.2/WebMain-0.1.0.0"
libexecdir = "/home/frank/.cabal/libexec"
sysconfdir = "/home/frank/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "WebMain_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "WebMain_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "WebMain_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "WebMain_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "WebMain_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
