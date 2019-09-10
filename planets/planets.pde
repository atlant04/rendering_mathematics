
PVector target;
float mass = 10;
float G = 0.05;

Planet p;
void setup() {
  size(800, 800, P3D);
  noStroke();
  p = new Planet(1);
  target = new PVector(width/2, height/2);
}

void draw() {
  background(255);
  target.set(mouseX, mouseY);
  fill(255, 255, 0);
  ellipse(target.x, target.y, 50, 50);

  p.update();
  p.attract();
  p.show();
}