abstract class Line {
  float pos;
  ArrayList<Complex> nums = new ArrayList<Complex>();
  
  
  Line(float pos) {
    this.pos = pos;
  }
  
  void drawLine(){
    noFill();
    beginShape();
    for(Complex p : nums){
      float x = map(p.real, minX, maxX, 0, width);
      float y = map(p.img, minY, maxY, height, 0);
      vertex(x, y);
    }
    endShape();
  }
  
  void applyFunction() {
    for(Complex p : nums) {
      p.applyFunction();
    }
  }
  
  void update() {
    for(Complex num : nums) {
      num.move();
    }
  }
}

class HorizontalLine extends Line {
  
  HorizontalLine(float y){
    super(y);

    for(float x = minX; x <= maxX; x += delta){
      nums.add(new Complex(x, y));
    }
  
  }
  
}

class VerticalLine extends Line {
  
  VerticalLine(float x){
    super(x);

    for(float y = minY; y <= maxY; y += delta){
      nums.add(new Complex(x, y));
    }
  
  }
  
}
