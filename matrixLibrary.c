#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <unistd.h>


static void die(const char *message)
{
    perror(message);
    exit(1);
}

struct matrix {
  int num_rows;
  int num_cols;
  float** matrixAddr; // accessed [row][col]
  int buildPosition;
};
typedef struct matrix matrix;
matrix* inverseHelper(matrix*, matrix*, float);
double determinant(matrix*, int);
double inverse(matrix*, int);
matrix* cofactor(matrix*, float);
double det(matrix*);
matrix* rref_helper(matrix*, double);
matrix* accessMatrixDgl(matrix*);
matrix* power_matrix_helper(matrix*, int);

int debug = 0;


void reverseMatrix(matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;

    for(int i = 0; i<row; i++) {
        for(int j=0; j<col/2; j++) {
          float temp = input->matrixAddr[i][j];
          input->matrixAddr[i][j] = input->matrixAddr[i][col-1-j];
          input->matrixAddr[i][col-1-j] = temp;

        }       
    }
}
void printMatrix(matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;
    int temp;
    printf("(");
    printf("\n");
    for(int i = 0; i<row; i++) {
       printf("[");
        for(int j=col-1; j >= 0; j--) {
            printf("%.2f ", input->matrixAddr[i][j]);
        }
        printf("]");
        printf("\n");
    }
    printf(")");

}




matrix* initMatrix(float* listOfValues, int num_cols, int num_rows) {
  float** matrixValues = malloc(num_rows * sizeof(float*));

  if(debug == 1) {
      printf("Building matrix:\n");
      printf("num_rows: %d\n", num_rows);
      printf("num_cols: %d\n", num_cols);
  }

  //set all values in matrix to NULL if list of values is NULL
  if (listOfValues == NULL) {
    for(int i = 0; i < num_rows; i++) {
      float* matrix_row = malloc(num_cols * sizeof(float));
      *(matrixValues + i) = matrix_row;
      for(int j = 0; j < num_cols; j++) {
        matrix_row[j] = 0;
      }
    }
  }
    
  //load values from a list of values
  else {
    for(int i = 0; i < num_cols; i++) {
      float* matrix_col = malloc(num_rows * sizeof(float));
      *(matrixValues + i) = matrix_col;
      for(int j = 0; j < num_rows; j++) {
        matrix_col[j] = listOfValues[i*num_rows + j];
      } 
    }
  }

  //return a pointer to matrix struct
  matrix* result = malloc(sizeof(struct matrix));
  result->num_cols = num_cols;
  result->num_rows = num_rows;
  result->matrixAddr = matrixValues;
  result->buildPosition = 0;
  return result;
}




matrix* initMatrix_helper( int num_cols, int num_rows) {
    return initMatrix(NULL, num_cols, num_rows);
}

matrix* storeEntries(matrix* target, int value) {
    int position = target->buildPosition;
    int curr_row = position / target->num_cols;
    int curr_col = position % target->num_cols;

    if(debug == 1) {
        printf("Storing: %d\n", value);
        printf("in row: %d\n", curr_row);
        printf("in col: %d\n", curr_col);
    }

    target->matrixAddr [curr_row][curr_col] = value;
    target->buildPosition = target->buildPosition + 1;
    return target;
}

matrix* matrxAdd(matrix* lhs, matrix* rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_rows) {
    die("matrix add size mismatch");
  }
  int rows = lhs->num_rows;
  int cols= lhs->num_cols;
  matrix *result = initMatrix(NULL, rows, cols);
  for(int i=0; i<rows; i++) {
    for(int j=0; j<cols; j++) {
        int sum = lhs->matrixAddr[i][j] + rhs->matrixAddr[i][j];
        result->matrixAddr[i][j] = sum;
    }
  }

  return result;
}

matrix* matrxSub(matrix* lhs, matrix* rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_rows) {
    die("matrix sub size mismatch");
  }
  int rows = lhs->num_rows;
  int cols= lhs->num_cols;
  matrix *result = initMatrix(NULL, rows, cols);
  for(int i=0; i<rows; i++) {
    for(int j=0; j<cols; j++) {
        int sum = lhs->matrixAddr[i][j] - rhs->matrixAddr[i][j];
        result->matrixAddr[i][j] = sum;
    }
  }

  return result;
}


