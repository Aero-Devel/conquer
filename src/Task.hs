{-# LANGUAGE DeriveFoldable, DeriveGeneric, DeriveFunctor , OverloadedStrings, OverloadedLists , GeneralisedNewtypeDeriving , TemplateHaskell, NoImplicitPrelude, DuplicateRecordFields#-}

module Task where

import           Data.Aeson
import qualified Data.IntMap.Strict            as Map
import           Data.List                      ( singleton )
import           Lens.Micro.Platform            ( makeLenses )
import           RIO
import qualified RIO.Text                      as T
import           Test.QuickCheck
import           Test.QuickCheck.Instances      ( )

newtype Requires = Requires T.Text deriving (Eq, Show, Generic)

makeLenses ''Requires

newtype Details =
    Details { _details :: [T.Text]} deriving (Eq, Show,Semigroup , Monoid, Generic)

makeLenses ''Details

newtype Occassion = Occassion T.Text deriving (Eq, Show, Generic)
makeLenses ''Occassion

newtype ID = ID {_id :: Int} deriving (Show, Eq, Generic )

makeLenses ''ID

instance Arbitrary ID where
  arbitrary = ID <$> arbitrary

data Task = Task
  { _name :: T.Text
  , _det  :: Details
  , _req  :: [Requires]
  , _tID  :: ID
  }
  deriving (Eq, Show, Generic)

makeLenses ''Task

instance Arbitrary Task where
  arbitrary = Task <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Details where
  arbitrary = Details <$> listOf arbitrary

instance Arbitrary Requires where
  arbitrary = Requires <$> arbitrary

instance ToJSON Task
instance FromJSON Task

instance ToJSON Details
instance FromJSON Details

instance ToJSON Requires
instance FromJSON Requires

instance ToJSON ID
instance FromJSON ID
