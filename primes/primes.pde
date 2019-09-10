/*
  Maksim Tochilkin 07/1/2018
  Showing prime numbers are not random, they are indeed super prime 
  Using Karel J. Robot algorithm
*/

int d = 2; //side of the little squares
int w = 400 / d; //# of squares in the width
int h = 400 / d; //# of squares in the height

int[][] vals; //array for left square
color[][] rect; //array for right square

void setup() {
  size(800, 400);
  vals = new int[w][h];
  rect = new color[w][h];

  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      vals[x][y] = 0; //populating array with all zeros at first
    }
  }

  for (int x = 0; x < w; x++) {
    for (int y = 0; y < h; y++) {
      color str;
      if (int(random(0, 9)) == 1) { //randomizer with 10% probability right now
        str = color(255, 0, 0);
      } else {
        str = color(255, 255, 255);
      }
      rect[x][y] = str;
    }
  }

  vals[w/2][h/2] = 1;
}

//Karel stuff, checking if the left is blocked

boolean leftIsBlocked() { 
  boolean result = false;
  if (dir == 3) {
    if (vals[x + 1][y] != 0) {
      result = true;
    }
  } else if (dir == 2) {
    if (vals[x][y - 1] != 0) {
      result = true;
    }
  } else if (dir == 1) {
    if (vals[x - 1][y] != 0) {
      result = true;
    }
  } else if (dir == 4) {
    if (vals[x][y + 1] != 0) {
      result = true;
    }
  }

  return result;
}

//move one step in the array according to the heading 
void move() {
  if (dir == 3) {
    y += 1;
  } else if (dir == 2) {
    x += 1;
  } else if (dir == 1) {
    y -= 1;
  } else if (dir == 4) {
    x -= 1;
  }
}

//turning left, changing dir 
void turnLeft() {
  dir = dir - 1;
  if (dir == 0) {
    dir = 4;
  }
}

//method and math for checking if x is prime 
boolean isPrime(int x) {
  if (x==1 || x==0) {
    return false;
  } else {
    for (int i=2; i<=Math.sqrt(x); i++) {
      if (x%i==0) return false;
    }
    return true;
  }
}

//place the number if index is prime 
void place() {
  boolean prime = isPrime(index);
  if (prime)
    vals[x][y] = 2;
  else
    vals[x][y] = 1;
}

int x = w / 2;
int y = h / 2;

int dir = 2;
int index = 0;


void draw() {
  background(0);
  //do 200 iterations each frame to make the animation faster 
  //main algorithm for moving in a spiral, just like Karel 
    for (int j = 0; j < 200; j++) {
      place();
      if (leftIsBlocked()) {
        move();
      } else {
        turnLeft();
        move();
      }
      index++;
    }
    
//render the array for the left square
  for (int xs = 0; xs < vals[0].length; xs++) {
    for (int ys = 0; ys < vals.length; ys++) {
      int i = vals[xs][ys];
      color str = 0;
      if (i != 0) {
        if (i == 1)
          str = color(255, 255, 255);
        else if (i == 2)
          str = color(255, 0, 0);

        noStroke();
        fill(str);
        rect(xs * d, ys * d, d, d);

        fill(rect[xs][ys]);
        rect(xs * d + 400, ys * d, d, d);
      }
    }
  }
  stroke(0, 0, 255);
  strokeWeight(3);
  line(width/2, 0, width / 2, height);
}