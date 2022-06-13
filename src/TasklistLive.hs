{-#LANGUAGE TemplateHaskell, DeriveGeneric,GeneralisedNewtypeDeriving, NoImplicitPrelude , MultiParamTypeClasses #-}

module TasklistLive where
import qualified RIO.Vector.Boxed                 as V
import           Lens.Micro.Platform            ( makeLenses )
import           RIO
import Task
import Test.QuickCheck (Arbitrary(arbitrary))
import Data.Aeson

newtype TasklistLive = TasklistLive {_unTasklistLive  :: V.Vector Task}
    deriving (Show, Eq, Semigroup ,Monoid, Generic, ToJSON, FromJSON)

makeLenses ''TasklistLive

instance Arbitrary TasklistLive where
    arbitrary = TasklistLive <$> arbitrary  
