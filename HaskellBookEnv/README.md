# HaskellBookEnv

1. Open Terminal
2. cd /Users/regina/Code/Haskell/HaskellBook/HaskellBookEnv
3. For regular .hs files:
    -  a) stack ghci
    -  b) :l src/Chxxxxx.hs
4. For import errors:
    *  a) Adding import dependencies to package.yaml
    *  b) Save package.yaml
    *  c) Cmd + Shift + p and select Develop: Reload Window
    *  d) Go to terminal and input stack ghci
5. For new project that needs a separate Main.hs:
    *  a)  Create a folder Chapter2x with a Main.hs and its .hs file
    *  b)  Go to package.yaml and add one more executable then uncomment the top line "executables"
    *  c)  Option 1: Go to terminal and input stack ghci HaskellBookEnv:exe:Ch2 (or whatever the name)
    *  d)  Option 2: 
          *  i)  stack ghci  
          *  ii) Wait for prompt, input Ch21 or whatever is the executable name
    *  e)  Option 3: If there has a new project with app folder, go to the project and do stack run