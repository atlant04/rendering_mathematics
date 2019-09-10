class Wave {
  float amp;
  float period;
  float phase;
  PVector pos;
  float y;
  float x;
  int dir = 0;
  ArrayList<Float> wave = new ArrayList<Float>();
  //all the parameters needed for a wave
  Wave(float amp_, float period_, float phase_, int dir_, int x_, int y_) {
    amp = amp_;
    period = period_;
    phase = radians(phase_);
    dir = dir_;
    pos = new PVector(x_, y_);
  }

  void show() {
    translate(pos.x, pos.y);
    y = amp * sin(dir * (period / TWO_PI) * (time + phase)); //calculating y coordinate based on parametric form of a circle
    x = amp * cos((period / TWO_PI) * (time + phase)); //calculating x coordinate based on parametric form of a circle
    wave.add(0, y);

    ellipse(0, 0, amp * 2, amp * 2);
    ellipse(x, y, 8, 8);
    line(0, 0, x, y);


    noFill();
    stroke(0);
    translate(100, 0);
    line(x - 100, y, 0, wave.get(0));
    beginShape();
    for (int i = 0; i < wave.size(); i++) {
      vertex(i, wave.get(i));
    }
    endShape();
    translate(-pos.x - 100, -pos.y);
    if (wave.size() + amp + 200 > 600) {
      wave.remove(wave.size() - 1);
    }
  }
}