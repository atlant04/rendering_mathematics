Wave[] waves = new Wave[2];
void setup() {
  size(600, 600);
  waves[0] = new Wave(100, 100, 200);
  waves[1] = new Wave(40, 100, 200);
}

float t = 0;
void draw() {
  background(255);
  translate(0, height / 2);

  for (int i = 0; i < waves.length; i++) {
    waves[i].update();
   // waves[i].show();
  }

  beginShape();
  for (int x = 0; x < 1000; x++) {
    float a = waves[0].path.get(x);
    float b = waves[1].path.get(x);
    vertex(x, (a + b));
  }
  endShape();



  t += 0.01;
}