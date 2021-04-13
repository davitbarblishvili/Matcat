#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct matrix {
  int num_rows;
  int num_cols;
  int** matrixAddr; // accessed [row][col]
  int buildPosition;
};
typedef struct matrix matrix;

int debug = 0;

void printMatrix(matrix* input) {
    int row = input->num_rows;
    int col = input->num_cols;
    for(int i = 0; i<row; i++) {
        for(int j=0; j<col; j++) {
            printf(" %d", input->matrixAddr[i][j]);
        }
        printf("\n");
    }
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

