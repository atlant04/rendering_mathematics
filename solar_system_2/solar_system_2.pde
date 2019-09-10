Sun sun;
Planet[] planets;


void setup() {
  size(600, 400);
  sun = new Sun(50);
  planets = new Planet[10];
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(i);
  }
}

void draw() {
  background(255);
  for (Planet p : planets) {
    PVector force = sun.attract(p);
    p.applyForce(force);
    p.update();
    p.show();
  }

  sun.show();
}