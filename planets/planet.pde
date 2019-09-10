class Planet {
  PVector pos;
  PVector vel;
  PVector acc = new PVector(0, 0);
  float m;
  
  Planet(float m_) {
    pos = new PVector(width/2, height/2);
    vel = PVector.random2D();
    vel.mult(10);
    m = m_;
  }
  
  void attract(){
    PVector force = target.copy().sub(pos);
    force.normalize();
    force.mult(G * mass * m / force.magSq());
    acc.add(force);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.mult(0.995);
  }
  
  void show(){
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 20, 20);
  }

}