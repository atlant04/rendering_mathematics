class Point {
  PVector pos;
  Point(float x_, float y_) {
    pos = new PVector(x_, y_);
  }
  
  void show(){
    stroke(0);
    strokeWeight(3);
    point(pos.x, pos.y);
  }
  
  void update(float t){
    pos.x = cos(t);
    pos.y = sin(t);
    
  }
}
