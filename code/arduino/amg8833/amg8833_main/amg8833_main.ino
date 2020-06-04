#include <MatrixMath.h>
#include <Wire.h>
#include <Adafruit_AMG88xx.h>
#include <math.h>


Adafruit_AMG88xx amg;

const uint8_t ROW_SIZE = 8;
const uint8_t COL_SIZE = 8;
const float THRESHOLD = 10;

float pixels[ROW_SIZE][COL_SIZE];
LinearRegression horizon(0, COL_SIZE);
mtx_type horizonMTX_x[ROW_SIZE];
mtx_type horizonMTX_y[COL_SIZE];

uint8_t rank_mat_x, rank_mat_y;

void setup() {
  Serial.begin(9600);
  Serial.println(F("\nAMG88xx pixels"));

  bool status;

  // default settings
  status = amg.begin();
  if (!status) {
    Serial.println("Could not find a valid AMG88xx sensor, check wiring!");
    while (!(status = amg.begin()));
  }

  Serial.println("-- Pixels Test --");

  Serial.println();

  delay(100); // let sensor boot up
}


void loop() {
  //read all the pixels
  amg.readPixels((float*)pixels);
  empty_coeff();

  find_horizon();
  //print_pixels();

  print_angles();

  //delay a second
  delay(500);
}

void find_horizon() {
  for (uint8_t x = 0; x < ROW_SIZE - 1; ++x) {
    for (uint8_t y = 0; y < COL_SIZE - 1; ++y) {
      if ((pixels[x + 1][y]) < 0 && (pixels[x][y]) > 0) {
        horizon.learn(x + 1, y);
        horizonMTX_x[x + 1] = -y;
        ++rank_mat_x;
      }
      if ((pixels[x][y + 1]) < 0 && pixels[x][y] > 0) {
        horizon.learn(x, y + 1);
        horizonMTX_y[y + 1] = -x;
        ++rank_mat_y;
      }
      if ((pixels[x + 1][y]) > 0 && (pixels[x][y]) < 0) {
        horizon.learn(x, y);
        horizonMTX_x[x] = y;
        ++rank_mat_x;
      }
      if ((pixels[x][y + 1]) > 0 && pixels[x][y] < 0) {
        horizon.learn(x, y);
        horizonMTX_y[y] = x;
        ++rank_mat_y;
      }
    }
  }
}

void empty_coeff () {
  horizon.reset();
  rank_mat_x = 0;
  rank_mat_y = 0;
}


void print_pixels () {
  Serial.print("[");
  for (uint8_t x = 0; x < ROW_SIZE; ++x) {
    for (uint8_t y = 0; y < COL_SIZE; ++y) {
      Serial.print(pixels[x][y]);
      Serial.print(", ");
    }
    Serial.println();
  }
  Serial.println("]");
  Serial.println();
}

void print_angles() {


  mtx_type coeffs_x[2] = {0, 0};
  mtx_type coeffs_y[2] = {0, 0};
  if ( rank_mat_x > 1) {
    LinearRegressionMTX linear_horizon (horizonMTX_x, rank_mat_x);
    linear_horizon.getCoeffs(coeffs_x);
  }
  if ( rank_mat_y > 1) {
    LinearRegressionMTX linear_horizon (horizonMTX_y, rank_mat_y);
    linear_horizon.getCoeffs(coeffs_y);
  }

  double alpha = 0;
  double beta = 0;

  if (coeffs_x[0] == 0) {
    alpha = PI / 2;
    beta = PI / 6 / 3.5 * (3.5 * (1 - coeffs_y[0]) - coeffs_y[1]) / (sqrt(coeffs_y[0] * coeffs_y[0] + 1));
  }
  else if (coeffs_y[0] == 0) {
    alpha = 0;
    beta = PI / 6 / 3.5 * (3.5 * (1 - coeffs_x[0]) - coeffs_x[1]) / (sqrt(coeffs_x[0] * coeffs_x[0] + 1));
  }
  else if (coeffs_x[0] != 0 && coeffs_y[0] != 0) {
    alpha = ((PI / 2 - atan2(11, coeffs_y[0])) * rank_mat_y + atan2(-1, coeffs_x[0]) * rank_mat_x) / (rank_mat_y + rank_mat_x);
    beta = PI / 6 / 3.5 * ((3.5 * (1 - coeffs_x[0]) - coeffs_x[1]) / (sqrt(coeffs_x[0] * coeffs_x[0] + 1)) * rank_mat_x
                           + (3.5 * (1 - coeffs_y[0]) - coeffs_y[1]) / (sqrt(coeffs_y[0] * coeffs_y[0] + 1)) * rank_mat_y)
           / (rank_mat_y + rank_mat_x);
  }

  Serial.println("{ ");
  Serial.print("\tangle alpha : "); Serial.println(alpha * 180 / PI);
  Serial.print("\thorizontal : "); Serial.println(beta * 180 / PI);
  Serial.println("}");
}
