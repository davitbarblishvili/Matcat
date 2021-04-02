# Matcat

The Matcat language is an imperative, mathematically-inclined, and C-like language that supports  Linear Algebra expressions.

## Usage

To build the language, clone the repository and run:

```make matcat.native```Ty

This will generate an executable called matcat.native, which acts as a compiler for our language.

(LLVM is required.)

To download LLVM, please refer to this page: https://llvm.org/.

## Testing

To run the automated test-suite, run:

```make test```

This will run all the existing test cases (tests/test-print.mc shows a hello world example in matcat).