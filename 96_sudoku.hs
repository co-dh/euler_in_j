{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import Data.Array.Repa 
import NumUtils

x :: Array U DIM3 Int 
x = fromListUnboxed ( Z :. 3 :. 3 :. 3 ) [1..27]

main :: IO ()
main =  1 |> show |> putStrLn