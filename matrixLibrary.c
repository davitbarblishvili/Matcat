#include <stdlib.h>
#include <stdio.h>
#include <string.h>


static void die(const char *message)
{
    perror(message);
    exit(1);
}

struct matrix {
  int num_rows;
  int num_cols;
  int** matrixAddr; // accessed [row][col]
  int buildPosition;
};
typedef struct matrix matrix;

int debug = 0;


void reverseMatrix(matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;


    for(int i = 0; i<row; i++) {
        for(int j=0; j<col/2; j++) {
          int temp = input->matrixAddr[i][j];
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
            printf("%d ", input->matrixAddr[i][j]);
        }
        printf("]");
        printf("\n");
    }
    printf(")");

}




matrix* initMatrix(int* listOfValues, int num_cols, int num_rows) {
  int** matrixValues = malloc(num_rows * sizeof(int*));

  if(debug == 1) {
      printf("Building matrix:\n");
      printf("num_rows: %d\n", num_rows);
      printf("num_cols: %d\n", num_cols);
  }

  //set all values in matrix to NULL if list of values is NULL
  if (listOfValues == NULL) {
    for(int i = 0; i < num_rows; i++) {
      int* matrix_row = malloc(num_cols * sizeof(int));
      *(matrixValues + i) = matrix_row;
      for(int j = 0; j < num_cols; j++) {
        matrix_row[j] = 0;
      }
    }
  }
    
  //load values from a list of values
  else {
    for(int i = 0; i < num_cols; i++) {
      int* matrix_col = malloc(num_rows * sizeof(int));
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


matrix* transpose(matrix* input) {
    reverseMatrix(input);
    int rows = input->num_cols;
    int cols = input->num_rows;

    int** matrixValues = malloc(cols * sizeof(int*));

    for (int i = 0; i < rows; i++) {
        int* matrix_col = malloc(rows * sizeof(int));
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




