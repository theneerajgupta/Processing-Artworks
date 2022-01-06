float num;
float t=0;

void setup() {
  size( 600, 600);
  num = width / 21;
  //fill(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(51);
  translate( num*0.7, num*0.7);
  for(float i=0; i<width-num/2; i+=num) {
    for(float j=0; j<height-num/2; j+=num) {
      fill((((i*j)%5)*t)%255);
      ellipse( i, j, num-num*0.4*abs(sin(radians((((i*j)%5)*t)))), num-num*0.4*abs(sin(radians(((i*j)%5)*t))));
    }
  }
  t += 0.5;
  if(t<=360) saveFrame();
}