matrix* transpose(matrix* input) {
    reverseMatrix(input);
    int rows = input->num_cols;
    int cols = input->num_rows;

    float** matrixValues = malloc(cols * sizeof(float*));

    for (int i = 0; i < rows; i++) {
        float* matrix_col = malloc(rows * sizeof(float));
        *(matrixValues + i) = matrix_col;
        for (int j = 0; j < cols; j++) {
            matrix_col[j] = *(*((input->matrixAddr) + j)+i);
        }
    } 
    input->num_rows = rows;
    input->num_cols = cols;
    input->matrixAddr = matrixValues;
    reverseMatrix(input);
    return input;
}



matrix* matrxMult(matrix* lhs, matrix* rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_rows) {
    die("matrix mult size mismatch");
  }

  matrix* originalMatrix =initMatrix(NULL, lhs->num_rows, lhs->num_cols);

  for(int i = 0; i < lhs->num_rows;i++){
      for(int j = 0; j < lhs->num_cols; j++){
        originalMatrix->matrixAddr[i][j] =lhs->matrixAddr[i][j];
           }
         } 


    reverseMatrix(originalMatrix);
    reverseMatrix(rhs);

 
  
  int rows_lhs = lhs->num_rows;
  int cols_lhs = lhs->num_cols; 
  int rows_rhs = rhs->num_rows;
  int cols_rhs = rhs->num_cols;
 
  matrix *result = initMatrix(NULL, rows_lhs, cols_lhs);
  for(int i=0; i<rows_lhs; i++) {
    for(int j=0; j<cols_rhs; j++) {
      for (int k = 0; k < cols_rhs; k++){
        result->matrixAddr[i][j] = result->matrixAddr[i][j] + (originalMatrix->matrixAddr[i][k] * rhs->matrixAddr[k][j]);
      }    
    }
  }
  

  reverseMatrix(result);
  return result;
}

matrix* inv(matrix* input){
  int rows = input->num_rows;
  int cols = input->num_cols; 
  double d = determinant(input,rows);
  if(d == 0){
    die("\nInverse of the matrix is not possible\n");
  }
   input = (cofactor(input, rows));
   return input;

}

matrix* cofactor(matrix* input, float f)
{
 matrix *b = initMatrix(NULL, (int)f,(int)f);
 matrix *fac = initMatrix(NULL,(int) f,(int)f);

 int p, q, m, n, i, j;
 for (q = 0;q < f; q++)
 {
   for (p = 0;p < f; p++)
    {
     m = 0;
     n = 0;
     for (i = 0;i < f; i++)
     {
       for (j = 0;j < f; j++)
        {
          if (i != q && j != p)
          {
            b->matrixAddr[m][n] = input->matrixAddr[i][j];
            if (n < (f - 2))
             n++;
            else
             {
               n = 0;
               m++;
               }
            }
        }
      }
      reverseMatrix(b);
      fac->matrixAddr[q][p] = pow(-1, q + p) * determinant(b, f - 1);
    }
  }
  return inverseHelper(input,fac,f);

}

matrix* inverseHelper(matrix* input, matrix* fac, float r)
{
  int i, j;
  float d;
  reverseMatrix(input);
  matrix *inverse = initMatrix(NULL,(int)r ,(int) r);
  matrix *b = initMatrix(NULL,(int)r ,(int) r);
  
  for (i = 0;i < r; i++)
    {
     for (j = 0;j < r; j++)
       {
         b->matrixAddr[i][j] = fac->matrixAddr[j][i];
        }
    }

  d = determinant(input,r);
  for (i = 0;i < r; i++)
    {
     for (j = 0;j < r; j++)
       {
        inverse->matrixAddr[i][j] = b->matrixAddr[i][j] / d;
        }
    }
   reverseMatrix(inverse);
   return inverse;
}

