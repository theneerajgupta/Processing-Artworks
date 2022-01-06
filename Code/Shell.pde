int num = 40;
float step = 15;
float theta;
float counter=127;

void setup() {
  size( 600, 600); 
  smooth(2);
  strokeWeight(6);
  noFill();
  colorMode(HSB);
}

void draw() {
  frameRate(100);
  background(51);
  translate( width/2, height/2);
  
  for (int i=0; i<num; i++) {
    stroke((255/num*i + counter)%255, 255, 255);
    float radius = i * step;
    float offset = radians(360)/num*i;
    float arc =  map(sin(theta + offset), -1, 1, 1, TWO_PI);
    arc(0, 0, radius, radius, radians(0), arc);
  }
  theta += 0.02;
  counter += 1;
}