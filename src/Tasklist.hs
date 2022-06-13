{-# LANGUAGE DeriveFoldable, StandaloneDeriving, DeriveFunctor , OverloadedStrings, OverloadedLists , GeneralisedNewtypeDeriving , TemplateHaskell, NoImplicitPrelude, DuplicateRecordFields, FunctionalDependencies, DefaultSignatures #-}

module Tasklist where
import qualified Data.Sequence                 as S
import           Lens.Micro.Platform            ( makeLenses )
import           RIO
import qualified RIO.Vector.Boxed              as V
import           Task
import           TasklistLive
import           TasklistTest


class (Show o,Generic o, Eq o, Semigroup o ,Monoid o, Monad m) => Tasklist o m | o -> m , m -> o where
    -- Theese are all necassary in order to 
    -- manipulate our adts generically
    constructor :: (m Task -> o)
    iSingle :: Task -> m Task
    iEmpty :: m Task
    unTL :: Lens o o (m Task) (m Task)
    oFL :: [a] -> m a
    append :: m a -> a -> m a
    prepend :: a -> m a -> m a
    {-
        auto-derived functions
    -}
    singleton :: Task -> o
    singleton = constructor . iSingle
    empty :: o
    empty = constructor iEmpty
    fromList :: [Task] -> o
    fromList = constructor . oFL
    addTask :: o -> Task -> o
    addTask list task = list & unTL %~ flip append task
    (<|) :: o -> Task -> o
    (<|) = addTask
    expediteNewTask :: Task -> o -> o
    expediteNewTask t l = l & unTL %~ prepend t
    (|>) :: Task -> o -> o
    (|>) = expediteNewTask
    {-
        Specific for what a tasklist should be able to do
    -}
    -- add new task to list

instance Tasklist TasklistLive V.Vector
    where
  iSingle     = V.singleton
  iEmpty      = V.empty
  constructor = TasklistLive
  unTL        = unTasklistLive
  oFL         = V.fromList
  append      = V.snoc
  prepend     = V.cons

instance Tasklist TasklistTest S.Seq
    where
  iSingle     = S.singleton
  iEmpty      = S.empty
  constructor = TasklistTest
  unTL        = unTasklistTest
  oFL         = S.fromList
  append      = (S.|>)
  prepend     = (S.<|)
