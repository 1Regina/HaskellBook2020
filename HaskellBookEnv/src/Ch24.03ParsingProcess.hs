module Parsing where 
import Control.Monad.Trans.State
import Text.Trifecta           (Parser, parseString)


-- p1365
type Parser a = String -> Maybe (a , String)

newtype Reader r a = Reader { runReader :: r -> a}
newtype State s a  = State  { runState :: s -> (a, s)}
-- get :: Monad m => StateT s m s
-- put :: Monad m => s -> StateT s m()
-- runStateT :: StateT s m a -> s -> m (a, s)

-- >>> runStateT (put 8) 7
-- ((),8)

-- >>>  runStateT (put 1 >> get) 8
-- (1,1)

-- >>> runStateT get 8
-- (8,8)

-- >>>  (runStateT $ put 1 >> get) 0
-- (1,1)

-- rs = runStateT
-- n :: Integer
-- n = 10021490234890

-- >>> (rs $ put 2 >> get) n
-- (2,2)

-- >>> (rs $ put 2 >> return 9001) 0
-- (9001,2)


-- p1370
-- read two characters, '1' and '2'

-- oneTwo :: m b
-- oneTwo = char '1' >> char '2'
-- -- read two characters,
-- -- '1' and '2', then die

-- oneTwo' :: m b
-- oneTwo' = oneTwo >> stop

testParse :: Parser Char -> IO()
testParse p = print $ parseString p mempty "123"


-- >>> :t oneTwo

-- Parsers like values and combining them using the same stuff we use with ordinary functions or opearators from the Applicative and Monad type classes. The structure that makes up the Applicative or Monad in this case is the Parser itself. 
-- Write a function to print a string to standard output (stdout) with a newline prefixed and then use that function as part of a main

pNL :: [Char] -> IO ()
pNL s =
    putStrLn ('\n' : s)

main = do
    pNL "stop:"
    testParse stop

    pNL "one:"
    testParse one

    pNL "one':"
    testParse one'

    pNL "oneTwo:"
    testParse oneTwo

    pNL "oneTwo':"
    testParse oneTwo'

-- >>> main
