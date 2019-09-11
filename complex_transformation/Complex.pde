class Complex {
  float real;
  float img;
  int counter;
  PVector dir;
  
  Complex(float real, float img){
    this.real = real;
    this.img = img;
    counter = 1;
  }
 
  
  Complex add(Complex other){
    float real = this.real + other.real;
    float img = this.img + other.img;
    return new Complex(real, img);
  }

  Complex mult(Complex other) {
    float real = this.real * other.real - this.img * other.img;
    float img = this.real * other.img + this.img * other.real;
    return new Complex(real, img);
  }
  
  Complex div(Complex other) {
    float den = pow(other.real, 2) + pow(other.img, 2);
    float real = this.real * other.real + this.img * other.img;
    float img = this.real * other.img - this.img * other.real;
    return new Complex(real / den, img / den);
    
  }
  
  String toString(){
    return "real: " + this.real + " img: " + this.img;
  }
  
  void applyFunction() {
    Complex newP = f(this);
    dir = new PVector(newP.real - this.real, newP.img - this.real);
    dir.div(scale);
  }
  
  void move() {
    if (counter <= scale) {
      this.real += dir.x;
      this.img  += dir.y;
      counter++;
    }
  }
}
