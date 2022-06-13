{-#LANGUAGE TemplateHaskell, DeriveGeneric,GeneralisedNewtypeDeriving, NoImplicitPrelude , MultiParamTypeClasses #-}

module TasklistTest where
import qualified Data.Sequence                 as S
import           Lens.Micro.Platform            ( makeLenses )
import           RIO
import Task
import Test.QuickCheck (Arbitrary(arbitrary))
import Data.Aeson 

newtype TasklistTest = TasklistTest {_unTasklistTest :: S.Seq Task}
    deriving (Show, Eq, Semigroup ,Monoid, Generic)

makeLenses ''TasklistTest

instance Arbitrary TasklistTest where
    arbitrary = TasklistTest <$> arbitrary  

instance ToJSON TasklistTest
instance FromJSON TasklistTest