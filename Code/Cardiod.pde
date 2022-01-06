ArrayList<PVector> points;
int num = 200;
float order = 1;

void setup() {
  //frameRate(10);
  size(800, 800, P3D);
  stroke(255);
  noFill();
  //strokeWeight(0.5);
  smooth();
  points = new ArrayList<PVector>();
  //stroke points
  //for(int i=0; i<num; i++) {
  //  ///ellipse( 350*cos((radians(360)*i)/num), 350*sin((radians(360)*i)/num), 5, 5);
  //  PVector temp = new PVector( 350*cos((radians(360)*i)/num), 350*sin((radians(360)*i)/num));
  //  points.add(temp);
  //}
}

void draw() {
  background(51);
  translate( width/2, height/2);
  
  ellipse( 0, 0, 700, 700);
  
  //test
  //ellipse( 0, 0, 20, 20);
  //for (PVector alpha : points) {
  //  ellipse( alpha.x, alpha.y, 10, 10);  
  //}
  
  //Store Points
  for(int i=0; i<num; i++) {
    ///ellipse( 350*cos((radians(360)*i)/num), 350*sin((radians(360)*i)/num), 5, 5);
    PVector temp = new PVector( 350*cos((radians(360)*i)/num), 350*sin((radians(360)*i)/num));
    points.add(temp);
  }
  
  //draw lines
  for(int i=0; i<num; i++) {
    PVector a = points.get(i);
    PVector b = points.get(round(abs((i * order)%num)));
    line( a.x, a.y, b.x, b.y);
  }
  //text((String)order, 350, 350);
  //order += 0.01;
  if ((order>1) && (order<(num*2))) {
    saveFrame();  
  }
}