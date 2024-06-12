module Main where

import System.FilePath
import System.Process
import System.IO

main :: IO ()
main = do 
  testOutput "programs/GHC-10190.hs"
  pure ()

data Result = InvalidFilename

testOutput :: FilePath -> IO Result
testOutput fp
  | (name, ".hs") <- splitExtension fp
  -- , Just num_str <- stripPrefix "GHC-" name
  -- , Just number  <- readMaybe num_str
    = do (_, _, _, _) <- createProcess (ghcProcess fp)
         -- hGetContents' hout >>= print
         pure InvalidFilename -- TODO
  | otherwise
    = pure InvalidFilename

ghcProcess fn = proc "ghc"
  [ "-outputdir", outputPath
  , fn]

outputPath :: String
outputPath = "dist-newstyle/golfed-errors-tmp/"
