# s-LISP

`SLISP` is a pure-functional `LISP` implementation in `Haskell`.
Initially, it started as a simple `S-expr` parser to demonstrate how the [parser-S](https://github.com/thyeem/s) nicely works, but decided to go a little more.

I hope a little more than 1k lines of this code is one of the simplest and the most readable LISP implementation (never means well-written '-']/), compared to its functionality.

## Features
  - Based on [parser-S](https://github.com/thyeem/s) (plays all roles in the `R` part in the REPL)
  - Pure-functional (_NO reference object used like `IORef`_)
  - Wrote all codes with a very few principle: the concept of a state machine.
  - Code-flow _explicitly follows_ the state transition.
  - Compatible with a few hundreds of CLisp's main built-in functions (on process)


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
