-- blacktip in Chris' library
import qualified Control.Concurrent as CC
import qualified Control.Concurrent.MVar as MV
import qualified Data.ByteString.Char8 as B 
import qualified Data.Locator as DL
import qualified Data.Time.Clock.POSIX as PSX
import qualified Filesystem as FS 
import qualified Filesystem.Path.CurrentOS as FPC
import qualified Network.Info as NI 
import qualified Safe
import Control.Exception(mask,try)
import Control.Monad(forever,when)
import Data.Bits
import Data.Bits.Bitwise(fromListBE)
import Data.List.Split(chunksOf)
import Database.Blacktip.Types
import System.IO.Unsafe(unsafePerformIO)


--Q1. What functions are being imported fromControl.Monad?
-- forever, when
-- 2.Which imports are both unqualified and imported in their entirety?
-- Data.Bits and Database.Blacktip.Types
-- 3.From the name, what do you suppose importing the Types module brings in?
-- All the type class like Bool, Char, String, List and the definition
-- 4.Now, let’s compare a small part of blacktip’s code to the above import list:

writeTimestamp:: MV.MVarServerState-> FPC.FilePath-> IO CC.ThreadId
writeTimestamp s path= do
    CC.forkIO go
    where go=forever $ do
          ss<- MV.readMVar s
          mask $ \_ -> do
              FS.writeFile path
              (B.pack (show (ssTime ss)))
              -- sleep for 1 second
              CC.threadDelay 1000000
-- a) The type signature refers to three aliased imports.What modules are named in those aliases?
--    MV = Control.Concurrent.MVar
--    FS = Filesystem.
--    CC = ControlConcurrent 

-- b) Which import does FS.writeFile refer to?
--    FS =  qualified Filesystem

-- c) Which import does forever come from?
--    Control.Monad(forever,when)
