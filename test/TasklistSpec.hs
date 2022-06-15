{-# LANGUAGE NoImplicitPrelude, ScopedTypeVariables #-}

module TasklistSpec
  ( spec
  ) where

import           Import
import           Tasklist
import           Test.Hspec
import           Test.Hspec.QuickCheck
import TasklistTest
import TasklistLive
import Task

spec :: Spec
spec = describe "Tasklist" $ do
  prop "1. Adding a task to an empty tl = expediting to empty = singleton of said task"
  $  (\t -> prop1t t && prop1l t)

prop1t :: Task -> Bool
prop1t t =
    let addT :: TasklistTest  = addTask empty t in
        addT == singleton t
        && expediteNewTask t empty == addT

prop1l :: Task -> Bool
prop1l t =
    let addT :: TasklistLive  = addTask empty t in
        addT == singleton t
        && expediteNewTask t empty == addT

