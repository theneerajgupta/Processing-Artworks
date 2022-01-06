float theta;
int frms = 500;

void setup() {
  size(540, 540, P2D);
  smooth(8);
}

void draw() {
  background(63, 127, 255);
  translate(width/2, height/2);
  
  // rotating around the center of the image
  rotate(theta*2);
  
  // all variables
  float t = map(sin(theta), -1, 1, 0, 1);
  float y0 = -200 + 200 * t;
  float r0 = 400 * t;
  float y1 = 200 - 200 * (1 - t);
  float r1 = 400 * (1 - t);
  
  
  //backgroundCircle
  fill(255);
  noStroke();
  ellipse(0, 0, 400, 400);
  
  //BlackPart
  fill(0);
  arc(0, 0, 400, 400, PI / 2, TWO_PI-PI / 2);
  arc(0, y0, r0, r0, -PI / 2, PI / 2);
  
  // white part
  pushMatrix();
  translate(0, 400-r1);
  rotate(PI);
  fill(255);
  arc(0, y1, r1, r1, -PI / 2, PI / 2);
  popMatrix();
  
  // white dot in black part
  fill(255);
  ellipse(0, y0, r0 * 0.1, r0 * 0.1);
  // black dot in white part
  fill(0);
  ellipse(0, y1, r1 * 0.1, r1 * 0.1);
  
  // calculating the angle of rotation
  theta += TWO_PI/frms;
}