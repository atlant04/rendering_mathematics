class Cell {
  PVector pos;
  PVector u;
  PVector u0;
  PVector v;
  PVector v0;
  PVector posR;
  
  Cell(PVector pos_){
    pos = pos_;
    float x = map(pos.x, -1, 1, 0, width);
    float y = map(pos.y, -1, 1, height, 0);
    posR = new PVector(x, y);
  }
  
  void updateVel(){
    float x = sin(TWO_PI * pos.y + time);
    float y = sin(TWO_PI * pos.x + time);
    u = new PVector(x, y);
  }
  
  void showVel(){
    line(posR.x, posR.y, posR.x + 10 * u.x, posR.y + 10 * u.y);
  }
  

}