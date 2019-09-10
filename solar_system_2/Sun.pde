class Sun {
  PVector pos;
  float mass;
  float G;

  Sun(float mass_) {
    pos = new PVector(width/2, height/2);
    mass = mass_;
    G = 1;
  }
  
  PVector attract(Planet p){
    PVector force = PVector.sub(pos, p.pos);
    float d = force.mag();
    d = constrain(d, 10, 30);
    force.normalize();
    float strength = (G * mass * p.mass) / (d * d);
    force.mult(strength);
    
    return force;
  
  }

  void show() {
    stroke(100, 255, 0);
    strokeWeight(2);
    fill(255, 255, 0, 200);
    ellipse(pos.x, pos.y, mass, mass);
  }
}