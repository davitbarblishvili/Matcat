# Matcat

The Matcat language is an imperative, mathematically-inclined, and C-like language that supports efficient matrix manipulation for Linear Algebra.

This is a class project for COMS W4115 Programming Languages and Translators, Spring 2021 at Columbia University.

## Environment

Our compiler is developed and has been tested on
- Ubuntu 18.04 with OCaml 4.10.0 and LLVM 6.0;
- macOS with OCaml 4.10.0 and LLVM 6.0;
- macOS with OCaml 4.10.0 and LLVM 11.1.0;

To set up the environment to build the language, please install Ocaml and LLVM.

The instructions of installing Ocaml and LLVM can be found here:
- https://ocaml.org/docs/install.html
- https://llvm.org/docs/GettingStartedTutorials.html

Other than installing Ocaml and LLVM manually, you may also run a docker to build and run Matcat.
You may run the following commands to set up the docker environment:

```
docker build . -t mcDocker
docker run --rm -it -v `pwd`:/home/mc -w=/home/mc mcDocker
```

## Usage

### Building the Language

To build the language, clone this repository and run:

```make matcat.native```

This will generate an executable called matcat.native, which acts as a compiler for our language.


### Compile and Run a Matcat Program

To compile and run a Matcat program, run:

```./run.sh <NAME_OF_THE_PROGRAM>.mc```

The executable and the intermediate files `(.s, .ll)` will be run and deleted after execution.


## Testing

We have used two test-suites in this project. They are written in shell script and python.

To run the automated test-suite that written in shell script, run:

```make test```

To run the one written in python, run:

```python testall.py```

(Please make sure you have installed python >=3.6 and other required libraries.)
(You may needs `py`, `py3`, or `python3` depending on your system configurations.)

Both of them will run all the existing test cases in `./tests` (tests/test-print.mc shows a hello world example in matcat).

## References

[MicroC](http://www.cs.columbia.edu/~sedwards/classes/2021/4115-spring/microc.tar.gz)

- We start our project with MicroC

[PixelPlusPlus](https://github.com/maobowen/PixelPlusPlus/)

- Our Vdecl took a lot of their ideas in declaring variables as a statement: make sure the symbol table is updated in each statement and the way we look for the which scope a variable belongs to.

[Shoo](https://github.com/sam-jay/shoo-lang/)

- We followed their format and the designs in their LRM and Final Report

[Coral](https://github.com/jacobaustin123/Coral)

- We followed their format and the designs in their LRM and Final Report