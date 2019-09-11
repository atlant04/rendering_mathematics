Complex f(Complex x) {
  return x.add(new Complex(1, 1)).div(x.add(new Complex(-1, -1)));
}


float minX = -1;
float maxX = 1;
float minY = -1;
float maxY = 1;

float delta = 0.05;
int scale = 200;

Grid grid;
void setup() {
 size(400, 400);
 grid = new Grid();
 grid.applyFunction();
}

void draw() {
  background(255);
  grid.update();
  grid.show();
}
