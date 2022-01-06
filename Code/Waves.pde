int num = 20;
float s = 0;

void setup() {
  size( 600, 600);
}

void draw() {
  background(51);
  float a = map(sin(radians(s)), -1, 1, 0, height);
  float w = width / num;
  fill(27, 255, 255, 50);
  noStroke();
  for (int i=0; i<num; i++) {
    rect(w*i, height, w, -map(sin(radians(s + 10*i)), -1, 1, 0, height)); 
    rect(w*i, height, w, -map(sin(radians(s + 72 + 10*i)), -1, 1, 0, height));
    rect(w*i, height, w, -map(sin(radians(s + 144 + 10*i)), -1, 1, 0, height));
    rect(w*i, height, w, -map(sin(radians(s + 216 + 10*i)), -1, 1, 0, height));
    rect(w*i, height, w, -map(sin(radians(s + 288 + 10*i)), -1, 1, 0, height));
  }

  s -= 1;
  //if (s >= -360) {
  //  saveFrame();  
  //}
}