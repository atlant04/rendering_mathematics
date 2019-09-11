class Grid {
  ArrayList<Line> lines = new ArrayList<Line>();

  Grid(){
    for(float x = minX; x <= maxX; x += delta) {
      lines.add(new VerticalLine(x));
    }
    
    for(float y = minY; y <= maxY; y += delta) {
      lines.add(new HorizontalLine(y));
    }
  }
  
  void show(){
    for (Line l : lines) {
      l.drawLine();
    }
  }
  
  void applyFunction() {
    for(Line l : lines) {
      l.applyFunction();
    }
  }
  
  void update() {
    for (Line l : lines) {
      l.update();
    }
  }
    

}
