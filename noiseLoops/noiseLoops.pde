float r = 10;
float maxNoise = 2;
float zoff = 0;
float phase = 0;

ArrayList<PVector[]> loops = new ArrayList<PVector[]>();
void setup() {
  size(400, 400);
  stroke(255);
  noFill();
}


float time = 0;
float angle = 0;
ArrayList<PVector> spiral = new ArrayList<PVector>();
void draw() {
  background(0);
  translate(width/2, height/2);
  maxNoise = map(mouseX, 0, width, 0, 8);

  PVector[] loop = new PVector[100];
  int index = 0;
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI/100) {
    float xoff = map(cos(i + phase), -1, 1, 0, maxNoise);
    float yoff = map(sin(i + phase), -1, 1, 0, maxNoise);
    float rad = r * noise(xoff, yoff, zoff);
    float x = rad * (16 * pow(sin(i), 3));
    float y = rad * (13 * cos(i) - 5 * cos(2 * i) - 2 * cos(3 * i) - cos(4 * i));
    vertex(x, -y);
    loop[index] = new PVector(x, -y);
    index++;
  } 
  endShape();

  if (frameCount % 2 == 0)
    loops.add(loop);

    for (PVector[] l : loops) {
      beginShape();
      for (PVector p : l) {
        vertex(p.x, p.y);
      }
      endShape(CLOSE);
    }

  if (loops.size() > 8) {
    loops.remove(0);
  }

  zoff += 0.05;
  phase += 0.01;
  time += 0.03;
}

void spiralMode() {
  float x = r * time * cos(angle);
  float y = r * time * sin(angle);
  spiral.add(new PVector(x, y));

  beginShape();
  for (PVector p : spiral) {
    vertex(p.x, p.y);
  }
  endShape();

  if (angle > 4 * TWO_PI)
    spiral.clear();

  angle += 0.02;
}