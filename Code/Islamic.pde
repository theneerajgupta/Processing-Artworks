float offset;
float angle;
float t;
float num = 5;
float w;
ArrayList<PVector> points;

void setup() {
  size(600, 600);
  w = width / num;
  points = new ArrayList<PVector>();
  for (int i=-1; i<=num; i++) {
    for (int j=-1; j<=num; j++) {
      points.add(new PVector(i*w, j*w));
    }
  }
}

void draw() {
  //frameRate(5);
  background(51);
  stroke(255);
  strokeWeight(2);
  noFill();

  if (angle == radians(45)) {
    angle = radians(46);
  }
  
  angle = map(sin(radians(t)), -1, 1, radians(0), radians(90));
  offset = map(cos(radians(t)), -1, 1, -w/2, w/2);
  for(PVector point : points) {
    drawSquare(point);  
  }
  
  t -= 1;
  
  //if(t < 360){
  //  saveFrame();  
  //}
}

void drawSquare(PVector a_) {
  //beginShape();
  //vertex( a_.x, a_.y);
  //vertex( a_.x + w, a_.y);
  //vertex( a_.x + w, a_.y + w);
  //vertex( a_.x, a_.y + w);
  //endShape(CLOSE);

  //Vertices
  PVector a = new PVector( a_.x, a_.y);
  PVector b = new PVector( a_.x + w, a_.y);
  PVector c = new PVector( a_.x + w, a_.y + w);
  PVector d = new PVector( a_.x, a_.y + w);
  //Midpoints
  PVector ab = new PVector( (a.x + b.x)/2, ((a.y + b.y)/2));
  PVector bc = new PVector( (b.x + c.x)/2, ((b.y + c.y)/2));
  PVector cd = new PVector( (c.x + d.x)/2, ((c.y + d.y)/2));
  PVector da = new PVector( (d.x + a.x)/2, ((d.y + a.y)/2));

  //All Points
  PVector p1 = new PVector(ab.x - offset, ab.y);
  PVector p2 = new PVector(ab.x + offset, ab.y);
  PVector p3 = new PVector(bc.x, bc.y - offset);
  PVector p4 = new PVector(bc.x, bc.y + offset);
  PVector p5 = new PVector(cd.x + offset, cd.y);
  PVector p6 = new PVector(cd.x - offset, cd.y);
  PVector p7 = new PVector(da.x, da.y + offset);
  PVector p8 = new PVector(da.x, da.y - offset);



  PVector i1 = intersect(
    p2.x, p2.y, 
    p2.x + width*cos(angle - radians(0)), p2.y + width*sin(angle - radians(0)), 
    p3.x, p3.y, 
    p3.x + width*sin(angle - radians(0)), p3.y + width*cos(angle - radians(0)));
  //stroke(255);
  //point(i1.x, i1.y);

  PVector i2 = intersect(
    p4.x, p4.y, 
    p4.x + width*cos(angle - radians(90)), p4.y + width*sin(angle - radians(90)), 
    p5.x, p5.y, 
    p5.x + width*sin(angle - radians(90)), p5.y + width*cos(angle - radians(90)));
  //stroke(255, 0, 0);
  //point(i2.x, i2.y);

  PVector i3 = intersect(
    p6.x, p6.y, 
    p6.x + width*cos(angle - radians(180)), p6.y + width*sin(angle - radians(180)), 
    p7.x, p7.y, 
    p7.x + width*sin(angle - radians(180)), p7.y + width*cos(angle - radians(180)));
  //stroke(0, 255, 0);
  //point(i3.x, i3.y);

  PVector i4 = intersect(
    p8.x, p8.y, 
    p8.x + width*cos(angle - radians(270)), p8.y + width*sin(angle - radians(270)), 
    p1.x, p1.y, 
    p1.x + width*sin(angle - radians(270)), p1.y + width*cos(angle - radians(270)));
  //stroke(0, 0, 255);
  //point(i4.x, i4.y);



  line(p2.x, p2.y, i1.x, i1.y);
  line(p3.x, p3.y, i1.x, i1.y);
  line(p4.x, p4.y, i2.x, i2.y);
  line(p5.x, p5.y, i2.x, i2.y);
  line(p6.x, p6.y, i3.x, i3.y);
  line(p7.x, p7.y, i3.x, i3.y);
  line(p8.x, p8.y, i4.x, i4.y);
  line(p1.x, p1.y, i4.x, i4.y);


  //line( ab.x, ab.y, bc.x, bc.y);
  //line( bc.x, bc.y, cd.x, cd.y);
  //line( cd.x, cd.y, da.x, da.y);
  //line( da.x, da.y, ab.x, ab.y);
}





PVector intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  //This methods calculates the coordinates of the intersection of lines "Line01" and "Line02"
  //A PVertor is a function that acts as a tuple of 3 values i.e. 'x', 'y', 'z' coordinates
  PVector a = new PVector();
  a.x =(((x1*y2-y1*x2)*(x3-x4) - (x3*y4-y3*x4)*(x1-x2)) / ((x1-x2)*(y3-y4) - (y1-y2)*(x3-x4)));
  a.y =(((x1*y2-y1*x2)*(y3-y4) - (x3*y4-y3*x4)*(y1-y2)) / ((x1-x2)*(y3-y4) - (y1-y2)*(x3-x4)));
  return a;
}