double det(matrix* input) {

  int rows = input->num_rows;
  int cols = input->num_cols; 
  if(rows != cols){
    die("Finding a determinant of non-square matrix is not possible in our universe");
  }
  
  double deter = determinant(input, cols); 
  return deter;


}


// source code: https://www.sanfoundry.com/c-program-find-inverse-matrix/
double determinant(matrix* input, int k)
{
reverseMatrix(input);
float s = 1;
double det = 0;
int rows = input->num_rows;
int cols = input->num_cols; 
matrix *result = initMatrix(NULL,rows , cols);
int i, j, m, n, c;
if (k == 1)
  {
   return (input->matrixAddr[0][0]);
  }
  else
    {
     det = 0;
     for (c = 0; c < k; c++)
       {
        m = 0;
        n = 0;
        for (i = 0;i < k; i++)
          {
            for (j = 0 ;j < k; j++)
              {
                result->matrixAddr[i][j] = 0;
              
                if (i != 0 && j != c)
                 {
                   result->matrixAddr[m][n] = input->matrixAddr[i][j];
                   if (n < (k - 2))
                    n++;
                   else
                    {
                     n = 0;
                     m++;
                     }
                   }
               }
             }
          reverseMatrix(result);
          det = det + s * (input->matrixAddr[0][c] * determinant(result, k - 1));
          s = -1 * s;
          }
    }
 
    return det;
}

double dot(matrix* lhs, matrix* rhs) {
    //check to make sure matrices are the same size
    if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_cols) {
        die("Matrices are not the same size!");
    } 
    double dotPr = 0.0;
    //once we know that matrices are same size, we can compute result
    for (int i=0; i < lhs->num_rows; i++)
    {
        for (int j=0; j < rhs->num_cols; j++)
        {  
          dotPr += lhs->matrixAddr[i][j] * rhs->matrixAddr[i][j];
        }
    }
    return dotPr;
}


matrix* scaleMatrix(matrix* input, int scalar) {
  int rows = input->num_rows;
  int cols= input->num_cols;
  matrix *result = initMatrix(NULL, cols, rows);
  
  for(int i=0; i<rows; i++) {
    for(int j=0; j < cols; j++) {
        double product = input->matrixAddr[i][j] * scalar;
        result->matrixAddr[i][j] = product;
    }
  }

  return result;
}

matrix* scaleMatrixDouble(matrix* input, double scalar) {
  int rows = input->num_rows;
  int cols= input->num_cols;
  matrix *result = initMatrix(NULL, cols, rows);

  
  for(int i=0; i<rows; i++) {
    for(int j=0; j < cols; j++) {
        double product = input->matrixAddr[i][j] * scalar;
        result->matrixAddr[i][j] = product;
    }
  }

  return result;
}

matrix* scalarDivMatrix(matrix* input, int scalar) {
  int rows = input->num_rows;
  int cols= input->num_cols;
  matrix *result = initMatrix(NULL, cols, rows);
  
  for(int i=0; i<rows; i++) {
    for(int j=0; j < cols; j++) {
        float product = input->matrixAddr[i][j] / scalar;
        result->matrixAddr[i][j] = product;
    }
  }
  return result;
}

matrix* scalarDivDoubleMatrix(matrix* input, double scalar) {
  if(scalar == 0){
    die("division by 0 is not allowed in thsi universe");
  }
  int rows = input->num_rows;
  int cols= input->num_cols;
  matrix *result = initMatrix(NULL, cols, rows);

  
  for(int i=0; i<rows; i++) {
    for(int j=0; j < cols; j++) {
        double product = input->matrixAddr[i][j] / scalar;
        result->matrixAddr[i][j] = product;
    }
  }
  return result;
}


void cleanUpMatrix (matrix* oMatrix,  double tolerance) {
	
	// Removes all numbers close to zero, i.e between -tol and +tol 
	for (int i = 0; i < oMatrix->num_rows; i++)
		for (int j = 0; j < oMatrix->num_cols; j++)
			if (fabs (oMatrix->matrixAddr[i][j]) < tolerance)
				oMatrix->matrixAddr[i][j] = 0;
}

