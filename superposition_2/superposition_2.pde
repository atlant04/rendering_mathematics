/*
  Maksim Tochilkin 11/10/2018
  
  Wave Superposition using rotating circles 

*/


Wave[] waves = new Wave[4]; //create an array of waves
void setup() {
  size(1200, 700);
  waves[0] = new Wave(50, 1, 27, 1, 60, 60); //set each wave with parameters
  waves[1] = new Wave(40, 3, 196, 1, 660, 60);
  waves[2] = new Wave(30, 4, 303, -1, 60, 180);
  waves[3] = new Wave(20, 1, 89, 1, 660, 180);
}

float time = 0;
ArrayList<Float> superWave = new ArrayList<Float>(); //array for the final wave
void draw() {
  background(255);
  line(width/2, 0, width/2, 120);
  line(0, 120, width, 120);
  for (Wave w : waves) {
    w.show();
  }

  translate(200, 500);
  float y = 0;
  float x = 0;
  //somewhat recursive algorithm to render the rotating circles by translating to its 
  //current point on the circumference 
  //push and pop are used to temporarily perform the translations
  pushMatrix(); 
  for (Wave w : waves) {
    y += w.y;
    x += w.x;
    stroke(0, 75);
    ellipse(0, 0, w.amp * 2, w.amp * 2);
    stroke(0);
    line(0, 0, w.x, w.y);
    translate(w.x, w.y);
  }
  
  popMatrix();
  superWave.add(0, y); //adding the product of wave addition to the superwave array

  translate(200, 0);
  line(x - 200, y, 0, superWave.get(0));

  noFill();
  //rendering the resulting wave
  beginShape();
  for (int i = 0; i < superWave.size(); i++) {
    vertex(i, superWave.get(i));
  }
  endShape();
  time += 0.1;
}

//sorting algorithm based on waves' amplitutdes 
void sort(Wave[] waves) {
  int i, j; 
  int n = waves.length;
  for (i = 0; i < n-1; i++) {     
    for (j = 0; j < n-i-1; j++) { 
      Wave a = waves[j];
      Wave b = waves[j + 1];
      if (a.amp > b.amp)
        swap(j);
    }
  }
}

void swap(int j) {
  Wave a = waves[j];
  Wave b = waves[j + 1];
  Wave temp = a;
  a = b;
  b = temp;
}