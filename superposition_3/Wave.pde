class Wave {
  float amp;
  float v;
  float l;
  ArrayList<Float> path = new ArrayList<Float>();

  Wave(float amp_, float v_, float l_) {
    amp = amp_;
    v = v_;
    l = l_;
    for (int x = 0; x < 1000; x++) {
      float y = amp * sin(TWO_PI/l * (x));
      path.add(y);
    }
  }

  void update() {
    for (int x = 0; x < 1000; x++) {
      float y = amp * sin(TWO_PI / l * (x - v * t));
      path.set(x, y);
    }
  }

  void show() {
    noFill();
    beginShape();
    for (int x = 0; x < path.size(); x++) {
      vertex(x, path.get(x));
    }
    endShape();
  }
}