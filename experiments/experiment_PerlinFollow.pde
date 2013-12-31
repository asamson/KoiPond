//Adapted from example sketch "Follow 3" with added original code replacing mouse input with perlin noise, just for fun.
//Demonstration purposes only!

float xProg = 0.0;
float yProg = 0.0;
float[] x = new float[15];
float[] y = new float[15];
float segLength = 5;

void setup() {
  size(640, 360);
  strokeWeight(9);
  stroke(255, 100);
}

void draw() {
  background(0);
  xProg = xProg + random(.01);
  yProg = yProg + random(.01);
  float n = noise(xProg) * width;
  float m = noise(yProg) * height;
  dragSegment(0, n, m);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate((1.5*x), (1.5*y));
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

