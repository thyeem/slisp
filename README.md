# sLISP

`sLISP` is a pure-functional `LISP` implementation in `Haskell`.
Initially, it started as a simple _S-expression_ parser to demonstrate how the [`s`](https://github.com/thyeem/s) nicely works, but decided to go a little more.

I hope that this **1k+ lines of code** will be one of the simplest and _the most readable LISP implementation_ compared to capability it has.

## Features
  - Based on [`s`](https://github.com/thyeem/s) (plays all roles in the `R` part in the REPL)
  - Pure-functional (_NO reference object used like `IORef`_)
  - Coded with a very few principles and patterns 
    > each bind (`>>=`) exactly corresponds to a single state transition
  - Almost compatible with `CLISP` main built-in functions (in progress)

## Build
```bash
$ git clone https://github.com/thyeem/slisp

# build: this yields ~80kB binary 'sl'
$ stack build

# run sLISP REPL
$ stack run

# test
$ stack test

# documentation
$ stack haddock --open slisp 
```

## Demo
<img src="demo.gif" width="480" />

## REPL
`sLISP` __REPL__ supports simple but some useful modes. Each mode is switched right after key input as shown below.

```lisp
;; one semicolon -> paste-mode (multi-line input)
sLISP> ;

;; two semicolons -> debug-mode (describe S-expression with hierarchical structure)
sLISP> ;;

;; three semicolons -> view the REPL environment (symbol-data map)
sLISP> ;;;

;; four semicolons -> list all built-in functions
sLISP> ;;;;

```