void exchangeRows (matrix* oMatrix, int r1, int r2) {
 
	double t = 0;
	for (int i = 0; i < oMatrix->num_cols; i++) {
		t = oMatrix->matrixAddr[r1][i];
		oMatrix->matrixAddr[r1][i] = oMatrix->matrixAddr[r2][i];
		oMatrix->matrixAddr[r2][i] = t;
	}
}

double getValue (matrix* oMatrix, int i, int j) {
	
	if ((i < 0) || (j < 0)) {
		printf ("Error in indexing\n");
		getchar ();
		exit (0);
	}
 
	if ((i >= oMatrix->num_rows) || (j >= oMatrix->num_cols)) {
		printf ("Error in indexing: %d, %d\n", i, j);
		getchar ();
		exit (0);
	}
 
	return oMatrix->matrixAddr[i][j];
}



matrix* rref_helper(matrix* oMatrix, double tolerance)
{
	int currentRow; double factor;
 
	matrix* oEchelon = initMatrix(NULL,oMatrix->num_rows, oMatrix->num_cols);
 
	// Make a copy and work on that.
	for (int i = 0; i < oMatrix->num_rows; i++)
		for (int j = 0; j < oMatrix->num_cols; j++)
			oEchelon->matrixAddr[i][j] = oMatrix->matrixAddr[i][j];
 
	int Arow = 0; int Acol = 0;
	while ((Arow < oEchelon->num_rows) && (Acol < oEchelon->num_cols)) {
		// locate a nonzero column
		if (abs (getValue (oEchelon, Arow, Acol) < tolerance)) {
			// If the entry is zero work our way down the matrix
			// looking for a nonzero entry, when found, swap it for Arow 
			currentRow = Arow;
			do {
				// next row
				currentRow++;
				// Have we reached the end of the rows but we've still got columns left to scan?
				if ((currentRow >= oEchelon->num_rows) && (Acol <= oEchelon->num_cols)) {
					// reset row counter back to where it was and try next column 
					currentRow = Arow; Acol++;
				}
 
				// If we've scanned the whole matrix, then lets get out... 
				if (currentRow >= oEchelon->num_rows) {
					cleanUpMatrix (oEchelon, tolerance);
					return oEchelon;
				}
			} while (fabs (getValue (oEchelon, currentRow, Acol)) < tolerance);
 
			// We've found a nonzero row entry so swap it with 'Arow' which did have a zero as its entry 
			exchangeRows (oEchelon, Arow, currentRow);
		}
		// Arow now holds the row of interest }
		factor = 1.0 / getValue (oEchelon, Arow, Acol);
		// reduce all the entries along the column by the factor 
		for (int i = Acol; i < oEchelon->num_cols; i++)
			oEchelon->matrixAddr[Arow][i] = getValue (oEchelon, Arow, i) * factor;
 
		// now eliminate all entries above and below Arow, this generates the reduced form 
		for (int i = 0; i < oEchelon->num_rows; i++) {
			// miss out Arow itself 
			if ((i != Arow) && (fabs (getValue (oEchelon, i, Acol)) > tolerance)) {
				factor = getValue (oEchelon, i, Acol);
				// work your way along the column doing the same operation 
				for (int j = Acol; j < oEchelon->num_cols; j++) {
					oEchelon->matrixAddr[i][j] = getValue (oEchelon, i, j) - factor * getValue (oEchelon, Arow, j);
				}
			}
		}
 
		Arow++; Acol++;
	}
	cleanUpMatrix (oEchelon, tolerance);
	return oEchelon;
}

void rref(matrix* input) {
  reverseMatrix(input);
  printMatrix(rref_helper(input,1e-6));

}

void isInv(matrix* input) {
  double d = determinant(input,input->num_rows);
  if (d == 0){
    printf("%s\n","This matrix is not invertible");
  }else{
    printf("%s\n","This matrix is invertible");
  }
}


