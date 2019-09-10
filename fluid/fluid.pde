
float delta = 0.05;
float dt = 0.1;
float diff = 0;
int N = int(1 / delta);
int size = (N + 2) * (N + 2);

Grid grid;
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();


void setup(){
  size(400, 400);
  grid = new Grid();
  grid.initilize();

}

float time;
void draw(){
  background(255);
  if(mousePressed){
   vehicles.add(new Vehicle());
  }
  
  grid.showVel();
  //grid.show();
  
  for(Vehicle h : vehicles){
    h.show();
    h.update();
    grid.showVel();
  }
  
  time += dt;
}