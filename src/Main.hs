module Main where

import Control.Concurrent (threadDelay)
import Control.Parallel.Strategies
import GHC.AssertNF
import Control.DeepSeq

main :: IO ()
main = do
  let list = [1..10] :: [Int]
  evaluatedList <- runEvalIO $ do
    m <- parList rdeepseq list
    rseq m

  --threadDelay 1000000

  isEvaluated <- isNF evaluatedList
  putStrLn $ "isNF evaluatedList = " ++ show isEvaluated