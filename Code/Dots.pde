float radius = 100; 
int n = 8;
float los = radius * (2 * sin(radians(180)/n));
ArrayList<PVector> points = new ArrayList<PVector>();
float theta = 0;

void setup() {
  size( 600, 600);
  ellipseMode(CENTER);
  for(int i=0; i<n; i++) {
    points.add(new PVector( radius*cos(radians((360*i)/n)), radius*sin(radians((360*i)/n))));
  }
}

void draw() {
  background(51);
  translate( width/2, height/2);
  rotate(radians(-90));
  //text(theta, 0, 0);
  
  
  
  for (int i=0; i<n; i++) {
    fill(255);
    //ellipse(points.get(i).x, points.get(i).y, 50, 50);
    
    pushMatrix();
      translate(points.get(i).x, points.get(i).y);
      fill(255);
      noStroke();
      //ellipse(points.get(i).x, points.get(i).y, 10, 10);
      ellipse(los*(pow(-1, i))*cos(radians(theta + (360*i)/n)), los*(pow(-1, i))*sin(radians(theta + (360*i)/n)), 30, 30);
      noFill();
      stroke(255, 255, 255, 100);
      ellipse(0, 0, 2*los, 2*los);
    popMatrix();
    
    

  }    
    
    if(theta % 360 == 0) {
      theta = 0;
    } else {
      if(theta <= 360) saveFrame();
    }
    
    theta += 2;
}