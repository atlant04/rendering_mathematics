class Vehicle {
  PVector pos;
  PVector vel;
  
  Vehicle(){
    pos = new PVector(mouseX, mouseY);
  }
  
  void show(){
    noStroke();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 8, 8);
  }
  
  PVector lookup(){
    int x = int(map(pos.x, 0, width, 0, N));
    int y = int(map(pos.y, 0, height, 0, N));
    return grid.cells[IX(x, y) - 1].u.copy();
  }
  
  void update(){
    vel = lookup();
    pos.add(vel);
    if(pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0){
      pos.x = width/2;
      pos.y = height/2;
    }
  }

}