

ArrayList<PVector> points;


void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB);
  points = new ArrayList<PVector>();
}

int i = 0;
void draw() {
  if (mousePressed) {
    stroke(255);
    points.add(new PVector(mouseX - width/2, mouseY - height/2));
  }
  //println(points);
  translate(width/2, height/2);
  if (i == 255)
    i = 0;
  else
    i++;
  for (int n = 0; n < 6; n++) {
    rotate(TWO_PI / 6);
    strokeWeight(2);
    noFill();
    beginShape();
    for (PVector p : points) {
      stroke(i, 255, 255);
      vertex(p.x, p.y);
      //println(p);
    }
    endShape();
  }
}