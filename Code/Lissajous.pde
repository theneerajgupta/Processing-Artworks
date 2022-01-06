float x;
float y;
float R = 300;
float a, b;
float n = 1;
float phi = 20;
float delta = (((n-1)/n) * HALF_PI);
float t;
float px, py;
boolean alpha = true;

PGraphics canvas;

void setup() {
  size(800, 800);
  a = phi; 
  b = phi - 1;
  t = 0;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(51);
  canvas.endDraw();
}

void draw() {

  //background(51);
  image(canvas, 0, 0);
  translate( width/2, height/2);
  t += 0.001;
  x = 375 * sin((a * t) + delta);
  y = 375 * cos(b*t);
  ellipse(x, y, 10, 10);
  canvas.beginDraw();
  canvas.translate(width/2, height/2);
  canvas.strokeWeight(2);
  canvas.stroke(255);
  if (alpha == true) {
    px = x; 
    py = y; 
    alpha = false;
  }
  canvas.line(x, y, px, py);
  canvas.endDraw();
  px = x; 
  py = y;
  //saveFrame();
}
