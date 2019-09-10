class Drop {
  float x;
  float y;
  float z; 
  float len;
  float thickness;
  float yspeed;
  
  Drop(){
    x = random(width);
    y = random(-500, -50);
    z = random(0, 20);
    len = map(z, 0, 20, 5, 20);
    thickness = map(z, 0, 20, 1, 3);
    yspeed = map(z, 0, 20, 1, 12);
  }
  
  void update(){
    y += yspeed;
    if(y + len > height)
      y = random(-500, -50);
  }
  
  void show(){
    strokeWeight(thickness);
    stroke(255, 0, 255);
    line(x, y, x, y + len);
  }

}