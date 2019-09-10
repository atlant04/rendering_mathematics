class Complex {
  float real;
  float imag; 

  Complex(float r_, float i_) {
    real = r_;
    imag = i_;
  }

  Complex add(Complex num) {
    return new Complex(this.real + num.real, this.imag + num.imag);
  }

  Complex sub(Complex num) {
    return new Complex(this.real - num.real, this.imag - num.imag);
  }

  Complex inverse(Complex num) {
    return new Complex(num.real, -num.imag);
  }

  Complex div(Complex num) {
    Complex result = this.mult(inverse(num));
    float a = num.real * num.real - (num.imag * num.imag * -1);
    result = result.mult(1 / a);
    return result;
  }

  Complex mult(float n) {
    return new Complex(this.real * n, this.imag * n);
  }

  Complex mult(Complex num) {
    float first = this.real * num.real;  //a1 * a2 
    float second = this.real * num.imag; //a1 * b2 * i 
    float third = this.imag * num.real;
    float forth = this.imag * num.imag * -1; 

    float newReal = first + forth;
    float newImag = second + third;

    return new Complex(newReal, newImag);
  }

  PVector getVector() {
    return new PVector(this.real, this.imag);
  }

  Complex pow(int power) {
    if (power == 0)
      return new Complex(0, 0);
    else {
      Complex result = new Complex(this.real, this.imag);
      for (int i = abs(power); i > 1; i--) {
        result = result.mult(this);
      }
      if (power > 0)
        return result;
      else {
        Complex test = new Complex(1, 0);
        return test.div(result);
      }
    }
  }
}