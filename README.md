# s-LISP

`SLISP` is a pure-functional `LISP` implementation in `Haskell`.
Initially, it started as a simple `S-expr` parser to demonstrate how the [parser-S](https://github.com/thyeem/s) nicely works, but decided to go a little more.

I hope that the 1k+ lines of this code will be one of the simplest and the most readable LISP implementation, compared to its functionality.

## Features
  - Based on [parser-S](https://github.com/thyeem/s) (plays all roles in the `R` part in the REPL)
  - Pure-functional (_NO reference object used like `IORef`_)
  - Coded with a very few principles and patterns -> the concept of a state machine (each bind `>>=` exactly indicates a single state transition)
  - Compatible with a few hundreds of `CLISP`'s main built-in functions (on-progress)
  - Implemented from scratch using _Haskell_ `prelude` only


## Demo
<img src="demo.gif" width="540" />

## REPL
`SLISP` __REPL__ supports simple but some useful modes. Each mode is switched right after key input as shown below.

```lisp
;; one semicolon -> paste-mode (multi-line input)
SLISP> ;

;; two semicolons -> debug-mode (describe S-expression with hierarchical structure)
SLISP> ;;

;; three semicolons -> view the REPL environment (symbol-data map)
SLISP> ;;;

;; four semicolons -> list all built-in functions
SLISP> ;;;;

```
## Build
```bash
# Assume the Haskell GHC and cabal is installed

# build: this yields ~80kB binary 'sl' in ./app directory.
$ make release

# test
$ make test

# documentation
$ make doc

$ make opendoc
```
