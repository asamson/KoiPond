//Simple test of Perlin noise controled 2D movement with stressed and unstressed states for behavior change.
//Mouse click triggers stress/unstress.
//Spacebar displays the current noise source as a pixel array, mapped linearly.  Note contrast and pattern changes between stressed and unstressed.
//Noise is seeded once per run.
//Looks more like a fly than a fish, whatever.  Change stressed and unstressed values to change behavior.
float xPix = 0.0;
float yPix = 0.0;
float xProg = 0.0;                    
float yProg = 0.0;                     
float xUnstressed = .01;
float yUnstressed = .004;
float xStressed = .03;
float yStressed = .01;
float xCoef;
float yCoef;
boolean stressor = false;
boolean mapper = false;

void draw() {
  xProg = xProg + xCoef;
  yProg = yProg + yCoef;
  float n = noise(xProg) * width;
  float m = noise(yProg) * height;

  if (mousePressed == true) {
    stressor = !stressor;
  }
  if (keyPressed == true) {
    if (key== ' ') {
      mapper = !mapper;
    }
  }
  if (stressor == true) {
    xCoef = xStressed;
    yCoef = yStressed;
  }
  else {
    xCoef = xUnstressed;
    yCoef = yUnstressed;
  }
  if (mapper == false) {
    background(255);
    ellipse(n, m, 1, 1);
  }
  else {
    loadPixels();  
    for (int i = 0; i < width*height; i++) {
      pixels[i] = color(noise(xPix)*255, noise(yPix)*255, noise(abs(xPix-yPix))*255);  //maps RGB values with increasing red denoting positive change in X noise, increasing green denoting positive change in Y noise, and increased blue denoting increased difference between X and Y trends. 
      xPix = xPix + xCoef;
      yPix = yPix + yCoef;
    }
    updatePixels();
    xPix = 0.0;
    yPix = 0.0;
    println(mapper);
  }
}

