{-# LANGUAGE NoImplicitPrelude #-}
module TaskSpec
  ( spec
  ) where

import           Import
import           Task
import           Test.Hspec
import           Test.Hspec.QuickCheck

spec :: Spec 
spec =  describe "Tasks" $ do prop "noprop" True

{-

spec :: Spec
spec = do
  describe "Tasks" $ do
    prop "tl monoid left right id" $ (\ts1 -> ts1 <> mempty == ts1 && mempty <> ts1)
    --prop "tl monoid assoc" $ (\ts1 ->  <> emptyTaskList == ts1)
    --prop "tl foldable" $ (\ts1 ->  <> emptyTaskList == ts1)

-}