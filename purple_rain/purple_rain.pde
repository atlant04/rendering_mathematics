Drop[] rain;
void setup(){
  size(640, 380);
  rain = new Drop[300];
  
  for(int i = 0; i < rain.length; i++){
    rain[i] = new Drop();
  }
}

void draw(){
  background(255, 204, 255);
  
  for(Drop d : rain){
    d.update();
    d.show();
  }
}