float angle = PI / 8;

void setup() {
  size(400, 400);
  colorMode(HSB);
}

float time = 0;
void draw() {
  background(255);
  translate(width/2, height);
  angle = time;
  branch(100);
  time += 0.01;
}

void branch(float len) {
  float hu = map(len, 100, 4, 0, 255);
  stroke(hu, 255, 255);
  line(0, 0, 0, -len);
  translate(0, -len);
 
  if (len > 4) {
    pushMatrix();
    rotate(angle);
    branch(len * 0.7);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    branch(len * 0.7);
    popMatrix();
  }

}