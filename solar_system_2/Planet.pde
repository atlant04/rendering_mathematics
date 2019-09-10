class Planet {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float radius;

  Planet(float mass_) {
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(3), random(3));
    acc = new PVector(0, 0);
    mass = mass_;
    radius = map(mass, 0, planets.length - 1, 16, 30);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  void show() {
    stroke(0);
    fill(100, 200);
    ellipse(pos.x, pos.y, radius, radius);
  }
}