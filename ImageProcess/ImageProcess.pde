PImage img;
int w, h;
int scl = 2;
int param = 255;
ArrayList<Integer> colors = new ArrayList<Integer>();
ArrayList<PImage> sections = new ArrayList<PImage>();
void setup(){

img = loadImage("frame011.bmp");
w = 288;
h = 1440;
size(288, 1440);
image(img, 0, 0);
for(int i = 0; i < w; i += scl){
  for(int j = 0; j < h; j += scl){
    PImage c = img.get(i, j, scl, scl);
    //image(c, i + 144, j);
    sections.add(c);
  }
}
int sum = 0, smallest = 255, largest = 0, current = 0;
PImage temp;
for(int i = 0; i < sections.size(); i++){
  temp = sections.get(i);
  sum = 0;
  smallest = 255;
    for(int x = 0; x < scl; x++){
      for(int y = 0; y < scl; y++){
        current = temp.get(x, y);
        if(current < smallest)
          smallest = current;
          
          //print(smallest);
        //if(current > largest)
        //  largest = current;
          
        sum = sum + current;
      }
    }
    int avSum = sum/(scl*scl);
    
    //if(avSum - smallest < param)
   //colors.add(avSum);
   // else 
   colors.add(smallest);
}

//for(int i = 0; i < colors.size(); i++){
//print(colors.get(i));
//}
int index = 0;
for(int i = 144; i < w; i += scl){
  for(int j = 0; j < h; j += scl){
    fill(colors.get(index));
    noStroke();
    index++;
    rect(i,j,scl,scl);
  }
}
}



void draw(){
  

}