{-#LANGUAGE PolyKinds,ImpredicativeTypes#-}
import Data.Kind
data S::k->k-> *
f::forall b.(forall k(a::k).S a b)->()
f=()
