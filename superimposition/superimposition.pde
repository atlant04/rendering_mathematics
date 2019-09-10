//*************** SETTINGS ********************//
int windowHeight = 700;
float h = windowHeight / 5;


float period_1 = 2;
float amplitude_1 = 20;
float phase_1 = 390;
color color_1 = color(255, 0, 0);

float period_2 = 0.5; //max = 20
float amplitude_2 = 5; //max = 20
float phase_2 = 0; 
color color_2 = color(0, 255, 0);

float f(float x, Wave w) {
  float A = w.amp;
  float D = TWO_PI / w.period;
  float B = w.phase;
  float C = w.shift;      // y = A * cos(D(x + B)) + C
  return A * cos(D * (x + B)) + C;
}
//*********************************************//

Wave w1;
Wave w2;
Wave w3;
void setup() {
  size(1200, 700);
  h = height / 4;
  w1 = new Wave(period_1, amplitude_1, phase_1, color_1, 0);
  w2 = new Wave(period_2, amplitude_2, phase_2, color_2, h);
  w3 = new Wave(2 * h, color(0, 0, 255));
}

float t = 0;
void draw() {
  background(255);
  stroke(0, 0, 0, 200);
  strokeWeight(2);
  line(0, h / 2, width, h / 2);
  line(0, 1.5 * h , width, 1.5 * h);
  line(0, 3 * h , width, 3 * h); //<>//
  w1.update(t);
  w2.update(t);
  w1.show();
  w2.show();
  w3.superImpose(w1, w2);
  w3.show();
  t += 0.25;
}