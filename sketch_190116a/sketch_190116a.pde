float offset = 1;
float t = 0;
float fr = 1;
float c = 0;
Point p;

ArrayList<PVector> points = new ArrayList<PVector>();

float f(float t) {
  return cos(offset * TWO_PI * t);
}

void mousePressed() {
  background(255);
  points = new ArrayList<PVector>();
}

void setup() {
  size(400, 400, P3D);
  background(255);
  p = new Point(cos(0), sin(0));
}

float count() {
  float result = 0;
  for (PVector p : points) {
    result += (p.x);
  }
  return result / points.size();
}


void draw() {
  background(255);
  translate(width/2, height/2);
  offset = map(mouseX, 0, width, 0, 5);
  p.update(t);
  float mag = map(f(t), -1, 1, 20, 120);
  p.pos.setMag(mag);
  p.show();
  line(0, 0, p.pos.x, p.pos.y);
  if (points.size() < 10000) {
    points.add(new PVector(p.pos.x, p.pos.y));
  }
  noFill();
  beginShape();
  for (PVector p : points) {
    vertex(p.x, p.y);
  }
  endShape();
  t += 0.016666;
  //point(t * 5, count() * 5);
}
