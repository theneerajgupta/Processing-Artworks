//Global Initialization
float a = 0;
float s, c;
float dist = 270;
PVector point = new PVector();
PVector prev = new PVector();
PGraphics canvas;
boolean alpha = true;

//Window Setup Function - Execute only once...
void setup() {
  size( 600, 600);
  //noFill();
  stroke(255);
  strokeWeight(2);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(51);
  canvas.endDraw();
}


//Window Draw Function - Executes at every frame... 
void draw() {
  //background(51);
  image(canvas, 0, 0);  
  
  //Move Center from topLeft to Center
  translate( width/2, height/2);

  //Draw Exterior Orbs
  s = dist*sin(radians(a));
  c = -dist*cos(radians(a));
  ellipse( dist, -s, 20, 20);
  ellipse( -dist, c, 20, 20);
  ellipse( s, dist, 20, 20);
  ellipse( -c, -dist, 20, 20);
  
  //line01
  line( dist, -s, -dist, c);
  //line02
  line( s, dist, -c, -dist);
  
  point = matrix( dist, -s, -dist, c, s, dist, -c, -dist);
  ellipse( point.x, point.y, 20, 20);
  
  canvas.beginDraw();
  canvas.translate(width/2, height/2);
  canvas.strokeWeight(5);
  canvas.stroke(255);
  if (alpha == true) {
    prev = point;
    alpha = false;
  }
  canvas.line(point.x, point.y, prev.x, prev.y);
  canvas.endDraw();
  prev = point;
  a++;
  
  // if(a<=360) {
  //   saveFrame();
  // }
  
}

PVector matrix(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  	//This methods calculates the coordinates of the intersection of lines "Line01" and "Line02"
  	//A PVertor is a function that acts as a tuple of 3 values i.e. 'x', 'y', 'z' coordinates
  PVector a = new PVector();
  a.x =(((x1*y2-y1*x2)*(x3-x4) - (x3*y4-y3*x4)*(x1-x2)) / ((x1-x2)*(y3-y4) - (y1-y2)*(x3-x4)));
  a.y =(((x1*y2-y1*x2)*(y3-y4) - (x3*y4-y3*x4)*(y1-y2)) / ((x1-x2)*(y3-y4) - (y1-y2)*(x3-x4)));
  return a;
}