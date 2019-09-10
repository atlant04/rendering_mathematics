//method for mode 1
ArrayList<PVector> dft(ArrayList<Float> vals){
  int N = vals.size();
  ArrayList<PVector> result = new ArrayList<PVector>();
  for(int k = 0; k < N; k++){ //go over every single value in the array
    float real = 0;
    float imag = 0;
    for(int n = 0; n < N; n++){ //the summation part of the equation
      float angle = TWO_PI * k * n / N; //trig input is the same for sin and cos
      float x_n = vals.get(n);
      real += x_n * cos(angle); //add up all the real and imag components
      imag -= x_n * sin(angle);
    }
    
    real /= N; //normalize the resulting vector
    imag /= N;
    
    float amp = sqrt(real * real + imag * imag); //amplitude of the resulting wave is magnitude of the vector
    float fr = k; //frequancy is the k value
    float phase = atan2(imag, real); //phase is the intial angle from the x axis 
    result.add(new PVector(amp, fr, phase));
  }
  return result;
}

//mode 2 method
ArrayList<PVector> dft2(ArrayList<PVector> vals){
  int N = vals.size();
  ArrayList<PVector> result = new ArrayList<PVector>();
  for(int k = 0; k < N; k++){
    float real = 0;
    float imag = 0;
    for(int n = 0; n < N; n++){
      float angle = TWO_PI * k * n / N;
      float a = vals.get(n).x; //get the real part of input
      float b = vals.get(n).y; //get imaginery part of inout
      float c = cos(angle); //calculate cos (real part of transform)
      float d = sin(angle); //calculate i * sin (imaginary part)
      real += (a * c + b * d); //complex number algebra, taking i into account 
      imag += (b * c - a * d);
    }
    
    real /= N;
    imag /= N;
    
    float amp = sqrt(real * real + imag * imag);
    float fr = k;
    float phase = atan2(imag, real);
    result.add(new PVector(amp, fr, phase));
  }
  return result;
}