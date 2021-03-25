# Matcat

The Matcat language is an imperative, mathematically-inclined, and C-like language with syntactically supports for Linear Algebra.

## Usage

To build the language, clone the repository and run:

```make matcat.native```

This will generate an executable called matcat.native, which acts as an interpreter for our language.

(LLVM is required.)

## Testing

To run the automated test-suite, run:

```make test```

This will run all the existing test cases (tests/test-print.mc shows a hello world example).