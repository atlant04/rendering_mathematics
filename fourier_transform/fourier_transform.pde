/* 
  Maskim Tochilkin 12/07/2018
  
  Descret Fourier Tranform visualized with rotating circles
  based on user's input drawing. Note: has two modes
                                 1 - DFT individually x and y values
                                 2 - DFT(x, y) vector, pretending it is a complex number

*/
int mode = 2; //choose mode
ArrayList<Float> pointsX = new ArrayList<Float>(); //arrays for mode 1
ArrayList<Float> pointsY = new ArrayList<Float>();
ArrayList<PVector> path = new ArrayList<PVector>(); //array for mode 2
ArrayList<PVector> contour = new ArrayList<PVector>(); //array to store drawing coordinates
ArrayList<PVector> xs; //transformed x values (used as primary array in mode 2)
ArrayList<PVector> ys; //transformed y values 

boolean draw = false;

void mouseReleased() { //as soon as mouse is released, perform dft
                       //and sort the resulting waves based on amplitutde
  if (mode == 1) {
    ys = dft(pointsY);
    xs = dft(pointsX);
    sort(ys);
    sort(xs);
  } else if (mode == 2) {
    xs = dft2(contour);
    sort(xs);
  }
  draw = true;
}
void setup() {
  size(800, 600);
}

float time = 0;
void draw() {
  background(255);
  noFill();
  if (mousePressed) { //while mouse is pressed, store the positiong of the mouse for drawing coordinates
    if (mode == 1) {
      pointsX.add((float)(mouseX - (width/2 + 100)));
      pointsY.add((float)(mouseY - (height/2 + 100)));
    } else if (mode == 2) {
      contour.add(new PVector(mouseX - width/2, mouseY - height/2));
      beginShape();
      for (PVector p : contour) {
        vertex(p.x + width/2, p.y + height/2);
      }
      endShape();
    }
  }
  
  if (draw) {
    if (mode == 1) {
      cycles();
    } else if (mode == 2) {
      center();
    }

    beginShape();
    for (PVector p : path) {
      vertex(p.x, p.y);
    }
    endShape();

    float dt = TWO_PI / xs.size(); //time incriments depend on the size of array to make 
                                   //one full revolution each time 
    time += dt;
    if (time > TWO_PI) {
      time = 0;
      path.clear();
    }
  }
}

//make waves based on the returned values of amplitute
//frequancy, and phase by the DFT method
//also render the waves as circles
PVector epiCycle(float x, float y, float angle, ArrayList<PVector> vals) {
  pushMatrix();
  translate(x, y);
  for (int i = 0; i < vals.size(); i++) {
    PVector params = vals.get(i);
    float amp = params.x;
    float fr = params.y;
    float phase = params.z;
    float dx = amp * cos(fr * time + phase + angle);
    float dy = amp * sin(fr * time + phase + angle);
    x += dx;
    y += dy;
    stroke(0, 75);
    ellipse(0, 0, amp * 2, amp * 2);
    stroke(0);
    line(0, 0, dx, dy);
    translate(dx, dy);
  }
  popMatrix();

  return new PVector(x, y); //return the position of the wave superpositiong point 
}

void cycles() {
  PVector vx = epiCycle(width/2 + 100, 100, 0, xs);
  PVector vy = epiCycle(100, height/2 + 100, HALF_PI, ys);
  PVector v = new PVector(vx.x, vy.y);
  path.add(v);
  line(vx.x, vx.y, v.x, v.y);
  line(vy.x, vy.y, v.x, v.y);
}
void center() {
  PVector v = epiCycle(width/2, height/ 2, 0, xs);
  path.add(v);
}
//sorting algorithm
void sort(ArrayList<PVector> vals) {
  for (int i = 0; i < vals.size() - 1; i++) {
    for (int j = 0; j < vals.size() - 1 - i; j++) {
      PVector a = vals.get(j);
      PVector b = vals.get(j + 1);
      if (a.x < b.x) {
        PVector temp = a.copy();
        vals.set(j, b);
        vals.set(j + 1, temp);
      }
    }
  }
}