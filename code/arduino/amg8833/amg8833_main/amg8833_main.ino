#include <MatrixMath.h>
#include <Wire.h>
#include <Adafruit_AMG88xx.h>
#include "Regression_lineaire.h"
#include "LinearRegression_mtx.h"

Adafruit_AMG88xx amg;

const uint8_t ROW_SIZE = 8;
const uint8_t COL_SIZE = 8;
const float THRESHOLD = 8;

float pixels[ROW_SIZE ][COL_SIZE];
LinearRegression horizon(0, COL_SIZE);
mtx_type horizonMTX[COL_SIZE];

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
  print_pixels();

  print_angles();

  //delay a second
  delay(3000);
}

void find_horizon() {
  for (uint8_t x = 0; x < COL_SIZE - 1; ++x) {
    for (uint8_t y = 0; y < ROW_SIZE - 1; ++y) {
      if (abs(pixels[x + 1][y] - pixels[x][y]) > THRESHOLD){
        horizon.learn(x + 1, y);
        horizonMTX[x+1] = y;
      }
      if (abs(pixels[x][y + 1] - pixels[x][y]) > THRESHOLD){
        horizon.learn(x, y + 1);
        horizonMTX[x] = y+1;
      }
    }
  }
}

void empty_coeff () {
  horizon.reset();
  for (auto &val: horizonMTX)
    val = 0;
}


void print_pixels () {
  Serial.print("[");
  for (uint8_t x = 0; x < COL_SIZE; ++x) {
    for (uint8_t y = 0; y < ROW_SIZE; ++y) {
      Serial.print(pixels[x][y]);
      Serial.print(", ");
    }
    Serial.println();
  }
  Serial.println("]");
  Serial.println();
}

void print_angles() {
  double values[3];
  horizon.getValues(values);
  Serial.println("methode 1 { ");
  if (values[2] != 0) {
    Serial.print("number of values : "); Serial.println(values[2]);
    Serial.print("\tvertical : "); Serial.println(values[0]);
    Serial.print("\thorizontal : "); Serial.println(values[1]);
  }
  Serial.println("}");

  mtx_type coeffs[2];
  LinearRegressionMTX linear_horizon (horizonMTX);
  linear_horizon.getCoeffs(coeffs);
  Serial.println("methode 2 { ");
    Serial.print("\tvertical : "); Serial.println(coeffs[0]);
    Serial.print("\thorizontal : "); Serial.println(coeffs[1]);
  Serial.println("}");
}
