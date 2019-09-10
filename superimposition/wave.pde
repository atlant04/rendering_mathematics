class Wave {
  float period;
  float phase;
  float amp;
  float shift;
  color c;
  ArrayList<Float> points = new ArrayList<Float>();

  Wave(float per_, float amp_, float phase_, color c_, float s_) {
    period = per_ * 10;
    amp = -map(amp_, 0, 20, 0, h / 2); //invert the amplitude because Processing's radians are in different direction
    phase = radians(phase_);
    shift = s_;
    c = c_;
  }

  Wave(float s, color c_) {
    shift = s;
    c = c_;
  }

  void superImpose(Wave w1, Wave w2) {
    noFill(); 
      stroke(c); 
      beginShape(); 
      for (int i = 0; i < w1.points.size(); i++) {
      float y1 = w1.points.get(i); 
        float y2 = w2.points.get(i); 
        float y = y1 + y2 + shift; 
        vertex(i, y);
    }
    endShape();
  }

  void update(float x) {
    float y = f(x, this); 
      points.add(y);
  }

  void show() {
    noFill(); 
      stroke(c); 
      beginShape(); 
      for (int x = 0; x < points.size(); x++) {
      float y = points.get(x) + h / 2; 
        vertex(x, y);
    }
    endShape(); 

      if (points.size() > width) {
      points.remove(0);
    }
  }
}