matrix* accessMatrix(matrix* input, int row, int col){
  if(row >= input->num_rows || col >= input->num_cols){
    die("Matrix index out of bound");
  }
  reverseMatrix(input);
  matrix* result=initMatrix(NULL, 1, 1);
  result->matrixAddr[0][0]=input->matrixAddr[row][col];
  return result;


}

matrix* accessMatrix1D(matrix* input, int row){
  if(row >= input->num_rows){
    die("Matrix index out of bound");
  }

   matrix* result=initMatrix(NULL, input->num_cols, 1);
  for(int i = row; i < row+1;i++){
           for(int j = 0; j < input->num_cols; j++){
             result->matrixAddr[0][j] =input->matrixAddr[i][j];

           }
         }        
         return result;

}

matrix* accessMatrixCol(matrix* input, int col){
  if(col >= input->num_cols){
    die("Matrix index out of bound");
  }
  
   matrix* result=initMatrix(NULL, input->num_rows, 1);
  for(int i = 0; i < input->num_rows;i++){
           for(int j = col; j < col+1; j++){
             result->matrixAddr[0][i] =input->matrixAddr[i][j];

           }
         }        
         reverseMatrix(result);
         return result;

}


matrix* get_diagonal(matrix* input){
  if(input->num_cols != input->num_rows){
    die("entry should be squared matrix");
  }
  reverseMatrix(input);
  
  matrix* result=initMatrix(NULL, input->num_rows, 1);
  for(int i = 0; i < input->num_rows;i++){
           for(int j = 0; j < input->num_cols; j++){

             if(i == j){
                result->matrixAddr[0][i] =input->matrixAddr[i][j];
             }
           }
         }        
         reverseMatrix(result);
         return result;

}

matrix* power_matrix(matrix* input, int power){
  if(input->num_rows == input->num_cols){
      if(power < 0 ){
      matrix* result=initMatrix(NULL, input->num_rows, input->num_cols);
      result = inv(input);
      int newPower = abs(power);
      result = power_matrix_helper(result, newPower);
      printMatrix(result);
      return result;

    }
    if( power == 0){
      matrix* identityMatrix =initMatrix(NULL, input->num_rows, input->num_cols);
      for(int i = 0; i < input->num_rows;i++){
            for(int j = 0; j < input->num_cols; j++){
              if(i == j){
                identityMatrix->matrixAddr[i][j] = 1;
              }else{
                identityMatrix->matrixAddr[i][j] = 0;
              }
            }
      }
      reverseMatrix(identityMatrix);
      printMatrix(identityMatrix);
      return identityMatrix;
    }
  if(power > 0){
     printMatrix(power_matrix_helper(input,power));
     return input;

  }
  }else{
    die("I need squared matrix to continue calculations");
  }
  return input;
}



matrix* power_matrix_helper(matrix* input, int power){
  if(power == 1){
    return input;
  }
  matrix* tempMatrix =initMatrix(NULL, input->num_rows, input->num_cols);
  matrix* originalMatrix =initMatrix(NULL, input->num_rows, input->num_cols);

  for(int i = 0; i < input->num_rows;i++){
      for(int j = 0; j < input->num_cols; j++){
        originalMatrix->matrixAddr[i][j] =input->matrixAddr[i][j];
           }
         } 
        
  while(power > 1){
    power--;
    tempMatrix = matrxMult(input, originalMatrix);
    input = tempMatrix;
    
  }
  

  return input;

}









#ifdef BUILD_TEST
int main(int argc,char** argv) {
  //run tests of each function
  //initMatrix and display of empty matrix
  matrix *null_matrix=initMatrix(NULL, 2, 2);
  printf("NULL MATRIX: \n");
  display(null_matrix);

  


  //initMatrix and display of 2x2 matrix
  int vals1[] = {3, 8, 4, 6};
  int *list1 = vals1;
  matrix *m = initMatrix(list1, 2, 2);
  printf("2x2 MATRIX: \n");
  display(m);

  //TODO test codegen builder
  for( int i = 0; i < 4; i++) {
      m = storeEntries(m, 5);
      printf("Stroring 5: \n");
      printMatrix(m);
  }
  

}
#endif




