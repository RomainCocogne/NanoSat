#pragma once
#include <MatrixMath.h>

class LinearRegressionMTX {
  private:
    mtx_type coeffs_[2];

    void compute_coeffs (mtx_type values[], uint8_t INDEX_SIZE) {
      mtx_type index[INDEX_SIZE][2];
      for (int i = 0; i < INDEX_SIZE; ++i) {
        index[i][0] = i;
        index[i][1] = 1;
      }

      mtx_type index_transpose[2][INDEX_SIZE];
      Matrix.Transpose((mtx_type*)index, INDEX_SIZE, 2, (mtx_type*)index_transpose);

      mtx_type indexprod[2][2];
      Matrix.Multiply((mtx_type*)index_transpose, (mtx_type*)index, 2, INDEX_SIZE, 2, (mtx_type*)indexprod);
      Matrix.Invert((mtx_type*)indexprod, 2);

      mtx_type indexprod2[2][INDEX_SIZE];
      Matrix.Multiply((mtx_type*)indexprod, (mtx_type*)index_transpose, 2, 2, INDEX_SIZE, (mtx_type*)indexprod2);


      Matrix.Multiply((mtx_type*)indexprod2, (mtx_type*)values, 2, INDEX_SIZE, 1, (mtx_type*)coeffs_);

      //Matrix.Print((mtx_type*)values, INDEX_SIZE, 1, "values");
      //Matrix.Print((mtx_type*)indexprod2, 2, INDEX_SIZE, "indexprod2");
      //Matrix.Print((mtx_type*)coeffs_, 2, 1, "coeffs");
    }



  public:
    LinearRegressionMTX() {}
    LinearRegressionMTX(mtx_type values[], uint8_t INDEX_SIZE) {
      compute_coeffs(values, INDEX_SIZE);
    }

    void resetCoeffs() {
      coeffs_[0] = 0;
      coeffs_[1] = 0;
    }

    void calculate(mtx_type values[], uint8_t INDEX_SIZE) {
      compute_coeffs(values, INDEX_SIZE);
    }

    void getCoeffs(mtx_type coeffs[2]) {
      coeffs[0] = coeffs_[0];
      coeffs[1] = coeffs_[1];
    }

};
