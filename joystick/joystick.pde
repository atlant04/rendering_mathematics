import processing.serial.*;

Serial port;

void setup(){
  port = new Serial(this, Serial.list()[2], 9600);
  printArray(Serial.list()[2]);

}

void draw(){
  println((float)(port.readBytes()[0]));
  
}