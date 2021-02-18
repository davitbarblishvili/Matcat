# Matcat

The Matcat language is an imperative, mathematically-inclined language whose goal is to
aid in the writing and computation of linear algebra operations. The implementation of these
functions will occur in similar ways to the Wolfram language (see
https://reference.wolfram.com/language/guide/MatricesAndLinearAlgebra.html). Matcat aims to
mimic functionality from Java and C.

Our primary goals are:
● To simplify operations on matrices. Examples of these include row reduction, computing
transformations, finding eigenvalues/eigenvectors, diagonalizing/transposing a matrix,
performing the Gram-Schmidt process to find orthogonal bases, and others.
● To achieve Java-like syntax
● To allow users to write readable code; matrix/vector structures and the operators must
mirror mathematical symbols and read intuitively
● Compile time optimizations (static typing)
