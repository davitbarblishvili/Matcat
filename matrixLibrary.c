#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>


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
void inverseHelper(matrix*, matrix*, float);
double determinant(matrix*, int);
double inverse(matrix*, int);
void cofactor(matrix*, int);
double det(matrix*);
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
    die("matrix add size mismatch");
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

matrix* dotProduct(matrix* lhs, matrix* rhs) {
    //check to make sure matrices are the same size
    if (lhs->num_cols != rhs->num_rows) {
        die("Matrices are not the same size!");
    } 
    //once we know that matrices are same size, we can compute result
    matrix *result = initMatrix(NULL, rhs->num_cols, lhs->num_rows);
    for (int i=0; i < lhs->num_rows; i++)
    {
        for (int j=0; j < rhs->num_cols; j++)
        {
            for (int k=0; k < rhs->num_rows; k++)
            {
                result->matrixAddr[i][j] += lhs->matrixAddr[i][k] * rhs->matrixAddr[k][j];
            }
        }
    }
    return result;
}

matrix* matrxMult(matrix* lhs, matrix* rhs) {
  //check dimensions
  if (lhs->num_rows != rhs->num_rows || lhs->num_cols != rhs->num_rows) {
    die("matrix add size mismatch");
  }

  reverseMatrix(lhs);
  reverseMatrix(rhs);
  int rows_lhs = lhs->num_rows;
  int cols_lhs = lhs->num_cols; 
  int rows_rhs = rhs->num_rows;
  int cols_rhs = rhs->num_cols;
 
  matrix *result = initMatrix(NULL, rows_lhs, cols_lhs);
  for(int i=0; i<rows_lhs; i++) {
    for(int j=0; j<cols_rhs; j++) {
      for (int k = 0; k < cols_rhs; k++){
        result->matrixAddr[i][j] = result->matrixAddr[i][j] + (lhs->matrixAddr[i][k] * rhs->matrixAddr[k][j]);
      }    
    }
  }
  reverseMatrix(result);
  return result;
}

void inv(matrix* input){
  int rows = input->num_rows;
  int cols = input->num_cols; 
  double d = determinant(input,rows);
  if(d == 0){
    die("\nInverse of Entered Matrix is not possible\n");
  }
  matrix *inverseMatrix = initMatrix(NULL, rows, cols);

  cofactor(input, rows);
}

void cofactor(matrix* input, int f)
{
 matrix *b = initMatrix(NULL, f,f);
 matrix *fac = initMatrix(NULL, f,f);

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
      fac->matrixAddr[q][p] = pow(-1, q + p) * determinant(b, f - 1);
    }
  }
  inverseHelper(input,fac,f);

}

double det(matrix* input) {

  int rows = input->num_rows;
  int cols = input->num_cols; 
  if(rows != cols){
    die("Finding a determinant of non-square matrix is not possible");
  }
  
  double deter = determinant(input, cols); 
  printf("%.2f\n",deter);
  return deter;


}


// source code: https://www.sanfoundry.com/c-program-find-inverse-matrix/
double determinant(matrix* input, int k)
{
  reverseMatrix(input);

float s = 1, det = 0;
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

void inverseHelper(matrix* input, matrix* fac, float r)
{
  reverseMatrix(input);
  reverseMatrix(fac);
  printMatrix(input);
  printMatrix(fac);
  int i, j;
  float d;
  float inverse[(int)r][(int)r];
  float b[(int)r][(int)r];
  
  for (i = 0;i < r; i++)
    {
     for (j = 0;j < r; j++)
       {
         b[i][j] = fac->matrixAddr[j][i];
        }
    }
  d = determinant(input,r);
  printf("%f\n",d);

  for (i = 0;i < r; i++)
    {
     for (j = 0;j < r; j++)
       {
        inverse[i][j] = b[i][j] / d;
        }
    }

   printf("\n\n\nThe inverse of matrix is : \n");
   
 
   for (i = 0;i < r; i++)
    {
     for (j = 0;j < r; j++)
       {
         printf("\t%f", inverse[i][j]);
        }
    printf("\n");
     }
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




