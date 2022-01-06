float counter=0, c;

void setup() {
  size(600, 600);
  noFill();
  stroke(255);
  strokeWeight(1);
}

void draw() {
  background(51);
  translate(width/2, height/2);

  counter += 2;
  c = map(cos(radians(counter)), -1, 1, -470, 470);

  float maxX = (float)180/width*c;
  float maxY = (float)180/width*c;

  for (int i=0; i<360; i+=5) {

    float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxY;

    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount));
    rect(0, 0, 100, 100);
    popMatrix();

    pushMatrix();
    translate(-x, -y);
    rotate(radians(i-frameCount));
    rect(0, 0, 100, 100);
    popMatrix();
  }
  if ((counter >= 0) && (counter <= 720)) {
    saveFrame();
  }
}